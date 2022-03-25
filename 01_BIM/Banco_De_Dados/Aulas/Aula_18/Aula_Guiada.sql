-- Aula 18 - 23/03/2022

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