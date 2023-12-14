SET SERVEROUTPUT ON;

DECLARE
    table_count NUMBER;
    seq_count NUMBER;
    constraint_count NUMBER;
BEGIN
    -- Verifica e cria a tabela tb_clientes
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_CLIENTES';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_CLIENTES CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_CLIENTES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_clientes (
        id_cliente NUMBER(19,0) PRIMARY KEY,
        nm_cliente VARCHAR2(30) NOT NULL,         
        nm_email VARCHAR2(100) UNIQUE NOT NULL,
        nr_telefone VARCHAR2(11) UNIQUE NOT NULL,
        nr_cpf VARCHAR2(11) UNIQUE NOT NULL,
        dt_nascimento DATE NOT NULL,
        ds_senha VARCHAR2(150) NOT NULL,
        st_status CHAR(2),
        st_ativo NUMBER(1,0) NOT NULL,
        id_endereco NUMBER(19,0) NOT NULL
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_CLIENTES criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;

    -- Verifica e cria a tabela tb_enderecos
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_ENDERECOS';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_ENDERECOS CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_ENDERECOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_enderecos (
        id_endereco NUMBER(19,0) PRIMARY KEY,
        nm_rua VARCHAR2(100) NOT NULL,
        nr_numero VARCHAR2(100) NOT NULL,
        nm_bairro VARCHAR2(100) NOT NULL,
        nm_cidade VARCHAR2(100) NOT NULL,
        ds_uf VARCHAR2(2) NOT NULL,
        nr_cep VARCHAR2(8) NOT NULL,
        nm_complemento VARCHAR2(100),
        st_ativo NUMBER(1,0) NOT NULL,
        nr_lat FLOAT(53) NOT NULL,
        nr_long FLOAT(53) NOT NULL
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_ENDERECOS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;

    -- Verifica e cria a tabela tb_servicos
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_SERVICOS';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_SERVICOS CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_SERVICOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_servicos(
        id_servico NUMBER(19,0) PRIMARY KEY,
        nr_valor NUMBER(38,2) NOT NULL,
        cd_confirmacao VARCHAR2(12),
        dt_agendamento DATE NOT NULL,
        dt_criacao DATE NOT NULL,
        dt_atualizacao DATE NOT NULL,
        dt_vencimento DATE NOT NULL,
        dt_aceitacao DATE,
        dt_cancelamento DATE,
        st_conclusao CHAR(2),
        st_ativo NUMBER(1,0) NOT NULL,
        id_endereco NUMBER(19,0) NOT NULL,
        id_transportador NUMBER(19,0),
        id_cliente NUMBER(19,0) NOT NULL   
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_SERVICOS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;

    -- Verifica e cria a tabela tb_transportadores
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_TRANSPORTADORES';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_TRANSPORTADORES CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_TRANSPORTADORES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_transportadores(
        id_transportador NUMBER(19,0) PRIMARY KEY,
        nm_transportador VARCHAR2(30) NOT NULL,
        nm_email VARCHAR2(100) NOT NULL,
        nr_cpf VARCHAR2(11) NOT NULL,
        nr_telefone VARCHAR2(11) NOT NULL,
        dt_nascimento DATE NOT NULL,
        ds_senha VARCHAR2(150) NOT NULL,
        st_status CHAR(2),
        st_ativo NUMBER(1,0) NOT NULL,
        nr_raio_servico NUMBER(10,0) NOT NULL,
        id_endereco NUMBER(19,0) NOT NULL
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_TRANSPORTADORES criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;

    -- Verifica e cria a tabela tb_itens
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_ITENS';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_ITENS CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_ITENS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_itens (
        id_item NUMBER(19,0) PRIMARY KEY,
        tp_item VARCHAR2(200) NOT NULL,
        nr_altura NUMBER(10,0),
        nr_comprimento NUMBER(10,0),
        nr_largura NUMBER(10,0),
        nr_peso NUMBER(10,0),
        ds_descricao VARCHAR2(255),
        id_servico NUMBER(19,0) NOT NULL
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_ITENS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;

    -- Verifica e cria a tabela tb_logs
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_LOGS';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_LOGS CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_LOGS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_logs (
        id_log NUMBER(19,0) PRIMARY KEY,
        nm_tabela VARCHAR2(30),
        id_pktabela NUMBER(19,0),
        tp_exec CHAR(6),
        tx_valorantigo CLOB,
        tx_valornovo CLOB,
        dt_criacao DATE
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_LOGS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;
    
    -- Verifica e cria a tabela tb_descricoes
    SELECT COUNT(*)
    INTO table_count
    FROM user_tables
    WHERE table_name = 'TB_DESCRICOES';

    IF table_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TB_DESCRICOES CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Tabela TB_DESCRICOES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE TABLE tb_descricoes(
        id_descricao CHAR(2) NOT NULL,
        nm_atributo VARCHAR2(30) NOT NULL,
        nm_descricao VARCHAR2(30) NOT NULL,
        st_ativo NUMBER(1,0) NOT NULL,
        dt_atualizacao DATE NOT NULL
    )';

    DBMS_OUTPUT.PUT_LINE('Tabela TB_DESCRICOES criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    table_count := 0;
    
    -- RestriÁ„o de chave estrangeira na tabela tb_clientes
    SELECT COUNT(*)
    INTO constraint_count
    FROM user_constraints
    WHERE constraint_name = 'FK_TB_CLIENTES_TB_ENDERECOS';

    IF constraint_count > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TB_CLIENTES DROP CONSTRAINT FK_TB_CLIENTES_TB_ENDERECOS';
        DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_CLIENTES_TB_ENDERECOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    ALTER TABLE TB_CLIENTES
    ADD CONSTRAINT fk_tb_clientes_tb_enderecos
    FOREIGN KEY (id_endereco)
    REFERENCES tb_enderecos(id_endereco)';

    DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_CLIENTES_TB_ENDERE«OS adicionada.');
    
    constraint_count := 0;

    -- RestriÁ„o de chave estrangeira na tabela tb_servicos para tb_clientes
    SELECT COUNT(*)
    INTO constraint_count
    FROM user_constraints
    WHERE constraint_name = 'FK_TB_SERVICOS_TB_CLIENTE';

    IF constraint_count > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TB_SERVICOS DROP CONSTRAINT FK_TB_SERVICOS_TB_CLIENTE';
        DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_CLIENTE removida.');
    END IF;

    EXECUTE IMMEDIATE '
    ALTER TABLE TB_SERVICOS
    ADD CONSTRAINT fk_tb_servicos_tb_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES tb_clientes(id_cliente)';

    DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_CLIENTE adicionada.');
    
    constraint_count := 0;

    -- RestriÁ„o de chave estrangeira na tabela tb_servicos para tb_enderecos
    SELECT COUNT(*)
    INTO constraint_count
    FROM user_constraints
    WHERE constraint_name = 'FK_TB_SERVICOS_TB_ENDERECOS';

    IF constraint_count > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TB_SERVICOS DROP CONSTRAINT FK_TB_SERVICOS_TB_ENDERECOS';
        DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_ENDERECOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    ALTER TABLE TB_SERVICOS
    ADD CONSTRAINT fk_tb_servicos_tb_enderecos
    FOREIGN KEY (id_endereco)
    REFERENCES tb_enderecos(id_endereco)';

    DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_ENDERECOS adicionada.');
    
    constraint_count := 0;

    -- RestriÁ„o de chave estrangeira na tabela tb_servicos para tb_transportadores
    SELECT COUNT(*)
    INTO constraint_count
    FROM user_constraints
    WHERE constraint_name = 'FK_TB_SERVICOS_TB_TRANSPORTADORES';

    IF constraint_count > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TB_SERVICOS DROP CONSTRAINT FK_TB_SERVICOS_TB_TRANSPORTADORES';
        DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_TRANSPORTADORES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    ALTER TABLE TB_SERVICOS
    ADD CONSTRAINT fk_tb_servicos_tb_transportadores
    FOREIGN KEY (id_transportador)
    REFERENCES tb_transportadores(id_transportador)';

    DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_SERVICOS_TB_TRANSPORTADORES adicionada.');
    
    constraint_count := 0;

    -- RestriÁ„o de chave estrangeira na tabela tb_itens para tb_servicos
    SELECT COUNT(*)
    INTO constraint_count
    FROM user_constraints
    WHERE constraint_name = 'FK_TB_ITENS_TB_TRANSPORTADORES';

    IF constraint_count > 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TB_ITENS DROP CONSTRAINT FK_TB_ITENS_TB_TRANSPORTADORES';
        DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_ITENS_TB_TRANSPORTADORES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    ALTER TABLE TB_ITENS
    ADD CONSTRAINT fk_tb_itens_tb_transportadores
    FOREIGN KEY (id_servico)
    REFERENCES tb_servicos(id_servico)';

    DBMS_OUTPUT.PUT_LINE('RestriÁ„o FK_TB_ITENS_TB_TRANSPORTADORES adicionada.');
    
    constraint_count := 0;
    
    -- Verifica e cria a sequence seq_tb_clientes
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_CLIENTES';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_CLIENTES';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_CLIENTES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_clientes
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_CLIENTES criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;

    -- Verifica e cria a sequence seq_tb_enderecos
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_ENDERECOS';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_ENDERECOS';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_ENDERECOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_enderecos
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_ENDERECOS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;

    -- Verifica e cria a sequence seq_tb_servicos
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_SERVICOS';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_SERVICOS';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_SERVICOS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_servicos
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_SERVICOS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;

    -- Verifica e cria a sequence seq_tb_transportadores
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_TRANSPORTADORES';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_TRANSPORTADORES';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_TRANSPORTADORES removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_transportadores
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_TRANSPORTADORES criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;

    -- Verifica e cria a sequence seq_tb_itens
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_ITENS';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_ITENS';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_ITENS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_itens
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_ITENS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;

    -- Verifica e cria a sequence seq_tb_logs
    SELECT COUNT(*)
    INTO seq_count
    FROM user_sequences
    WHERE sequence_name = 'SEQ_TB_LOGS';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_TB_LOGS';
        DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_LOGS removida.');
    END IF;

    EXECUTE IMMEDIATE '
    CREATE SEQUENCE seq_tb_logs
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Sequence SEQ_TB_LOGS criada.');
    
    -- Reinicializa a vari·vel seq_count para a prÛxima verificaÁ„o
    seq_count := 0;
    
END;
/

-- 1. Setar atributo ‚Äúativo‚Ä? de servi√ßos para false quando cliente for desativado 
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
-- 2. Adicionar um log quando o registro da tabela TB_CLIENTES tiver uma altera√ß√£o.
CREATE OR REPLACE TRIGGER TG_AIUD_TBCLIENTES_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_CLIENTES
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
    v_nm_tabela VARCHAR2(30) := 'TB_CLIENTES';
BEGIN
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_cliente || ',' || :NEW.nm_cliente || ',' || :NEW.nm_email || ',' || :NEW.nr_telefone || ',' || :NEW.nr_cpf || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_status || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_cliente || ',' || :OLD.nm_cliente || ',' || :OLD.nm_email || ',' || :OLD.nr_telefone || ',' || :OLD.nr_cpf || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_status || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco;
        v_tx_valornovo := :NEW.id_cliente || ',' || :NEW.nm_cliente || ',' || :NEW.nm_email || ',' || :NEW.nr_telefone || ',' || :NEW.nr_cpf || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_status || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_cliente || ',' || :OLD.nm_cliente || ',' || :OLD.nm_email || ',' || :OLD.nr_telefone || ',' || :OLD.nr_cpf || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_status || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco;
        v_tx_valornovo := NULL;
    END IF;
    
    INSERT INTO TB_LOGS (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao, nm_tabela)
    VALUES (SEQ_TB_LOGS.NEXTVAL, :OLD.id_cliente, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE, v_nm_tabela);
END;
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBENDERECOS_LOG 
AFTER INSERT OR UPDATE OR DELETE ON TB_ENDERECOS
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
    v_nm_tabela VARCHAR2(30) := 'TB_ENDERECOS';
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

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao, nm_tabela)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_endereco, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE, v_nm_tabela);
END;
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBSERVICOS_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_SERVICOS
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
    v_nm_tabela VARCHAR2(30) := 'TB_SERVICOS';
BEGIN
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_servico || ',' || :NEW.nr_valor || ',' || :NEW.cd_confirmacao || ',' || TO_CHAR(:NEW.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_atualizacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_vencimento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_aceitacao, 'YYYY-MM-DD') || ',' || :NEW.st_conclusao || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco || ',' || :NEW.id_transportador || ',' || :NEW.id_cliente;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_servico || ',' || :OLD.nr_valor || ',' || :OLD.cd_confirmacao || ',' || TO_CHAR(:OLD.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_atualizacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_vencimento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_aceitacao, 'YYYY-MM-DD') || ',' || :OLD.st_conclusao || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco || ',' || :OLD.id_transportador || ',' || :OLD.id_cliente;
        v_tx_valornovo := :NEW.id_servico || ',' || :NEW.nr_valor || ',' || :NEW.cd_confirmacao || ',' || TO_CHAR(:NEW.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_atualizacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_vencimento, 'YYYY-MM-DD') || ',' || TO_CHAR(:NEW.dt_aceitacao, 'YYYY-MM-DD') || ',' || :NEW.st_conclusao || ',' || :NEW.st_ativo || ',' || :NEW.id_endereco || ',' || :NEW.id_transportador || ',' || :NEW.id_cliente;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_servico || ',' || :OLD.nr_valor || ',' || :OLD.cd_confirmacao || ',' || TO_CHAR(:OLD.dt_agendamento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_criacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_atualizacao, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_vencimento, 'YYYY-MM-DD') || ',' || TO_CHAR(:OLD.dt_aceitacao, 'YYYY-MM-DD') || ',' || :OLD.st_conclusao || ',' || :OLD.st_ativo || ',' || :OLD.id_endereco || ',' || :OLD.id_transportador || ',' || :OLD.id_cliente;
        v_tx_valornovo := NULL;
    END IF;

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao, nm_tabela)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_servico, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSDATE, v_nm_tabela);
END;
/
CREATE OR REPLACE TRIGGER TG_AIUD_TBTRANSPORTADORES_LOG
AFTER INSERT OR UPDATE OR DELETE ON TB_TRANSPORTADORES
FOR EACH ROW
DECLARE
    v_tp_exec CHAR(6);
    v_tx_valorantigo CLOB;
    v_tx_valornovo CLOB;
    v_nm_tabela VARCHAR2(30) := 'TB_TRANSPORTADORES';
BEGIN   
    IF INSERTING THEN
        v_tp_exec := 'INSERT';
        v_tx_valorantigo := NULL;
        v_tx_valornovo := :NEW.id_transportador || ',' || :NEW.nm_transportador || ',' || :NEW.nm_email || ',' || :NEW.nr_cpf || ',' || :NEW.nr_telefone || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_status || ',' || :NEW.st_ativo || ',' || :NEW.nr_raio_servico || ',' || :NEW.id_endereco;
    ELSIF UPDATING THEN
        v_tp_exec := 'UPDATE';
        v_tx_valorantigo := :OLD.id_transportador || ',' || :OLD.nm_transportador || ',' || :OLD.nm_email || ',' || :OLD.nr_cpf || ',' || :OLD.nr_telefone || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_status || ',' || :OLD.st_ativo || ',' || :OLD.nr_raio_servico || ',' || :OLD.id_endereco;
        v_tx_valornovo := :NEW.id_transportador || ',' || :NEW.nm_transportador || ',' || :NEW.nm_email || ',' || :NEW.nr_cpf || ',' || :NEW.nr_telefone || ',' || TO_CHAR(:NEW.dt_nascimento, 'YYYY-MM-DD') || ',' || :NEW.ds_senha || ',' || :NEW.st_status || ',' ||  :NEW.st_ativo || ',' || :NEW.nr_raio_servico || ',' || :NEW.id_endereco;
    ELSE
        v_tp_exec := 'DELETE';
        v_tx_valorantigo := :OLD.id_transportador || ',' || :OLD.nm_transportador || ',' || :OLD.nm_email || ',' || :OLD.nr_cpf || ',' || :OLD.nr_telefone || ',' || TO_CHAR(:OLD.dt_nascimento, 'YYYY-MM-DD') || ',' || :OLD.ds_senha || ',' || :OLD.st_status || ',' || :OLD.st_ativo || ',' || :OLD.nr_raio_servico || ',' || :OLD.id_endereco;
        v_tx_valornovo := NULL;
    END IF;

    INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao, nm_tabela)
    VALUES (seq_tb_logs.NEXTVAL, :OLD.id_transportador, v_tp_exec, v_tx_valorantigo, v_tx_valornovo, SYSTIMESTAMP, v_nm_tabela);
END;
/
-- 3. Atualizar o campo de data de atualiza√ß√£o das tabelas
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
-- 4. Desativar servi√ßos se seu tempo de validade vencer 
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
/
--TB_ENDERECOS
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. J˙lio de Castilhos', '809', 'Belenzinho', 'S„o Paulo', 'SP', '03059000', NULL, 1, -23.5410875, -46.6127457);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Estr. Velha de Itapevi', '4296', 'Vila Militar', 'Barueri', 'SP', '06437240', NULL, 1, -23.551308, -46.8787357);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. Jo„o Wagner Wey', '781', 'Jardim America', 'Sorocaba', 'SP', '18046665', NULL, 1, -23.5230578, -47.473603);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. das Avencas', '2137', 'St. Comercial', 'Sinop', 'MT', '78550178', NULL, 1, -11.8512038, -55.5091661);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. dos Cajueiros', '2153', 'St. Comercial', 'Sinop', 'MT', '78550162', NULL, 1, -11.8484295, -55.5148156);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua ItinguÁu', '148', 'Vila RÈ', 'S„o Paulo', 'SP', '03658010', 'letra A', 1, -23.521942, -46.5179311);

--TB_CLIENTES
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_status, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Jo„o Silva', 'joao.silva@gmail.com', '11912345678', '12345678901', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'teste', NULL, 1, 1);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_status, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Maria Souza', 'maria.souza@gmail.com', '11980802020', '10120230340', TO_DATE('21/07/1998', 'DD/MM/YYYY'), 'teste', NULL, 1, 2);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_status, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Pedro Santos', 'pedro.santos@gmail.com', '11921215454', '11122233344', TO_DATE('08/03/2001', 'DD/MM/YYYY'), 'teste', NULL, 1, 3);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_status, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Kelly Almeida', 'almeida.kelly@gmail.com', '11998765432', '90080070060', TO_DATE('07/12/1989', 'DD/MM/YYYY'), 'teste', NULL, 1, 4);

--TB_TRANSPORTADORES
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_status, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Guilherme Pereira', 'pereira_guilherme@gmail.com', '66644455580', '11920203131', TO_DATE('15/05/1990', 'DD/MM/YYYY'), 'teste', '01', 1, 20, 5);

INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_status, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Alexandre Gouveia', 'gou_alex@gmail.com', '15995175335', '11965445685', TO_DATE('30/12/1980', 'DD/MM/YYYY'), 'teste', '02', 1, 40, 6);

--TB_SERVICOS
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_vencimento, dt_aceitacao, st_conclusao, st_ativo, id_endereco, id_transportador, id_cliente, dt_atualizacao)
VALUES (seq_tb_servicos.NEXTVAL, 100.50, '21A35B', TO_DATE('15/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('14/12/2023 22:10:11.996', 'DD/MM/YYYY HH24:MI:SS.FF3'), TO_DATE('20/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('14/12/2023 22:10:11.996', 'DD/MM/YYYY HH24:MI:SS.FF3'), '01', 1, 1, 1, 1, SYSTIMESTAMP);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_vencimento, dt_aceitacao, st_conclusao, st_ativo, id_endereco, id_transportador, id_cliente, dt_atualizacao)
VALUES (seq_tb_servicos.NEXTVAL, 21.53, 'BB21AA', TO_DATE('12/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('14/12/2023 22:10:11.996', 'DD/MM/YYYY HH24:MI:SS.FF3'), TO_DATE('17/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('05/12/2023 05:29:59.999', 'DD/MM/YYYY HH24:MI:SS.FF3'), NULL, 1, 2, 1, 2, SYSTIMESTAMP);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_vencimento, dt_aceitacao, st_conclusao, st_ativo, id_endereco, id_transportador, id_cliente, dt_atualizacao)
VALUES (seq_tb_servicos.NEXTVAL, 10.93, 'ZZZ214', TO_DATE('11/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('14/12/2023 22:10:11.996', 'DD/MM/YYYY HH24:MI:SS.FF3'), TO_DATE('16/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('09/12/2023 09:12:33.898', 'DD/MM/YYYY HH24:MI:SS.FF3'), '02', 1, 3, 2, 3, SYSTIMESTAMP);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_vencimento, dt_aceitacao, st_conclusao, st_ativo, id_endereco, id_transportador, id_cliente, dt_atualizacao)
VALUES (seq_tb_servicos.NEXTVAL, 9.05, '995TY1', TO_DATE('25/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('14/12/2023 22:10:11.996', 'DD/MM/YYYY HH24:MI:SS.FF3'), TO_DATE('30/12/2023', 'DD/MM/YYYY'), TO_TIMESTAMP('22/12/2023 12:34:56.789', 'DD/MM/YYYY HH24:MI:SS.FF3'), '01',  1, 4, 2, 4, SYSTIMESTAMP);

--TB_ITENS
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Eletronico', 5.5, 22, 19.5, 0.5, 'Placa M„e Centrium Micro ATX LGA 1151 DDR4 C2018', 1);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Eletronico', 28, 11.67, 4.4, 0.4, 'Zotac GTX 1650', 1);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Moveis', 78, 140, 240, 35, 'Sof· 2 Lugares Europa Linho Bege ADJ Decor', 2);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Moveis', 200, 180, 46.5, 30, 'Guarda Roupa Casal 6 Portas 3 Gavetas Toledo MX MÛveis', 3);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Moveis', 90, 90, 40, 20, 'CÙmoda Sapateira 1 Porta 5 Gavetas Zurique EvidÍncia MÛveis', 3);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Moveis', 116, 136, 45, 38, 'CÙmoda 8 Gavetas Doble Albatroz MÛveis', 4);

--TB_DESCRICOES
INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('01', 'st_status', 'EM ANALISE', 1, SYSTIMESTAMP);

INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('02', 'st_status', 'APROVADO', 1, SYSTIMESTAMP);

INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('03', 'st_status', 'REPROVADO', 1, SYSTIMESTAMP);

INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('04', 'st_status', 'BANIDO', 1, SYSTIMESTAMP);

INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('01', 'st_conclusao', 'CANCELADO', 1, SYSTIMESTAMP);

INSERT INTO tb_descricao (id_descricao, nm_atributo, nm_descricao, st_ativo, dt_atualizacao)
VALUES ('02', 'st_conclusao', 'CONCLUIDO', 1, SYSTIMESTAMP);