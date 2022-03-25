-- GRUPO 01
-- ANDERSON BORGES
-- ABRAÃO DA SILVA
-- DENNYS DE OLIVEIRA
-- WILLIAM SILVA

USE musimundos;

-- 1. 
SELECT MAX(valor_total) FROM faturas
WHERE cidade_cobranca LIKE "Oslo";

-- 2. 
SELECT MIN(valor_total) FROM faturas;

-- 3. 
SELECT AVG(valor_total) FROM faturas
WHERE pais_cobranca LIKE "Canada";

-- 4. 
SELECT COUNT(*) FROM faturas
WHERE pais_cobranca LIKE "Canada";

-- 5. 
SELECT SUM(valor_total) FROM faturas;

-- 6. 
SELECT id, data_fatura, valor_total FROM faturas
WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

-- 7. 
SELECT MIN(data_nascimento) FROM empregados;

-- 8. 
SELECT MAX(data_nascimento) FROM empregados;

-- 9. 
SELECT DATE_FORMAT(data_nascimento, "%d %M %Y") FROM empregados;

-- 10. 
SELECT * FROM cancoes
WHERE compositor LIKE "AC/DC";

-- 11. 
SELECT duracao_milisegundos FROM cancoes
WHERE compositor LIKE "AC/DC";

-- 12. 
SELECT bytes FROM cancoes
WHERE compositor LIKE "AC/DC";

-- 13. 
SELECT * FROM clientes
WHERE cidade LIKE "São Paulo";

-- 14. 
SELECT * FROM clientes
WHERE cidade LIKE "Paris";

-- 15. 
SELECT * FROM clientes
WHERE email LIKE "%yahoo%";