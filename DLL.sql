-- Inserir dados na tabela tb_enderecos
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.nextval, 'Rua Exemplo', '123', 'Bairro Teste', 'Cidade Teste', 'UF', '12345678', 'Complemento', 1, -23.550520, -46.633308);

-- Inserir dados na tabela tb_clientes
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.nextval, 'Nome Cliente', 'cliente@example.com', '123456789', '12345678901', TO_DATE('20000101', 'YYYYMMDD'), 'senha123', 1, seq_tb_enderecos.currval);

-- Inserir dados na tabela tb_servicos
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_atualizacao, dt_vencimento, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.nextval, 100.00, 'CONF123', TO_DATE('20230101', 'YYYYMMDD'), SYSDATE, SYSDATE, TO_DATE('20230115', 'YYYYMMDD'), 1, seq_tb_enderecos.currval, seq_tb_transportadores.nextval, seq_tb_clientes.currval);

-- Inserir dados na tabela tb_transportadores
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.nextval, 'Transportador Teste', 'transportador@example.com', '12345678901', '987654321', TO_DATE('19900101', 'YYYYMMDD'), 'senha456', 1, 10, seq_tb_enderecos.nextval);

-- Inserir dados na tabela tb_itens
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.nextval, 'Item Teste', 20, 30, 40, 5, 'Descrição do item teste', seq_tb_servicos.currval);

-- Inserir dados na tabela tb_logs
INSERT INTO tb_logs (id_log, id_pktabela, tp_exec, tx_valorantigo, tx_valornovo, dt_criacao)
VALUES (seq_tb_logs.nextval, seq_tb_clientes.currval, 'INSERT', NULL, 'Dados inseridos na tabela tb_clientes', SYSDATE);




