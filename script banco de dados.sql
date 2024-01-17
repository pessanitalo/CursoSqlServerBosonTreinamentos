CREATE DATABASE db_biblioteca

USE db_biblioteca;

CREATE TABLE tbl_Livro
(ID_Livro SMALLINT PRIMARY KEY IDENTITY(100,1),
 Nome_Livro varchar(50) not null,
 ISBN varchar(30) not null unique,
 ID_Autor smallint not null,
 Data_Pub datetime not null,
 Preco_Livro money not null
)

CREATE TABLE tbl_Autores
(ID_Autor smallint primary key,
 Nome_Autor varchar(50) not null,
 SobreNome_Autor varchar(60)
)

CREATE TABLE tbl_Editoras
(ID_Editora smallint primary key,
 Nome_Editora varchar(50) not null
)