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