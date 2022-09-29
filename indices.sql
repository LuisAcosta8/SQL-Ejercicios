use curso;

#Indices
#Primary
#Index
#Unique

show index from libro;

create table if not exists libro(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15)
);

create table if not exists libros(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
index i_autor(autor)
);

create table if not exists libross(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
index i_autoreditorial(autor, editorial)
);
create table if not exists librosss(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
index i_autor(autor),
unique uq_titulo(titulo)
);

show index from librosss;
drop index uq_titulo on librosss;

#Agregar inices a una tabla existente
drop table if exists libro;
create table if not exists libro(
id int unsigned auto_increment not null primary key,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15)
);
select * from libro;

create index i_editorial on libro(editorial);
create unique index uq_titulo on libro(titulo);
show index from libro;