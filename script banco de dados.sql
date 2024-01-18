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
(ID_Editora smallint primary key identity,
 Nome_Editora varchar(50) not null
)

/* informações sobre a tabela */

sp_help tbl_autores

/* remove uma coluna */ 
alter table tbl_Livro
drop column ID_Autor


/*add uma coluna*/

alter table tbl_Livro
add ID_Autor smallint not null
constraint fk_ID_Autor foreign key (ID_Autor)
references tbl_autores

insert into tbl_Editoras values ('bookman');
insert into tbl_Editoras values ('Addison-Wesley');

insert into tbl_Autores values (1,'johnson','ralph');
insert into tbl_Autores values (2,'Erich','Gamma');
insert into tbl_Autores values (3,'David', 'Flanagan');
insert into tbl_Autores values (4,'Andrew','Tanenbaum');
insert into tbl_Autores values (6,'Fabrício', 'Felipe Meleto Barboza');
insert into tbl_Autores values (7, 'André', 'Luiz Villar Forbellone');

insert into tbl_Livro values ('padroes de projetos', 8573076100, '2000-01-01',148.50,2,1);
insert into tbl_Livro values ('design paterns', 9780201633610, '1994-01-01',137.49,1,2);																		
insert into tbl_Livro values ('javascript', 9788565837194, '2003-01-01',235.20, 3, 1);
insert into tbl_Livro values ('redes de computadores', 9788582605608, '2021-01-01',266.40,4,1);
insert into tbl_Livro values ('logica de programacao', 9788582605721, '2022-01-01',78.40,7,1);
insert into tbl_Livro values ('modelagem e desenvolvimento de banco de dados', 9788595025172, '2018-01-01',26.40,6,1);

select * from tbl_Livro;
select Nome_Livro from tbl_Livro;


