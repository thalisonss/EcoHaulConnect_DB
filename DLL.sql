INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua dos Bobos', '0', 'Vila Esperança', 'São Paulo', 'SP', '00000000', NULL, 1, -23.5505, -46.6333);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua dos Alfeneiros', '4', 'Vila Esperança', 'São Paulo', 'SP', '00000000', 'Apto 3', 1, -23.5505, -46.6333);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua dos Girassóis', '10', 'Vila Esperança', 'São Paulo', 'SP', '00000000', NULL, 1, -23.5505, -46.6333);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua dos Cravos', '20', 'Vila Esperança', 'São Paulo', 'SP', '00000000', NULL, 1, -23.5505, -46.6333);

UPDATE tb_enderecos
SET nm_rua = 'Rua Alterada', nr_numero = '21', nm_bairro = 'Vila Alterado', nm_cidade = 'São Paulo', ds_uf = 'SP', nr_cep = '00000000', nm_complemento = 'Alterado', st_ativo = 1, nr_lat = -23.5505, nr_long = -46.6333
WHERE id_endereco = 1;

DELETE FROM tb_enderecos
WHERE id_endereco = 2;

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'João Silva', 'joao.silva@gmail.com', '11999999999', '12345678901', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'senha123', 1, 1);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Maria Souza', 'maria.souza@gmail.com', '11999999998', '10987654321', TO_DATE('02/02/1991', 'DD/MM/YYYY'), 'senha456', 1, 3);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Pedro Santos', 'pedro.santos@gmail.com', '11999999997', '98765432109', TO_DATE('03/03/1992', 'DD/MM/YYYY'), 'senha789', 1, 4);

UPDATE tb_clientes
SET nm_cliente = 'Ana Maria Cardoso'
WHERE id_cliente = 1;

DELETE FROM tb_clientes
WHERE id_cliente = 3;





