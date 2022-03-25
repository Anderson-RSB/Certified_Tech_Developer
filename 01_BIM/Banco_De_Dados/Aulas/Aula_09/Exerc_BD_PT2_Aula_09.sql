-- GRUPO: 5
-- ANDERSON BORGES
-- ROBSON LOPES
-- PABLO BOLDRINI
-- ADRIANO AUGUSTO
-- WERLON LIMA

CREATE DATABASE UniversoLeitura1;
USE UniversoLeitura1;

CREATE TABLE associados(
associado_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rg VARCHAR(10),
nome VARCHAR(50),
sobrenome VARCHAR(100),
endereco VARCHAR(200),
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
cod_ISBN VARCHAR(26),
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


INSERT INTO associados(rg, nome, sobrenome, endereco, cidade, estado)
VALUES (133395753, "ANTHONY", "VINICIUS TOMAS DE PAULA", "ALGODOEIRO, 346", "RIO BRANCO", "AC"),
(236231042, "BERNARDO", "IAN HEITOR ARAGAO", "DOUTOR ANTONIO GARCIA FILHO, 267", "ARACAJU", "SE"),
(188402007, "TEREZA", "ANDREA FARIAS", "AREA ESPECIAL INSTITUTO ISRAEL PINHEIRO, 738", "BRASILIA", "DF"),
(375340786, "YURI", "IGOR ALEXANDRE NOGUEIRA", "QUADRA CRNW 508 BLOCO B LOTE 6, 645", "BRASILIA", "DF"),
(152717857, "LORENZO", "BERNARDO JOAQUIM DAS NEVES", "AVENIDA RUI BARAUNA, 655", "BOA VISTA", "RR");

INSERT INTO telefones(telefone_socio, codAssoc)
VALUES (6828045843, 1), (7929326779, 2), (6127465782, 3), (6126659055, 4), (9525486454, 5);

INSERT INTO autores(sobrenome, nome)
VALUES ("RONALD REUEL TOLKIEN", "JOHN");

INSERT INTO editoras(razao_social, telefone)
VALUES ("EDITORA ROCCO", 1137290244), ("DARKSIDE BOOKS", 1122580217), ("SARAIVA", 1152000656);

INSERT INTO livros(cod_ISBN, titulo, ano_criacao, cod_autor, ano_publicacao)
VALUES ("9788595085800, 8595085803", "O Hobbit", "1937/09/21", 1, "1937/09/21"),
("9788595086333, 8595086338", "O Senhor dos Anéis: A Sociedade do Anel", "1954/07/29", 1, "1954/07/29"),
("9788595086371, 8595086370", "O Senhor dos Anéis: O retorno do rei", "1955/01/01", 1, "1955/01/01"),
("9788595086326, 859508632X", "O Senhor dos Anéis: As duas torres", "1954/11/11", 1, "1954/11/11"),
("9788595085152, 8595085153", "O Silmarillion", "1977/09/15", 1, "1977/09/15");

INSERT INTO exemplares(cod_livro, sinistro)
VALUES (1, 0), (2, 1), (3, 1), (4, 1), (5, 0);

INSERT INTO emprestimos(codAssoc, data, prazo_devolucao, data_devolucao)
VALUES (1, "2022/02/07", "2022/02/28", "2022/02/23"),
(2, "2022/02/10", "2022/03/03", 0),
(3, "2022/02/20", "2022/03/13", 0);

INSERT INTO emprestimo_exemplares(cod_emprestimo, cod_exemplar)
VALUES (1, 1), (2, 2), (3, 3);

DELETE FROM telefones WHERE telefone_id = 5;

DELETE FROM associados WHERE associado_id = 5;

DELETE FROM livros WHERE livro_id = 1;
-- Ao tentar deletar um Livro que possui um Exemplar associado, o seguinte erro é apresentado no Action Output:
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`universoleitura1`.`exemplares`, CONSTRAINT `exemplares_ibfk_1` FOREIGN KEY (`cod_livro`) REFERENCES `livros` (`livro_id`))

UPDATE associados
SET endereco = "RUAS DAS FLORES, 860"
WHERE associado_id = 3;