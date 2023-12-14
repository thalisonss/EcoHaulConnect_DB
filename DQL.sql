SELECT t.st_status || ' - ' || d.nm_descricao, t.*
FROM tb_transportadores t
LEFT JOIN tb_descricoes d ON d.id_descricao = t.st_status AND d.nm_atributo = 'st_status';
