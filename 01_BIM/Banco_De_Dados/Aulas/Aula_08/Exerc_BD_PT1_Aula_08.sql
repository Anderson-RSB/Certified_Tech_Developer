CREATE DATABASE UniversoLeitura;
USE UniversoLeitura;

CREATE TABLE associados(
associado_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rg CHAR(7),
nome VARCHAR(50),
sobrenome VARCHAR(50),
endereco VARCHAR(150),
cidade VARCHAR(50),
estado VARCHAR(2)
);

CREATE TABLE telefones(
telefone_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
telefone_socio VARCHAR(100),
codAssoc INT,
FOREIGN KEY(CodAssoc) REFERENCES associados(associado_id)
);

CREATE TABLE autores(
autor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sobrenome VARCHAR(100),
nome VARCHAR(100)
);

CREATE TABLE editoras(
editora_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(150),
telefone VARCHAR(100)
);

CREATE TABLE livros(
livro_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_ISBN VARCHAR(13),
titulo VARCHAR(200),
ano_criacao DATE,
cod_autor INT,
FOREIGN KEY(cod_autor) REFERENCES autores(autor_id),
ano_publicacao DATE,
cod_editora INT,
FOREIGN KEY(cod_editora) REFERENCES editoras(editora_id)
);

CREATE TABLE exemplares(
exemplar_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_livro INT,
FOREIGN KEY(cod_livro) REFERENCES livros(livro_id),
sinistro BOOL
);

CREATE TABLE emprestimos(
emprestimo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codAssoc INT,
FOREIGN KEY(codAssoc) REFERENCES associados(associado_id),
data DATE,
prazo_devolucao DATE,
data_devolucao DATE
);

CREATE TABLE emprestimo_exemplares(
emprestimo_exemplar_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_emprestimo INT,
FOREIGN KEY(cod_emprestimo) REFERENCES emprestimos(emprestimo_id),
cod_exemplar INT,
FOREIGN KEY(cod_exemplar) REFERENCES exemplares(exemplar_id)
);

INSERT INTO associados(rg, nome, sobrenome, cidade, estado)
VALUES (5239040, "JOSE", "DA SILVA", "ARACAJU", "SE"); 

SELECT * FROM associados;

INSERT INTO associados(rg, nome, sobrenome, cidade, estado)
VALUES (1234567, "MARIA", "DA SILVA", "ARACAJU", "SE"),
(2345678, "MARTA", "GOMES", "CAMPINAS", "SP"),
(3456789, "CLEITON", "GOMES", "CAMPINAS", "SP"),
(4567891, "GUSTAVO", "FREITAS", "VALINHOS", "SP");

INSERT INTO telefones(telefone_socio)
VALUES ("8521242463"), ("5519984368"), ("45203940"), ("32248349"), ("9783441"), ("42449672"), ("99971939"), ("56789234");

SELECT * FROM telefones;

INSERT INTO autores(sobrenome, nome)
VALUES ("COELHO", "PAULO");

SELECT * FROM autores;

INSERT INTO editoras(razao_social, telefone)
VALUES ("PANINI COMICS LTDA", "153278964"), ("NOVA TECH LTDA", "358924761"), ("EDITORA VIENA LTDA", "548962371");

SELECT * FROM editoras;

INSERT INTO livros(titulo)
VALUES ("AS CRONICAS DE GELO E FOGO I"), ("AS CRONICAS DE GELO E FOGO II"), ("HARRY POTTER: E A PEDRA FILOSOFAL"), ("MAD MAX"), ("HARRY POTTER: E A ORDEM DA FENIX"), ("SENHOR DOS ANEIS: E AS DUAS TORRES");

SELECT * FROM livros;

INSERT INTO exemplares(cod_livro)
VALUES (1), (2), (3), (4), (5);

SELECT * FROM exemplares;