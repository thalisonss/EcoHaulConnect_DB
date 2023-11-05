-- 1. Setar atributo “ativo�? de serviços para false quando cliente for desativado 
 
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
 
/
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
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBENDERECOS_LOG 
AFTER INSERT OR UPDATE OR DELETE ON TB_ENDERECOS
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
BEGIN
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_endereco || ',' || :NEW.nm_rua || ',' || :NEW.nr_numero || ',' || :NEW.nm_bairro || ',' || :NEW.nm_cidade || ',' || :NEW.ds_uf || ',' || :NEW.nr_cep || ',' || :NEW.nm_complemento || ',' || :NEW.st_ativo || ',' || :NEW.nr_lat || ',' || :NEW.nr_long;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_endereco || ',' || :OLD.nm_rua || ',' || :OLD.nr_numero || ',' || :OLD.nm_bairro || ',' || :OLD.nm_cidade || ',' || :OLD.ds_uf || ',' || :OLD.nr_cep || ',' || :OLD.nm_complemento || ',' || :OLD.st_ativo || ',' || :OLD.nr_lat || ',' || :OLD.nr_long;
        v_tx_valornovo := :NEW.id_endereco || ',' || :NEW.nm_rua || ',' || :NEW.nr_numero || ',' || :NEW.nm_bairro || ',' || :NEW.nm_cidade || ',' || :NEW.ds_uf || ',' || :NEW.nr_cep || ',' || :NEW.nm_complemento || ',' || :NEW.st_ativo || ',' || :NEW.nr_lat || ',' || :NEW.nr_long;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_endereco || ',' || :OLD.nm_rua || ',' || :OLD.nr_numero || ',' || :OLD.nm_bairro || ',' || :OLD.nm_cidade || ',' || :OLD.ds_uf || ',' || :OLD.nr_cep || ',' || :OLD.nm_complemento || ',' || :OLD.st_ativo || ',' || :OLD.nr_lat || ',' || :OLD.nr_long;
        v_tx_valornovo := NULL;
    END IF;

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_endereco, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE);
END;
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBSERVICOS_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_SERVICOS
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
BEGIN
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_servico || ',' || :NEW.nr_valor || ',' || :NEW.cd_confirmacao || ',' || TO_CHAR(:NEW.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_atualizacao, 'YYYY-MM-DD') || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco || ',' || :NEW.id_transportador || ',' || :NEW.id_cliente;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_servico || ',' || :OLD.nr_valor || ',' || :OLD.cd_confirmacao || ',' || TO_CHAR(:OLD.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_atualizacao, 'YYYY-MM-DD') || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco || ',' || :OLD.id_transportador || ',' || :OLD.id_cliente;
        v_tx_valornovo := :NEW.id_servico || ',' || :NEW.nr_valor || ',' || :NEW.cd_confirmacao || ',' || TO_CHAR(:NEW.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_atualizacao, 'YYYY-MM-DD') || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco || ',' || :NEW.id_transportador || ',' || :NEW.id_cliente;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_servico || ',' || :OLD.nr_valor || ',' || :OLD.cd_confirmacao || ',' || TO_CHAR(:OLD.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_atualizacao, 'YYYY-MM-DD') || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco || ',' || :OLD.id_transportador || ',' || :OLD.id_cliente;
        v_tx_valornovo := NULL;
    END IF;

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_servico, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE);
END;
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBTRANSPORTADORES_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_TRANSPORTADORES
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
BEGIN   
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_transportador || ',' || :NEW.nm_transportador || ',' || :NEW.nm_email || ',' || :NEW.nr_cpf || ',' || :NEW.nr_telefone || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_ativo || ',' || :NEW.nr_raio_servico || ',' || :NEW.id_endereco;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_transportador || ',' || :OLD.nm_transportador || ',' || :OLD.nm_email || ',' || :OLD.nr_cpf || ',' || :OLD.nr_telefone || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_ativo || ',' || :OLD.nr_raio_servico || ',' || :OLD.id_endereco;
        v_tx_valornovo := :NEW.id_transportador || ',' || :NEW.nm_transportador || ',' || :NEW.nm_email || ',' || :NEW.nr_cpf || ',' || :NEW.nr_telefone || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_ativo || ',' || :NEW.nr_raio_servico || ',' || :NEW.id_endereco;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_transportador || ',' || :OLD.nm_transportador || ',' || :OLD.nm_email || ',' || :OLD.nr_cpf || ',' || :OLD.nr_telefone || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_ativo || ',' || :OLD.nr_raio_servico || ',' || :OLD.id_endereco;
        v_tx_valornovo := NULL;
    END IF;

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_transportador, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSTIMESTAMP);
END;

/
-- 3. Atualizar o campo de data de atualização das tabelas

CREATE OR REPLACE TRIGGER atualizar_data_atualizacao
FOR UPDATE OF nr_valor, cd_confirmacao, dt_agendamento, st_ativo, id_transportador
ON TB_SERVICOS COMPOUND TRIGGER
    v_id_servico TB_SERVICOS.ID_SERVICO%TYPE;

AFTER EACH ROW IS
BEGIN
    v_id_servico := :NEW.ID_SERVICO;
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
    UPDATE TB_SERVICOS SET dt_atualizacao = SYSDATE WHERE ID_SERVICO = v_id_servico;
END AFTER STATEMENT;

END atualizar_data_atualizacao;
/
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
