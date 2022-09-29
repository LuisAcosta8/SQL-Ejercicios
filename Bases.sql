#SHOW #Muestra las bases de datos
show databases;			
#CREATE #Crea una base de datos nueva		
create database curso_sql;
#DROP #Elimina una base de datos o una tabla
drop database curso_sql;

show databases;
create database curso_sql;
show databases;
#USE #Se utiliza para especificar que base de datos se esta trabajando
use curso_sql;
#CREATE #Crea una tabla
create table empleados(
#Los campos que se van a agregar a la tabla deben escribirse entre parentesis y estan acompañados del tipo de dato de cada campo
id int,
nombre varchar(35)
);
#Muestra las tablas
show tables;
#DESCRIBE #Arroja una descripcion de la tabla por ejemplo el nombre de los campos el tipo de dato etc 
describe empleados;

drop table empleados;
show tables;
create table empleados(
id int,
nombre varchar(35)
);

create table alumnos(
matricula int(10),
nombre varchar(50),
apellido varchar(50),
correo varchar(50),
telefono varchar(10),
edad int
);

#INSERT #Añade informacion a los campos de las tablas
insert into alumnos(matricula, nombre, apellido, correo, telefono, edad) values (2015370001,'Luis Alberto','Acosta Badillo','acostabluis8@gmail.com','5521511101', 27);
insert into alumnos values(2015370021,'Martin','Acosta Panpaglioni','Maacpan0578@alumno.ipn.mx','5520157856', 47);
insert into alumnos(matricula, apellido, telefono, edad) values(2018489056,'Gonzalez Heredia','7551894645', 15);
insert into alumnos values(2018486486,'Martin','Gonzalez Heredia','Martigoh@hotmail.com','7551894645', 35);

#SELECT #Muestra los datos que se han ingresado a las tablas se utiliza * para mostrar todos los campos o se puede nombrar el campo y buscar alguno en especifico
select * from alumnos;

select nombre, correo from alumnos;

select * from alumnos where nombre = 'Luis Alberto';

select nombre, correo from alumnos where nombre = 'Martin';

select nombre, correo from alumnos where nombre = 'Martin' and apellido = 'Gonzalez Heredia';

#alter table alumnos
#add edad int;

#Operadores relacionales
# =
# <>
# >
# <
# >=
# <=

select * from alumnos where edad = 27;

select * from alumnos where edad <> 27;

select * from alumnos where edad > 27;

select * from alumnos where edad < 27;

select * from alumnos where edad >= 27;

select * from alumnos where edad <= 27;
#DELETE #Borra los registros de alguna tabla sino se especifica que hacer se borran todos los datos es recomendable usar con #WHERE
delete from alumnos;

delete from alumnos where nombre = "Martin";

#UPDATE #Actualiza los campos en las tablas y tambien se recomienda usar con where porque si se utiliza solo se puede actualizar el campo de todos los registros con #SET se asignan los nuevos valores
update alumnos set edad = 33;

update alumnos set edad = 95 where nombre = "Martin" and apellido = "Gonzalez Heredia";

update alumnos set edad = 18, telefono = "5516891989" where nombre = "Martin" and apellido = "Gonzalez Heredia";