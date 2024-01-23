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

--CONSULTAS SIMPLES COM WHERE
select * from tbl_Livro where Preco_Livro = 137.49;
select * from tbl_Livro where ID_Livro = 101;

-- consultas com AND
select * from tbl_Livro where Preco_Livro > 234.00 and Preco_Livro < 267.00;
select * from tbl_Livro where ID_Livro > 100 and ID_Livro < 203;

--ALIAS
select Nome_Livro AS Livro from tbl_Livro;

--CONTA A QUANTIDADE DE REGISTROS DA TABELA LIVROS
select COUNT(*) from tbl_Livro;

--RETORNA O LIVRO MAIS CARO
select MAX(Preco_Livro) from tbl_Livro;

--RETORNA O LIVRO MAIS BARATO
select MIN(Preco_Livro) from tbl_Livro;

select * from tbl_Livro where Preco_Livro BETWEEN 235.20 AND 266.40
select * from tbl_Livro where ID_Livro BETWEEN 201 AND 203

--PESQUISAR TODOS OS LIVROS QUE A SEGUNDA LETRA TENHA A LETRA 'A'
select Nome_Livro from tbl_Livro where Nome_Livro Like '_a%';
select Nome_Livro from tbl_Livro where Nome_Livro Like '_[os]%';
select Nome_Livro from tbl_Livro where Nome_Livro Like '__des%';
select Nome_Livro from tbl_Livro where Nome_Livro Like '___ica%';

select * from tbl_Livro

--CRIA INDEX 
create index nome_livro on tbl_Livro (Nome_Livro)

--CRIAR UMA VIEW
create view LivrosAutores
as select tbl_Livro.Nome_Livro as Livro, tbl_Autores.Nome_Autor
as Autor from tbl_Livro
inner join tbl_Autores
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor

--EXECUTA UMA VIEW CRIADA 
select Livro,Autor
from LivrosAutores

select Livro,Autor
from LivrosAutores
where Livro Like 'j%'

--CRIAR UMA STORED PROCEDURE
create procedure teste as select 'Teste procedure' as Nome

--executar uma stored procedure
exec teste

--retorna duas colunas da taebela livro
create procedure p_LivroValor as
select Nome_Livro, Preco_Livro from tbl_Livro

--executa a procedure
exec p_LivroValor

--cria procedure realizando filtro por preço
create procedure pesquisaPorValor as
select * from tbl_Livro where Preco_Livro > 234.00 and Preco_Livro < 267.00;

execute pesquisaPorValor

--passando parametro na procedure
alter procedure p_LivroValor
(@ID SMALLINT) AS
select Nome_Livro, Preco_Livro from tbl_Livro where ID_Livro = @ID

--executando a procedure e passando um parametro
exec p_LivroValor 100

--procedure multiplos parametros
create procedure _param
(@par1 as int, @par2 as varchar(20))
as
select @par1
select @par2

-- executar procedure
exec _param 26, 'laranja'

exec _param @par1 = 14, @par2 = 'laranja'

exec _param @par1 = 35, @par2 = 'preto'