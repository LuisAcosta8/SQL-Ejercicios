#Eliminar la base de datos ya existente
#drop database if exists curso_sql;

#show databases;

create database if not exists curso_sql;
use curso_sql;

create table if not exists usuario(
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
primary key(nombre)
);
describe usuario;
insert into usuario values("Luis","Acosta","acostabluis8@gmail.com");
select * from usuario;

create table if not exists producto(
id int auto_increment,
producto varchar(50),
descripcion text,
precio float(6,2),
primary key(id)
);
drop table producto;
describe producto;
insert into producto values(null,"Laptop","La mejor laptop del mercado", 5499.99);
insert into producto values(null,"Mouse","Mouse prende luz", 249.99);
select * from producto;
use curso_sql;
delete from producto; #Despues de borrar los registros de una tabla no se reinician los contadores, se debe usar truncate
truncate table producto; #Se reinician los contadores del autoincremento
create table personas(
id integer unsigned not null,
nombre varchar(50),
edad integer unsigned,
primary key(id)
);
describe personas;