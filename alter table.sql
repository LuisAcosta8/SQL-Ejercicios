use curso;
show tables;
create table mercancias(
id int unsigned not null auto_increment,
nombre varchar(50),
primary key(id)
);
#Modificar tabla con alter table
#agrega nuevos campos
#cambia nombres
#agregar o cambiar indices
#renombrar tablas
describe mercancias;

#Agregar campos
alter table mercancias add precio int;
alter table mercancias add marca varchar(50);
alter table mercancias add cantidad smallint unsigned not null;
describe mercancias;

#Eliminar campos drop si borras un campo con indice se borra el indice automaticamente

alter table mercancias drop precio;
alter table mercancias drop cantidad;
describe mercancias;

#Modificar las propiedades de los campos de una tabla modify
alter table mercancias modify precio decimal(7,2);

#Cambiar el nombre de un campo change
alter table mercancias change cantidad stock int;

#agregar y eliminar clave primaria primary
drop table mercancias;
create table mercancia(
id int unsigned not null,
nombre varchar(50)
);
alter table mercancia add primary key(id);
alter table mercancia modify id int unsigned auto_increment not null;
#para borrar se debe verificar primero que el campo no tenga autoincremento
alter table mercancia modify id int unsigned;
alter table mercancia drop primary key;

#Agregar o borrar indice
alter table mercancia add precio decimal(5,2);
alter table mercancia add index i_precio (precio);
alter table mercancia drop index i_precio;

#Renombrar una tabla
show tables;
alter table mercancia rename producto;
rename table producto to mercancias;
describe producto;


describe mercancia;


insert into mercancias(nombre, marca) values('Chicle bomba','Bublibubli');
insert into mercancias(nombre, marca) values('Mermelada Sabor fresa','McCormick');
insert into mercancias(nombre, marca) values('Mostaza','Frenchs');

select * from mercancias;

