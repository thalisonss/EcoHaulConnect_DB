--TB_ENDERECOS
INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. Júlio de Castilhos', '809', 'Belenzinho', 'São Paulo', 'SP', '03059000', NULL, 1, -23.5410875, -46.6127457);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Estr. Velha de Itapevi', '4296', 'Vila Militar', 'Barueri', 'SP', '06437240', NULL, 1, -23.551308, -46.8787357);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. João Wagner Wey', '781', 'Jardim America', 'Sorocaba', 'SP', '18046665', NULL, 1, -23.5230578, -47.473603);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. das Avencas', '2137', 'St. Comercial', 'Sinop', 'MT', '78550178', NULL, 1, -11.8512038, -55.5091661);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'R. dos Cajueiros', '2153', 'St. Comercial', 'Sinop', 'MT', '78550162', NULL, 1, -11.8484295, -55.5148156);

INSERT INTO tb_enderecos (id_endereco, nm_rua, nr_numero, nm_bairro, nm_cidade, ds_uf, nr_cep, nm_complemento, st_ativo, nr_lat, nr_long)
VALUES (seq_tb_enderecos.NEXTVAL, 'Rua Itinguçu', '148', 'Vila Ré', 'São Paulo', 'SP', '03658010', 'letra A', 1, -23.521942, -46.5179311);

--TB_CLIENTES
INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'João Silva', 'joao.silva@gmail.com', '11912345678', '12345678901', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'teste', 1, 1);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Maria Souza', 'maria.souza@gmail.com', '11980802020', '10120230340', TO_DATE('21/07/1998', 'DD/MM/YYYY'), 'teste', 1, 2);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Pedro Santos', 'pedro.santos@gmail.com', '11921215454', '11122233344', TO_DATE('08/03/2001', 'DD/MM/YYYY'), 'teste', 1, 3);

INSERT INTO tb_clientes (id_cliente, nm_cliente, nm_email, nr_telefone, nr_cpf, dt_nascimento, ds_senha, st_ativo, id_endereco)
VALUES (seq_tb_clientes.NEXTVAL, 'Kelly Almeida', 'almeida.kelly@gmail.com', '11998765432', '90080070060', TO_DATE('07/12/1989', 'DD/MM/YYYY'), 'teste', 1, 4);

--TB_TRANSPORTADORES
INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Guilherme Pereira', 'pereira_guilherme@gmail.com', '66644455580', '11920203131', TO_DATE('15/05/1990', 'DD/MM/YYYY'), 'teste', 1, 20, 5);

INSERT INTO tb_transportadores (id_transportador, nm_transportador, nm_email, nr_cpf, nr_telefone, dt_nascimento, ds_senha, st_ativo, nr_raio_servico, id_endereco)
VALUES (seq_tb_transportadores.NEXTVAL, 'Alexandre Gouveia', 'gou_alex@gmail.com', '15995175335', '11965445685', TO_DATE('30/12/1980', 'DD/MM/YYYY'), 'teste', 1, 40, 6);

--TB_SERVICOS
INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_vencimento, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 100.50, '21A35B', TO_DATE('15/12/2023', 'DD/MM/YYYY'), TO_DATE('20/12/2023', 'DD/MM/YYYY'), 1, 1, 1, 1);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_vencimento, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 21.53, 'BB21AA', TO_DATE('12/12/2023', 'DD/MM/YYYY'), TO_DATE('17/12/2023', 'DD/MM/YYYY'), 1, 2, 1, 2);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_vencimento, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 10.93, 'ZZZ214', TO_DATE('11/12/2023', 'DD/MM/YYYY'), TO_DATE('16/12/2023', 'DD/MM/YYYY'), 1, 3, 2, 3);

INSERT INTO tb_servicos (id_servico, nr_valor, cd_confirmacao, dt_agendamento, dt_vencimento, st_ativo, id_endereco, id_transportador, id_cliente)
VALUES (seq_tb_servicos.NEXTVAL, 9.05, '995TY1', TO_DATE('25/12/2023', 'DD/MM/YYYY'), TO_DATE('30/12/2023', 'DD/MM/YYYY'), 1, 4, 2, 4);

--TB_ITENS
INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Eletronico', 5.5, 22, 19.5, 0.5, 'Placa Mãe Centrium Micro ATX LGA 1151 DDR4 C2018', 1);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Eletronico', 28, 11.67, 4.4, 0.4, 'Zotac GTX 1650', 1);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Moveis', 78, 140, 240, 35, 'Sofá 2 Lugares Europa Linho Bege ADJ Decor', 2);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Moveis', 200, 180, 46.5, 30, 'Guarda Roupa Casal 6 Portas 3 Gavetas Toledo MX Móveis', 3);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Moveis', 90, 90, 40, 20, 'Cômoda Sapateira 1 Porta 5 Gavetas Zurique Evidência Móveis', 3);

INSERT INTO tb_itens (id_item, tp_item, nr_altura, nr_comprimento, nr_largura, nr_peso, ds_descricao, id_servico)
VALUES (seq_tb_itens, 'Moveis', 116, 136, 45, 38, 'Cômoda 8 Gavetas Doble Albatroz Móveis', 4);