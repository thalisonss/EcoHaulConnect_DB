-- 1. Setar atributo “ativo” de serviços para false quando cliente for desativado 
 
 CREATE OR REPLACE TRIGGER desativar_servico_de_cliente_inativo
    AFTER UPDATE ON TB_CLIENTES
    FOR EACH ROW
        DECLARE
            v_ativo_cliente TB_CLIENTES.ST_ATIVO%TYPE := :NEW.ST_ATIVO;
            v_id_cliente TB_CLIENTES.ID_CLIENTE%TYPE := :NEW.ID_CLIENTE;
            CURSOR cur_servicos IS SELECT ID_SERVICO FROM TB_SERVICOS WHERE ID_CLIENTE = v_id_cliente;
        BEGIN
           IF v_ativo_cliente = 0 THEN
           		FOR linha_cur_servicos IN cur_servicos LOOP
					UPDATE TB_SERVICOS SET ST_ATIVO = 0 WHERE ID_SERVICO = linha_cur_servicos.ID_SERVICO;
           		END LOOP;
           		
           END IF;
        END;
 

-- 2. Adicionar um log quando o registro da tabela TB_CLIENTES tiver uma alteração.

CREATE OR REPLACE TRIGGER TG_AIUD_TBCLIENTES_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_CLIENTES
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
BEGIN
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_cliente || ',' || :NEW.nm_cliente || ',' || :NEW.nm_email || ',' || :NEW.nr_telefone || ',' || :NEW.nr_cpf || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_cliente || ',' || :OLD.nm_cliente || ',' || :OLD.nm_email || ',' || :OLD.nr_telefone || ',' || :OLD.nr_cpf || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco;
        v_tx_valornovo := :NEW.id_cliente || ',' || :NEW.nm_cliente || ',' || :NEW.nm_email || ',' || :NEW.nr_telefone || ',' || :NEW.nr_cpf || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_cliente || ',' || :OLD.nm_cliente || ',' || :OLD.nm_email || ',' || :OLD.nr_telefone || ',' || :OLD.nr_cpf || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco;
        v_tx_valornovo := NULL;
    END IF;
    
    INSERT INTO TB_LOGS (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao)
    VALUES (SEQ_TB_LOGS.NEXTVAL, :OLD.id_cliente, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE);
END;


-- 3. Atualizar o campo de data de atualização das tabelas

CREATE OR REPLACE TRIGGER atualizar_data_atualizacao
AFTER UPDATE ON TB_SERVICOS
FOR EACH ROW
DECLARE
    v_id_servico TB_SERVICOS.ID_SERVICO%TYPE := :NEW.ID_SERVICO;

BEGIN
    UPDATE TB_SERVICOS SET dt_atualizacao = SYSDATE WHERE ID_SERVICO = v_id_servico; 
END;

-- 4. Desativar serviços se seu tempo de validade vencer 

CREATE OR REPLACE TRIGGER desativar_servico_vencido
    AFTER INSERT OR UPDATE OF NR_VALOR, DT_AGENDAMENTO, ID_TRANSPORTADOR ON TB_SERVICOS
    DECLARE
        CURSOR cur_servicos_vencidos IS
            SELECT ID_SERVICO FROM TB_SERVICOS WHERE DT_VENCIMENTO <= SYSDATE;
        BEGIN 
            FOR linha_cur_servicos_vencidos IN cur_servicos_vencidos LOOP
                UPDATE TB_SERVICOS SET ST_ATIVO = 0 WHERE ID_SERVICO = linha_cur_servicos_vencidos.ID_SERVICO;
            END LOOP;
        END;
