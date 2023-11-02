-- Inserir dados na tb_enderecos
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua A', '123', 'Bairro A', 'Cidade A', 'UF', '12345678', 'Complemento A', 1, 12.345, 67.890);

-- Inserir dados na tb_clientes
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Cliente A', 'clienteA@example.com', '123456789', '12345678901', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'senha123', 1, 1);

-- Inserir dados na tb_transportadores
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Transportador A', 'transportadorA@example.com', '23456789012', '987654321', TO_DATE('1985-05-05', 'YYYY-MM-DD'), 'senha456', 1, 50, 2);

-- Inserir dados na tb_servicos
-- Assumindo que você tem os IDs de um cliente, um endereço e um transportador
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_atualizacao, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 100.00, 'ABC123', TO_DATE('2023-11-01', 'YYYY-MM-DD'), SYSDATE, SYSDATE, 1, 1, 1, 1);

-- Inserir dados na tb_itens
-- Assumindo que você tem o ID de um serviço
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Caixa', 10, 20, 15, 5, 'Descrição do item', 1);


-- Inserir mais dados na tb_enderecos
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua B', '456', 'Bairro B', 'Cidade B', 'UF', '23456789', 'Complemento B', 1, 23.456, 56.789);

-- Inserir mais dados na tb_clientes
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Cliente B', 'clienteB@example.com', '234567890', '23456789012', TO_DATE('1988-03-15', 'YYYY-MM-DD'), 'senha789', 1, 2);

-- Inserir mais dados na tb_transportadores
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Transportador B', 'transportadorB@example.com', '34567890123', '876543210', TO_DATE('1975-12-10', 'YYYY-MM-DD'), 'senha012', 1, 45, 1);

-- Inserir mais dados na tb_servicos
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_atualizacao, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 150.00, 'DEF456', TO_DATE('2023-11-05', 'YYYY-MM-DD'), SYSDATE, SYSDATE, 1, 2, 2, 2);

-- Inserir mais dados na tb_itens
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Pacote', 8, 18, 12, 3, 'Outra descrição do item', 2);



-- Inserir mais dados na tb_enderecos
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua C', '789', 'Bairro C', 'Cidade C', 'UF', '34567890', 'Complemento C', 1, 34.567, 67.890);

-- Inserir mais dados na tb_clientes
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Cliente C', 'clienteC@example.com', '345678901', '34567890123', TO_DATE('1982-07-20', 'YYYY-MM-DD'), 'senhaabc', 1, 3);

-- Inserir mais dados na tb_transportadores
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Transportador C', 'transportadorC@example.com', '45678901234', '9876543210', TO_DATE('1980-11-25', 'YYYY-MM-DD'), 'senhaxyz', 1, 60, 3);

-- Inserir mais dados na tb_servicos
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_criacao, dt_atualizacao, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 200.00, 'GHI789', TO_DATE('2023-11-10', 'YYYY-MM-DD'), SYSDATE, SYSDATE, 1, 3, 3, 3);

-- Inserir mais dados na tb_itens
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens.NEXTVAL, 'Envelope', 5, 10, 0.5, 0.1, 'Descrição do envelope', 3);

SELECT * FROM tb_logs;


