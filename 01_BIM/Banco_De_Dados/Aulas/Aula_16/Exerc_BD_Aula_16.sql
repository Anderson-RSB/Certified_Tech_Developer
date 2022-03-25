-- GRUPO 01
-- ANDERSON BORGES
-- ABRAÃO DA SILVA
-- WILLIAM SILVA
-- FERNANDO OLIVEIRA


-- Consultando o BD e-Market

USE emarket;

-- Relatórios II parte I - Revisando INNER JOIN

-- Faça uma consulta sobre o faturamento do e-market. Inclua as seguintes informações:
-- ID da fatura
-- data da fatura
-- nome da empresa de correio (O id da empresa consta da tabela faturas no campo FormaEnvio)
-- nome do cliente
-- categoria do produto vendido
-- nome do produto(Você chega ao produto consultando os detalhes da fatura)
-- preço unitário
-- quantidade

SELECT Faturas.FaturaId, Faturas.DataFatura,
Correios.Empresa, Clientes.Contato, Categorias.CategoriaNome,
Produtos.ProdutoNome, Produtos.PrecoUnitario,
Produtos.QuantidadePorUnidade
FROM Faturas
INNER JOIN Correios ON Faturas.FormaEnvio = Correios.CorreioID
INNER JOIN Clientes ON Faturas.ClienteID = Clientes.ClienteID
INNER JOIN DetalheFatura ON Faturas.FaturaId = DetalheFatura.FaturaId
INNER JOIN Produtos ON Produtos.ProdutoID = DetalheFatura.ProdutoID
INNER JOIN Categorias ON Categorias.CategoriaID = Produtos.CategoriaID;


-- Relatórios II Parte II - INNER, LEFT e RIGHT JOIN

-- 1. Liste todas as categorias junto com informações sobre seus produtos.
-- Incluir todas as categorias, mesmo que não tenham produtos.

SELECT * FROM categorias;
SELECT * FROM produtos;

SELECT categorias.CategoriaNome, categorias.Descricao, Produtos.ProdutoNome
FROM categorias
LEFT JOIN produtos
ON categorias.CategoriaID = produtos.CategoriaID;

-- 2. Liste as informações de contato de clientes que nunca compraram no emarket.

SELECT * FROM clientes;
SELECT * FROM faturas;

SELECT clientes.ClienteID, clientes.Contato
FROM clientes
LEFT JOIN faturas
ON clientes.ClienteID = faturas.ClienteID
WHERE ISNULL(faturas.ClienteID);

-- 3. Faça uma lista de produtos. Para cada um, indique seu nome,
-- categoria e as informações de contato de seu fornecedor.
-- Lembre-se que podem existir produtos para os quais o fornecedor não foi indicado.

SELECT * FROM produtos;
SELECT * FROM provedores;

SELECT produtos.ProdutoNome, categorias.CategoriaNome, provedores.Contato
FROM produtos
INNER JOIN categorias ON Categorias.CategoriaID = Produtos.CategoriaID
LEFT JOIN provedores
ON provedores.ProvedorID = produtos.ProvedorID;

-- 4. Para cada categoria, liste o preço unitário médio de seus produtos.
SELECT * FROM categorias;
SELECT * FROM produtos;

SELECT categorias.CategoriaNome, AVG(produtos.PrecoUnitario)
FROM categorias
LEFT JOIN produtos
ON categorias.CategoriaID = produtos.CategoriaID
GROUP BY categorias.CategoriaNome;


-- 5. Para cada cliente, indique a última nota fiscal de compra.
-- Inclua clientes que nunca compraram no e-market.
SELECT * FROM clientes;
SELECT * FROM produtos;


-- 6. Todas as faturas têm uma empresa de correio associada (envio).
-- Gere uma lista com todas as empresas de correio e o número de faturas correspondentes.
-- Execute a consulta usando RIGHT JOIN.