-- GRUPO 01:
-- ANDERSON BORGES
-- ABRAÃO DA SILVA
-- DENNYS DE OLIVEIRA
-- WILLIAM SILVA


USE emarket;

-- 1. 
SELECT correios.Empresa, faturas.FaturaId, faturas.Transporte
FROM correios
INNER JOIN faturas
ON correios.CorreioID = faturas.FormaEnvio
GROUP BY faturas.FaturaId;


-- 2. 
SELECT DISTINCT CONCAT('Empresa: ', clientes.Empresa) AS Empresas, 
CONCAT('Sr/a ', clientes.Contato) AS Contato, 
CONCAT('Tit.: ', clientes.Titulo) AS Titulo, 
CONCAT('City: ', clientes.Cidade) AS Cidade
FROM clientes
INNER JOIN faturas
ON clientes.ClienteID = faturas.ClienteID
ORDER BY clientes.ClienteID;


-- 3. 
SELECT categorias.CategoriaID, categorias.CategoriaNome, 
categorias.Descricao, produtos.ProdutoNome, SUM(produtos.UnidadesEstoque) AS Quantidade
FROM categorias
INNER JOIN produtos
ON categorias.CategoriaID = produtos.CategoriaID
GROUP BY categorias.CategoriaNome;