-- GRUPO 01:
-- ANDERSON BORGES
-- DENNYS DE OLIVEIRA
-- WILLIAM SILVA
-- ABRAÃO DA SILVA

USE musimundos;

-- 1. 
SELECT artistas.nome, albuns.titulo 
FROM artistas 
INNER JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

-- 2. 
SELECT clientes.nome, faturas.valor_total 
FROM clientes 
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
HAVING faturas.valor_total > 5
ORDER BY faturas.valor_total DESC;

-- 3. 
SELECT cancoes.nome, tipos_de_arquivo.nome
FROM cancoes
INNER JOIN tipos_de_arquivo
ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo
ORDER BY cancoes.id;