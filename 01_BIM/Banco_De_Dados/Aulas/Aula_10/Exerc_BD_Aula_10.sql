-- GRUPO 01:
-- ANDERSON BORGES
-- VINICIUS SESMA
-- WILLIAM SILVA
-- ABRAÃO DA SILVA

CREATE DATABASE DHTube;
USE DHTube;

CREATE TABLE avatar(
avatar_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
url_imagem VARCHAR(100)
);

CREATE TABLE pais(
pais_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);

CREATE TABLE usuarios(
usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(45),
data_nascimento DATETIME,
cep VARCHAR(45),
paisPais_id INT,
FOREIGN KEY(paisPais_id) REFERENCES pais(pais_id),
avatarAvatar_id INT,
FOREIGN KEY(avatarAvatar_id) REFERENCES avatar(avatar_id)
);

CREATE TABLE canal(
canal_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao TEXT,
dataCriacao DATETIME,
usuarioUsuario_id INT,
FOREIGN KEY(usuarioUsuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE playlists(
playlist_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dataCriacao DATETIME,
privado SMALLINT(6),
userUsuario_id INT,
FOREIGN KEY(userUsuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE videos(
video_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(100),
descricao TEXT,
tamanho DOUBLE,
nome_arquivo VARCHAR (100),
duracao DOUBLE,
img VARCHAR(100),
qtd_reproducoes INT (11),
qtd_likes INT(11),
qtd_dislikes INT(11),
privado SMALLINT(6),
data_publicacao DATETIME,
userUsuario_id INT,
FOREIGN KEY(userUsuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE playlist_video(
playlist_video_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
vidVideo_id INT,
FOREIGN KEY(vidVideo_id) REFERENCES videos(video_id),
playPlaylist_id INT,
FOREIGN KEY(playPlaylist_id) REFERENCES playlists(playlist_id)
);