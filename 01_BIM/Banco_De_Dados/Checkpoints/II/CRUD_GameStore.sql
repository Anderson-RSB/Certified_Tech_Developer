-- Enunciado:
-- Uma pequena loja de jogos pretende aumentar seus lucros, então, 
-- passa a oferecer seus produtos através da internet.
-- Começando pela criação de um Banco de Dados com os produtos disponíveis, vendas e, seus clientes!

-- Aqui se encontraram os comandos CRUD referentes ao BD criado no Schema/Script DataBase_GameStore.sql

USE GameStore;

SELECT * FROM generos;
INSERT INTO generos(nome_gen) VALUES
("Ação"), ("Aventura"), ("Exploração"), ("Esportes"), ("Estrategia"), ("Ficção Científica"),
("Indie"), ("Mundo Aberto"), ("RPG"), ("Simulação"), ("Sobrevivência"), ("Terror");

SELECT * FROM generos;

SELECT * FROM distribuidoras;
INSERT INTO distribuidoras(razao_social, telefone) VALUES
("Innersloth", "12 3269-4395"), ("Warner Bros. Interactive Entertainment", "13 2222-3959"), 
("Valve", "15 3651-1657"), ("Activision", "16 3494-7378"), 
("FromSoftware, Inc, BANDAI NAMCO Entertainment", "12 2702-7582"), 
("Behaviour Interactive Inc.", "13 3863-7544"), ("Bungie", "11 3771-1256"), 
("Ubisoft", "11 2484-5296"), ("PlayStation PC LLC", "11 2677-4010"), ("Amazon Games", "11 3722-4453"), 
("Square Enix, Feral Interactive (Mac), Feral Interactive (Linux)", "19 3456-5196"), 
("SEGA", "15 3628-3293"), ("CD PROJEKT RED", "18 3319-1632");

SELECT * FROM distribuidoras;

SELECT * FROM jogos;
INSERT INTO jogos(titulo, codGenero_id, data_lancamento, 
codDistribuidora_id, classificacao, valor_unit, estoque) VALUES
("Among Us", 5, "2018-11-16", 1, "L", "10.89", "5"), 
("Batman: Arkham Knight", 1, "2015-06-23", 2, "16", "49.99", "3"), 
("Counter-Strike: Global Offensive", 1, "2012-08-21", 3, "16", "75.99", "15"), 
("Crash Bandicoot N. Sane Trilogy", 1, "2018-06-29", 4, "L", "150.00", "7"), 
("DARK SOULS III", 1, "2016-04-11", 5, "M", "159.99", "4"), 
("Dead by Daylight", 1, "2016-06-14", 6, "18", "49.99", "2"), 
("Destiny 2", 2, "2019-10-01", 7, "14", "149.99", "3"), 
("ELDEN RING", 9, "2022-02-24", 5, "16", "249.90", "0"), 
("God of War", 2, "2022-01-14", 9, "18", "199.99", "0"), 
("New World", 9, "2021-09-28", 10, "14", "75.49", "20"), 
("Sonic Forces", 2, "2017-11-07", 12, "L", "72.99", "10"), 
("Tom Clancy's Rainbow Six Siege", 1, "2015-12-01", 8, "16", "59.99", "8"), 
("Tomb Raider", 2, "2013-03-05", 11, "16", "34.99", "2"), 
("The Witcher 3: Wild Hunt", 9, "2015-05-18", 13, "16", "79.99", "6"), 
("DARK SOULS III", 1, "2018-05-23", 5, "14", "129.99", "9"), 
("Batman: Arkham Knight", 1, "2013-10-25", 2, "14", "36.99", "0");

SELECT * FROM jogos;

SELECT jogos.titulo, distribuidoras.razao_social
FROM jogos
INNER JOIN distribuidoras
ON jogos.jogo_id = distribuidoras.distribuidora_id;

SELECT * FROM clientes;
INSERT INTO clientes(nome, sobrenome, endereco, email, documento) VALUES
("Ricardo", "Luis Mata Carmanin", "Rua Dona Joaquina Gomes - Jardim Chapadão - Campinas/SP", 
"ricardo.carmanin@geradornv.com.br", "41692244183"), 
("Gessica", "Pena Moreira", "Avenida Batatais - Jardim Paulista - Barueri/SP", 
"gessica.moreira@geradornv.com.br", "15745918608"), 
("Laura", "Damasceno Lopes", "Rua Felipe Neri - Parque Novo Oratório - Santo André/SP", 
"laura.lopes@geradornv.com.br", "43356937880"), 
("João", "Gadelha Vilela", "Rua José Augusto de Moura - Jardim Montreal - Sorocaba/SP", 
"joao.vilela@geradornv.com.br", "57660313860"), 
("Piter", "Pontes Vasconcelos", "Rua Abílio Braz Oliveira - Jardim Alvinópolis - Atibaia/SP", 
"piter.vasconcelos@geradornv.com.br", "30023146842"), 
("Filipe", "Assis Zava", "Rua Antônio Gasparine - Loteamento Residencial Central Park I - Itatiba/SP", 
"filipe.zava@geradornv.com.br", "77356440865"), 
("José", "Luiz Barcelos Navega", "Rua Feijó - Sítios de Recreio Letícia (Padre Nóbrega) - Marília/SP", 
"jose.navega@geradornv.com.br", "77563672869"), 
("Arielle", "Carmoriz Marins", "Rua Parati - Jardim Maria Helena - Barueri/SP", 
"arielle.marins@geradornv.com.br", "61745857869"), 
("Lucia", "Barros Vaz", "Travessa André Messager - Vila Missionária - São Paulo/SP", 
"lucia.vaz@geradornv.com.br", "34121941829"), 
("Aledio", "Vargas Neves", "Rua Mário Baptistella - Núcleo Habitacional Prefeito Erasmo Chrispim - Itatiba/SP", 
"aledio.neves@geradornv.com.br", "05825523898");

SELECT * FROM clientes;

SELECT * FROM vendas;
INSERT INTO vendas(codCliente_id, codJogo_id, qtdade, valor_unit, valor_tot, data_venda) VALUES
(1, 2, "1", "49.99", "49.99", "2018-02-08"), 
(4, 3, "1", "75.99", "75.99", "2018-04-18"), 
(6, 6, "1", "49.99", "49.99", "2018-05-27"), 
(7, 12, "1", "59.99", "59.99", "2019-08-27"), 
(9, 4, "1", "150.00", "150.00", "2020-04-13"), 
(3, 11, "1", "72.99", "72.99", "2021-09-10"), 
(1, 5, "2", "159.99", "319.98", "2022-01-04");

SELECT * FROM vendas;

SELECT jogos.titulo, clientes.nome, data_venda
FROM vendas
INNER JOIN jogos
ON jogos.jogo_id = vendas.codJogo_id
INNER JOIN clientes
ON clientes.cliente_id = vendas.CodCliente_id;

UPDATE distribuidoras SET razao_social = "Square Enix"
WHERE razao_social = "Square Enix, Feral Interactive (Mac), Feral Interactive (Linux)";

SELECT * FROM distribuidoras;

UPDATE jogos SET estoque = "15"
WHERE estoque = "0" AND titulo = "ELDEN RING";

UPDATE jogos SET estoque = "10"
WHERE titulo = "God of War";

SELECT * FROM jogos;

DELETE FROM jogos
WHERE jogo_id = 15;

DELETE FROM jogos
WHERE jogo_id = 16;

SELECT * FROM jogos;

DELETE FROM clientes
WHERE cliente_id = 10;

SELECT * FROM clientes;