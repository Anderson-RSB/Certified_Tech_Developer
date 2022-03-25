-- Aula 15
-- Exercício guiado
-- Consultas:

-- 1. 
SELECT clientes.Contato, UPPER(clientes.Titulo), faturas.DataFatura
FROM clientes
INNER JOIN faturas
ON clientes.ClienteID = faturas.ClienteID
WHERE DataFatura LIKE '1996%';

-- 2. 
SELECT clientes.Cidade, faturas.CidadeEnvio, 
RIGHT(CONCAT('00000', faturas.FaturaId), 8) AS 'Número da Fatura', 
DATE_FORMAT(faturas.DataFatura, '%Y-%m-%d') AS 'Data da Fatura'
FROM clientes
INNER JOIN faturas
ON clientes.ClienteID = faturas.ClienteID
WHERE faturas.CidadeEnvio != clientes.Cidade AND Clientes.Pais = 'UK';