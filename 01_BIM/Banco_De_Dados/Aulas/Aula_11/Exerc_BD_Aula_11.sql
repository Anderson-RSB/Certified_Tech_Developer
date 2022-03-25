USE EMarket;

-- Queries I - Parte I 
-- Categorias e Produtos:
-- 1. 
SELECT * FROM Categorias;

-- 2. 
SELECT CategoriaNome, Descricao FROM Categorias
WHERE CategoriaID = 1;

-- 3. 
SELECT * FROM produtos;

-- 4. 
SELECT * FROM Produtos
WHERE Descontinuado = 1;
-- Não existem produtos descontinuados!

-- 5. 
SELECT ProdutoNome FROM Produtos
WHERE ProvedorID = 8;

-- 6. 
SELECT ProdutoNome FROM Produtos
WHERE PrecoUnitario BETWEEN 10 AND 22;
-- OU
SELECT ProdutoNome FROM Produtos
WHERE PrecoUnitario >= 10 AND PrecoUnitario <= 22;

-- 7. 
SELECT ProdutoNome FROM Produtos
WHERE UnidadesEstoque < NivelReabastecimento;

-- 8. 
SELECT ProdutoNome FROM Produtos
WHERE UnidadesEstoque < NivelReabastecimento AND UnidadesPedidas = 0;


-- Clientes:
-- 1. 
SELECT Contato, Empresa, Titulo, Pais FROM Clientes
ORDER BY Pais;

-- 2. 
SELECT * FROM Clientes
WHERE Titulo = "Owner";

-- 3. 
SELECT * FROM CLientes
WHERE Contato LIKE "C%" OR "c%";


-- Faturas:
-- 1. 
SELECT * FROM Faturas
ORDER BY DataFatura;

-- 2. 
SELECT * FROM Faturas
WHERE PaisEnvio = "USA" AND FormaEnvio != 3;

-- 3. 
SELECT * FROM Faturas
WHERE ClienteID = "GOURL";

-- 4. 
SELECT * FROM Faturas
WHERE EmpregadoID in (2, 3, 5, 8, 9);


-- Queries I - Parte II
-- Produtos:
-- 1. 
SELECT * FROM Produtos
ORDER BY PrecoUnitario DESC;

-- 2. 
SELECT * FROM Produtos
ORDER BY PrecoUnitario DESC
LIMIT 5;

-- 3. 
SELECT * FROM Produtos
ORDER BY UnidadesEstoque DESC 
LIMIT 10;


-- DetalheFatura:
-- 1. 
SELECT FaturaId, ProdutoID, Quantidade
FROM DetalheFatura;

-- 2. 
SELECT FaturaId, ProdutoID, Quantidade
FROM DetalheFatura
ORDER BY Quantidade DESC;

-- 3. 
SELECT FaturaId, ProdutoID, Quantidade
FROM DetalheFatura
WHERE Quantidade BETWEEN 50 AND 100
ORDER BY Quantidade DESC;

-- 4. 
SELECT FaturaId, ProdutoID, PrecoUnitario * Quantidade
FROM DetalheFatura;
-- OU
SELECT FaturaId, ProdutoID, PrecoUnitario * Quantidade AS Total
FROM DetalheFatura;


-- Extras:
-- 1.
SELECT * FROM Clientes
WHERE Pais = "Brazil" 
OR Pais = "Mexico" 
OR Titulo = "Sales";

-- 2.
SELECT * FROM Clientes
WHERE Empresa LIKE "A%";

-- 3.
SELECT Cidade, Contato AS Nome_e_Sobrenome, Titulo AS Cargo 
FROM Clientes
WHERE Cidade LIKE "Madrid";

-- 4.
SELECT * FROM Faturas
WHERE FaturaId BETWEEN 10000 AND 10500;

-- 5.
SELECT * FROM Faturas
WHERE FaturaId BETWEEN 10000 AND 10500
OR ClienteId LIKE "B%";

-- 6.
SELECT * FROM Faturas
WHERE CidadeEnvio LIKE "Vancouver"
OR FormaEnvio LIKE 3;

-- 7.
SELECT EmpregadoID FROM Empregados
WHERE Sobrenome LIKE "Buchanan";

-- 8.
SELECT * FROM Faturas
WHERE EmpregadoID LIKE "5";
