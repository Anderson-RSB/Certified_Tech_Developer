-- GRUPO 02
-- ANDERSON BORGES
-- FERNANDA MARQUES
-- IBSON JÚIOR
-- THIAGO FREITAS
-- JOÃO V. ROSSI
-- LUANDERSON SILVA

-- VIEW - Parte I
-- Clientes

-- 1. Crie uma View com os seguintes dados do cliente: Id, contato, Fax e o telefone.
SELECT * FROM clientes;

CREATE VIEW dados_cliente AS
SELECT ClienteID, Contato, Fax, Telefone
FROM clientes;

SELECT * FROM dados_cliente;

-- 2. Liste os números de telefone dos clientes que não possuem fax.
-- Faça isso de duas maneiras diferentes:
-- a. Consultando a tabela clientes
-- b. Consultando a view do cliente

-- R.: a.
SELECT Telefone, Fax
FROM clientes
WHERE Fax LIKE "";

-- b.
SELECT Telefone, Fax  FROM dados_cliente
WHERE Fax LIKE "";


-- Fornecedores
-- 1. Crie uma view com os seguintes dados do fornecedor: Id, contato,
-- empresa e endereço. Para o endereço, pegue o endereço, cidade, código
-- postal e país.
SELECT * FROM provedores;

CREATE VIEW fornecedores AS
SELECT ProvedorID, Contato, Empresa, CONCAT(Endereco,', ',Cidade,', ', CodigoPostal,', ', Pais,', ') AS Endereco_Provedor
FROM provedores;

SELECT * FROM fornecedores;

-- 2. Liste os fornecedores que moram na Avenida das Americanas, no Brasil. Faça de duas formas diferentes:
-- a. Consultando a tabela de fornecedores
-- b. Consultando a view do fornecedor
SELECT * FROM provedores;

SELECT * FROM provedores
WHERE Endereco LIKE 'Av. das Americanas%' AND Pais LIKE 'Brazil';

SELECT * FROM fornecedores
WHERE Endereco_Provedor LIKE 'Av. das Americanas%' AND Pais LIKE 'Brazil';


-- VIEW - Parte II - Desafio
-- 1. Crie uma view dos produtos que será usada ​​para controle de estoque. Inclua o id e nome do produto,
-- preço unitário arredondado sem decimais, unidades em estoque e as unidades encomendadas.
-- Inclua também uma nova coluna PRIORIDADE, com os seguintes valores:
-- BAIXA se as unidades encomendadas forem zero
-- MÉDIA se as unidades pedidas forem menores do que as unidades em estoque
-- URGENTE se as unidades pedidas não dobrarem o número de unidades em estoque
-- PRIORITÁRIO caso contrário
SELECT * FROM Produtos;

CREATE VIEW controle_estoque AS
SELECT ProdutoID, ProdutoNome, ROUND(PrecoUnitario, 0), UnidadesEstoque, UnidadesPedidas,
	CASE WHEN UnidadesPedidas = 0 THEN "Baixa"
		WHEN UnidadesPedidas < UnidadesEstoque THEN "Media"
        WHEN UnidadesPedidas < 2*UnidadesEstoque THEN "Urgente"
	ELSE "Prioritario"
    END AS Prioridade
FROM Produtos;

-- 2.  É necessário um relatório para identificar problemas de estoque.
-- Utilizando a view criada no exercício anterior, indique, para cada prioridade,
-- quantos produtos existem e seu preço médio. Não inclua prioridades para as que possuem menos de 5 produtos.

SELECT Prioridade, COUNT(ProdutoID)
FROM controle_estoque
GROUP BY Prioridade;
