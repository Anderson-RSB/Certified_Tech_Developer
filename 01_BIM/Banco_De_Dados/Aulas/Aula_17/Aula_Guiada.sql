-- CREATE VIEW <nome da view>
-- AS <setencia select>

-- CREATE VIEW musicas_de_rock AS
-- SELECT musicas.id, musicas.nome, generos.nome AS genero
-- FROM musicas
-- INNER JOIN generos ON musicas.id_genero = genero.id
-- WHERE generos.nome IN ('Rock', 'Rock And Roll');

-- SELECT * FROM musicas_de_rock

-- Para excluir uma view, utiliza: DROP VIEW <nome da view>


-- Crie uma view com um detalhe dos produtos em estoque
-- Indicar id, nome produto, nome da categoria e preço unitário
CREATE VIEW produtos_categoria AS
SELECT Produtos.ProdutoID AS 'Código', Produtos.ProdutoNome AS 'Nome do Produto',
Categorias.CategoriaNome AS 'Categoria', Produtos.PrecoUnitario AS 'Preço Unitário'
FROM Produtos
INNER JOIN Categorias
ON Categorias.CategoriaID = Produtos.CategoriaID;

SELECT `Código`, Categoria FROM produtos_categoria
ORDER BY `Código`;