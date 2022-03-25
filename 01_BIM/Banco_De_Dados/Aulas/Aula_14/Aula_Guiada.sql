USE musimundos;

SELECT clientes.nome, clientes.sobrenome, faturas.valor_total 
FROM clientes 
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
ORDER BY clientes.nome;

SELECT clientes.nome, SUM(faturas.valor_total), COUNT(faturas.id_cliente) 
FROM clientes 
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
GROUP BY faturas.id_cliente;

SELECT clientes.nome, SUM(faturas.valor_total), COUNT(faturas.id_cliente) 
FROM clientes 
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
GROUP BY faturas.id_cliente
HAVING SUM(faturas.valor_total) > 40;