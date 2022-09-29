drop database if exists tienda;
create database tienda;
use tienda;
create table fabricante(
codigo int unsigned not null auto_increment,
nombre varchar(100) not null,
primary key(codigo)
);
create table productos(
codigo int unsigned not null auto_increment,
nombre varchar(100) not null,
precio double not null,
codigo_fabricante int unsigned not null,
primary key(codigo),
foreign key (codigo_fabricante) references fabricante(codigo)
);

insert into fabricante(nombre) value("Asus");
insert into fabricante(nombre) value("Lenovo");
insert into fabricante(nombre) value("Hewleet-Packard");
insert into fabricante(nombre) value("Samsung");
insert into fabricante(nombre) value("Seagate");
insert into fabricante(nombre) value("Crucial");
insert into fabricante(nombre) value("Gigabyte");
insert into fabricante(nombre) value("Huawei");
insert into fabricante(nombre) value("Xiaomi");

select * from fabricante;

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

select * from productos;
#####CONSULTAS SOBRE UNA TABLA#####
#1 Lista el nombre de todos los productos que hay en la tabla
select nombre from productos;

#2 Lista los nombres y los precios de todos los productos de la tabla producto
select nombre, precio from productos;

#3 Lista todas las columnas de la tabla producto.
select * from productos;

#4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio, precio*1.13 from productos;
 
#5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre, precio as "EUROS", precio*1.13 as "USD" from productos;

#6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre), precio from productos;

#7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre), precio from productos;

#8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, left(upper(nombre), 2) as "Nombre 2 letras" from fabricante;

#9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) from productos;

#10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, truncate(precio, 0) from productos;

#11 Lista el código de los fabricantes que tienen productos en la tabla producto.****************************


#12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.***************************


#13Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

#14 Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

#15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.**************************
select nombre from productos order by nombre asc, nombre desc;

#16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;

#17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante limit 3, 2;

#18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, min(precio) from productos order by precio limit 1; 

#19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, max(precio) from productos order by precio limit 1;
 
#20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
select nombre from productos where codigo_fabricante = 2;

#21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre, precio from productos where precio <= 120;

#22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre, precio from productos where precio >= 400;

#23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
select nombre, precio from productos where precio >= 400;

#24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from productos where precio > 80 and precio < 300;

#25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from productos where precio between 60 and 200;

#26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
select * from productos where precio > 200 and codigo_fabricante = 6;

#27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from productos where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;

#28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from productos where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;


#29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio*100 as "Centimos" from productos;

#30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from  fabricante where nombre like "S%";

#31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from  fabricante where nombre like "%e";

#32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre regexp 'w';

#33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where length(nombre) = 4;

#34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from productos where nombre regexp 'portátil';

#35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from productos where nombre regexp 'Monitor' and precio < 215;

#36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from productos where precio >= 180 order by precio desc;
select nombre, precio from productos where precio >= 180 order by precio asc;

#####CONSULTAS MULTITABLA (COMPOSICION INTERNA)####
#1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select p.nombre, p.precio, f.nombre as "Fabricante" from productos as p join fabricante as f on p.codigo_fabricante = f.codigo; 

#2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select p.nombre, p.precio, f.nombre as "Fabricante" from productos as p join fabricante as f on p.codigo_fabricante = f.codigo order by f.nombre asc; 

#3 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select p.codigo, p.nombre, f.codigo, f.nombre from productos as p join fabricante as f on p.codigo_fabricante = f.codigo;

#4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre, min(p.precio), f.nombre from productos as p join fabricante as f on p.codigo_fabricante = f.codigo;

#5 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, max(p.precio), f.nombre from productos as p join fabricante as f on p.codigo_fabricante = f.codigo;

#6 Devuelve una lista de todos los productos del fabricante Lenovo.
select * from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre = 'Lenovo';
select * from productos join fabricante as f on codigo_fabricante = f.codigo where f.nombre = 'Lenovo';

#7 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select * from productos as p join fabricante as f on codigo_fabricante = f.codigo where f.nombre = 'Crucial' and p.precio > 200;

#8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select * from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre = "Asus" or f.nombre = "Hewleet-Packard" or f.nombre = "Seagate";

#9 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select * from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre in('Asus','Hewleet-Packard','Seagate');

#10 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select * from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre like '%e';

#11 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select * from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre regexp 'w';

#12 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio, f.nombre from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where precio >= 180 order by precio desc; 
select p.nombre, p.precio, f.nombre from productos as p join fabricante as f on p.codigo_fabricante = f.codigo where precio >= 180 order by precio asc;

#13 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select fabricante.codigo, fabricante.nombre from fabricante JOIN productos on fabricante.codigo = producto.codigo_fabricante 

#####CONSULTAS MULTITABLA#####
#1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

select f.codigo, f.nombre, p.nombre from fabricante as f left join productos as p on f.codigo = p.codigo_fabricante;
select f.codigo, f.nombre, p.nombre from fabricante as f right join productos as p on f.codigo = p.codigo_fabricante;
select f.codigo, f.nombre, p.nombre from fabricante as f join productos as p on f.codigo = p.codigo_fabricante;

select * from fabricante as f left join productos as p on f.codigo = p.codigo_fabricante;
select * from fabricante as f right join productos as p on f.codigo = p.codigo_fabricante;
select * from fabricante join productos on f.codigo = p.codigo_fabricante;

#INNER JOIN: Devuelve registros que tienen valores coincidentes en ambas tablas
#LEFT JOIN: Devuelve todos los registros de la tabla de la izquierda y los registros coincidentes de la tabla de la derecha.
#RIGHT JOIN: Devuelve todos los registros de la tabla de la derecha y los registros coincidentes de la tabla de la izquierda.
#CROSS JOIN: Devuelve todos los registros de ambas tablas

select * from fabricante left join productos on fabricante.codigo = productos.codigo_fabricante;
select * from fabricante right join productos on fabricante.codigo = productos.codigo_fabricante;
select * from fabricante join productos on fabricante.codigo = productos.codigo_fabricante;
#2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

#3 ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

#Subconsultas where
#Operadores basicos de comparacion
#1Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from productos where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo");

#2Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from productos where precio = (select max(precio) from productos where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo"));

#3Lista el nombre del producto más caro del fabricante Lenovo.
select nombre, precio from productos where precio = (select max(precio) from productos where codigo_fabricante = (select codigo from fabricante where nombre = "Lenovo"));

#4Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select nombre, precio from productos where precio = (select min(precio) from productos where codigo_fabricante = (select codigo from fabricante where nombre = "Hewlett-Packard"));

#5Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.


#6Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.


#Subconsultas con ALL y ANY
#1Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.


#2Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.


#3Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).


#4Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).


#Subconsultas con IN y NOT IN
Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
#Subconsultas con EXISTS y NOT EXISTS
Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
#Subconsultas correlacionadas
Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
Lista el nombre del producto más caro del fabricante Lenovo.
#Subconsultas (En la cláusula HAVING)
Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.