-- Enunciado:
-- Uma pequena loja de jogos pretende aumentar seus lucros, então, 
-- passa a oferecer seus produtos através da internet.
-- Começando pela criação de um Banco de Dados com os produtos disponíveis, vendas e, seus clientes!

CREATE DATABASE	GameStore;
USE GameStore;

CREATE TABLE clientes(
cliente_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
sobrenome VARCHAR(100),
endereco VARCHAR(150),
email VARCHAR (50),
documento VARCHAR (12)
);

CREATE TABLE distribuidoras(
distribuidora_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(150),
telefone VARCHAR(15)
);

CREATE TABLE generos(
genero_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_gen VARCHAR(50)
);

CREATE TABLE jogos(
jogo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(150),
codGenero_id INT,
FOREIGN KEY(codGenero_id) REFERENCES generos(genero_id),
data_lancamento DATE,
codDistribuidora_id INT,
FOREIGN KEY(codDistribuidora_id) REFERENCES distribuidoras(distribuidora_id),
classificacao VARCHAR(5),
valor_unit FLOAT,
estoque DECIMAL
);

CREATE TABLE vendas(
venda_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codCliente_id INT,
FOREIGN KEY (codCliente_id) REFERENCES clientes(cliente_id),
codJogo_id INT,
FOREIGN KEY (codJogo_id) REFERENCES jogos(jogo_id),
qtdade DECIMAL,
valor_unit FLOAT,
valor_tot FLOAT,
data_venda DATE
);

-- Por questão de organização, decidi fazer os comandos CRUD's em outro Schema/Script
-- O mesmo está com o nome de CRUD_GameStore