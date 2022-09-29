use curso_sql;
create table if not exists libros(
id int unsigned auto_increment,
titulo varchar(40) not null,
editorial varchar(15),
autor varchar(30) default 'Desconocido',
precio decimal(5,2) unsigned default 8.25,
cantidad mediumint unsigned not null,
primary key(id)
);


insert into libros(titulo,editorial,autor,precio,cantidad) values('C#en una hora','SQL','Miguel', 15.2, 50);
insert into libros(titulo,editorial,autor,cantidad) values('JAVA','KIK','Juan', 30); #No se asigna precio pero coloca por default el que se indico cuando se creo la tabla
insert into libros(titulo, cantidad) values('JavaScript',85);
#Zerofill Rellena de 0 a la izquierda cualquier dato que tengamos solo funciona con numeros

create table if not exists libros2(
id int(5) zerofill auto_increment,
titulo varchar(40) not null,
editorial varchar(15),
autor varchar(30) default 'Desconocido',
precio decimal(5,2) unsigned default 8.25,
cantidad mediumint zerofill not null,
primary key(id)
);
insert into libros2(titulo,editorial,autor,precio,cantidad) values('C#en una hora','SQL','Miguel', 15.2, 50);
insert into libros2(titulo,editorial,autor,cantidad) values('JAVA','KIK','Juan', 30); #No se asigna precio pero coloca por default el que se indico cuando se creo la tabla
insert into libros2(titulo, cantidad) values('JavaScript',85);
select * from libros2;