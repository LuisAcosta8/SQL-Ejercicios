/*Ejercicios propuestos por José Juan Sánchez Hernández
https://josejuansanchez.org/bd/resources/index.html
*/

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


/*Consultas sobre una tabla*/
#Lista el nombre de todos los productos que hay en la tabla producto.
SELECT NOMBRE FROM PRODUCTO;
#Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT NOMBRE, PRECIO FROM PRODUCTO;
#Lista todas las columnas de la tabla producto.
SELECT * FROM PRODUCTO;
#Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT NOMBRE, PRECIO, PRECIO*1.01 FROM PRODUCTO;
#Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT NOMBRE AS "NOMBRE DE PRODUCTO", PRECIO AS "EUROS", PRECIO*1.01 AS "DOLARES" FROM PRODUCTO;
#Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(NOMBRE) FROM PRODUCTO;
#Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(NOMBRE) FROM PRODUCTO;
#Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT NOMBRE, UPPER(SUBSTRING(NOMBRE,1,2)) FROM FABRICANTE;
#Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTO;
#Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT NOMBRE, TRUNCATE(PRECIO, 0) FROM PRODUCTO;
#Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT CODIGO_FABRICANTE FROM PRODUCTO;
#Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(CODIGO_FABRICANTE) FROM PRODUCTO;
SELECT CODIGO_FABRICANTE FROM PRODUCTO GROUP BY CODIGO_FABRICANTE;
#Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;
#Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;
#Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT NOMBRE FROM PRODUCTO ORDER BY NOMBRE ASC;
SELECT NOMBRE FROM PRODUCTO ORDER BY PRECIO DESC;
#Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM FABRICANTE LIMIT 5;
#Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT NOMBRE FROM FABRICANTE WHERE CODIGO >= 4 LIMIT 2;
#Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 1; 
#Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 1; 
#Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE = 2;
#Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO <= 120;
#Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >= 400;
#Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO < 400;
#Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >= 80 AND PRECIO <= 300;
#Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >= 60 AND PRECIO <= 200;
#Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO > 200 AND CODIGO_FABRICANTE = 6;
#Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT NOMBRE, CODIGO_FABRICANTE FROM PRODUCTO WHERE CODIGO_FABRICANTE = 1 OR CODIGO_FABRICANTE = 3 OR CODIGO_FABRICANTE = 5;
#Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT NOMBRE, CODIGO_FABRICANTE FROM PRODUCTO WHERE CODIGO_FABRICANTE IN (1,3,5);
#Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT NOMBRE, PRECIO*100 AS "CENTIMOS" FROM PRODUCTOS;
#Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE "S%";
#Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE "%e";
#Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE "%w%";
#Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE FROM FABRICANTE WHERE LENGTH(NOMBRE) = 4;
#Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nom"gtx"bre.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE "%gtx%";
#Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE "%MONITOR%";
#Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= 180 ORDER BY PRECIO DESC, NOMBRE ASC;



/*Consultas multitabla (Composición interna)*/

#Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE AS "NOMBRE FABRICANTE"
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
#Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE 
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY FABRICANTE.NOMBRE ASC;
#Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, FABRICANTE.CODIGO, FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
#Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT PRODUCTO.NOMBRE, MIN(PRODUCTO.PRECIO), FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
#Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT PRODUCTO.NOMBRE, MAX(PRODUCTO.PRECIO), FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
#Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT PRODUCTO.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Lenovo";
#Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT PRODUCTO.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Crucial" AND PRODUCTO.PRECIO > 200;
#Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT PRODUCTO.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" OR FABRICANTE.NOMBRE = "Hewlett-Packardy" OR FABRICANTE.NOMBRE = "Seagate";
#Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT PRODUCTO.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE IN ("Asus","Hewlett-Packardy","Seagate");
#Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "%w%";
#Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
ORDER BY PRODUCTO.PRECIO DESC, PRODUCTO.NOMBRE ASC;
#Devuelve un listado con el código y el nombre defabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos
/*-------------FALTA-----------------*/

/*Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/
#Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE
FROM FABRICANTE LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;
#AL REVES
SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE
FROM FABRICANTE RIGHT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;
#Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT FABRICANTE.NOMBRE
FROM FABRICANTE LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRODUCTO.NOMBRE IS NULL;
#¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
#SI, EN CASO DE QUE EL CAMPO NOMBRE EN LA TABLA FABRICANTE NO SEA OBLIGATORIO



/*Consultas resumen*/

#Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(NOMBRE) FROM PRODUCTO;
#Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(NOMBRE) FROM FABRICANTE;
#Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT CODIGO_FABRICANTE) FROM PRODUCTO;
#Calcula la media del precio de todos los productos.
SELECT AVG(PRECIO) FROM PRODUCTO;
#Calcula el precio más barato de todos los productos.
SELECT MIN(PRECIO) FROM PRODUCTO;
#Calcula el precio más caro de todos los productos.
SELECT MAX(PRECIO) FROM PRODUCTO;
#Lista el nombre y el precio del producto más barato.
SELECT NOMBRE, MIN(PRECIO) FROM PRODUCTO;
#Lista el nombre y el precio del producto más caro.
SELECT NOMBRE, MAX(PRECIO) FROM PRODUCTO;
#Calcula la suma de los precios de todos los productos.
SELECT SUM(PRECIO) FROM PRODUCTO;
#Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(PRODUCTO.NOMBRE) 
FROM PRODUCTO INNER JOIN FABRICANTE 
ON  PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";
#Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(PRODUCTO.PRECIO) 
FROM PRODUCTO INNER JOIN FABRICANTE
ON  PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";
#Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT PRODUCTO.NOMBRE, MIN(PRODUCTO.PRECIO), FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON  PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";
#Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT PRODUCTO.NOMBRE, MAX(PRODUCTO.PRECIO), FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON  PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";
#Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(PRODUCTO.PRECIO)
FROM PRODUCTO INNER JOIN FABRICANTE
ON  PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";
#Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT FABRICANTE.NOMBRE, MAX(PRODUCTO.PRECIO), MIN(PRODUCTO.PRECIO), COUNT(PRODUCTO.NOMBRE)
FROM FABRICANTE INNER JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE FABRICANTE.NOMBRE = "Crucial";
#Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT FABRICANTE.NOMBRE, COUNT(PRODUCTO.NOMBRE)
FROM FABRICANTE LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.CODIGO
ORDER BY COUNT(PRODUCTO.NOMBRE) DESC;
#Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT FABRICANTE.NOMBRE, MAX(PRODUCTO.PRECIO), MIN(PRODUCTO.PRECIO), COUNT(PRODUCTO.PRECIO)
FROM FABRICANTE  JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.CODIGO;
#Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*)
FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200;
#Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante
SELECT FABRICANTE.NOMBRE, MAX(PRODUCTO.PRECIO), MIN(PRODUCTO.PRECIO), AVG(PRODUCTO.PRECIO), COUNT(PRODUCTO.NOMBRE)
FROM  PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY CODIGO_FABRICANTE
HAVING AVG(PRECIO) > 200; 
#Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(NOMBRE) FROM PRODUCTO WHERE PRECIO >= 180;
SELECT COUNT(*) FROM PRODUCTO WHERE PRECIO >= 180;
#Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT FABRICANTE.NOMBRE, COUNT(*)
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
GROUP BY PRODUCTO.CODIGO_FABRICANTE;
#Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT FABRICANTE.CODIGO, AVG(PRODUCTO.PRECIO) 
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.CODIGO
ORDER BY FABRICANTE.CODIGO;
SELECT codigo_fabricante, AVG(precio)
FROM producto
GROUP BY codigo_fabricante;
#Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT FABRICANTE.NOMBRE, AVG(PRODUCTO.PRECIO)
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.CODIGO
ORDER BY FABRICANTE.CODIGO;
#Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT FABRICANTE.NOMBRE, AVG(PRODUCTO.PRECIO)
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.NOMBRE
HAVING AVG(PRODUCTO.PRECIO) >= 150;
#Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT FABRICANTE.NOMBRE, COUNT(PRODUCTO.CODIGO_FABRICANTE)
FROM FABRICANTE INNER JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.NOMBRE
HAVING COUNT(PRODUCTO.CODIGO_FABRICANTE) >= 2;

#Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
/* un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
productos que cumplan la condición.*/
SELECT FABRICANTE.NOMBRE, COUNT(PRODUCTO.NOMBRE)
FROM FABRICANTE INNER JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRECIO >= 220
GROUP BY FABRICANTE.NOMBRE;
#Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
/*un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si
hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el
listado con un valor igual a 0 en el número de productos*/
SELECT FABRICANTE.NOMBRE, COUNT(PRODUCTO.NOMBRE)
FROM FABRICANTE RIGHT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRECIO >= 220
GROUP BY FABRICANTE.NOMBRE;
SELECT fabricante.nombre, COUNT(producto.codigo) 
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.codigo
UNION
SELECT fabricante.nombre, 0
FROM fabricante
WHERE fabricante.codigo NOT IN (
 SELECT fabricante.codigo
 FROM fabricante INNER JOIN producto 
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE producto.precio >= 220
 GROUP BY fabricante.codigo)
ORDER BY 2 DESC;
#Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT FABRICANTE.NOMBRE, SUM(PRODUCTO.PRECIO)
FROM FABRICANTE INNER JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.NOMBRE
HAVING SUM(PRODUCTO.PRECIO) > 1000;
#Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El 
/*resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El 
resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del 
fabricante.*/
SELECT PRODUCTO.NOMBRE, MAX(PRODUCTO.PRECIO), FABRICANTE.NOMBRE
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.NOMBRE
ORDER BY FABRICANTE.NOMBRE ASC;



#Subconsultas (En la cláusula WHERE)
/*Con operadores básicos de comparación*/
#Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM PRODUCTO 
WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Lenovo");
#Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM PRODUCTO 
WHERE PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTO 
WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Lenovo"));
#Lista el nombre del producto más caro del fabricante Lenovo.
SELECT NOMBRE, MAX(PRECIO) FROM PRODUCTO WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Lenovo");
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTO WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Lenovo"));
#Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO = (SELECT MIN(PRECIO) FROM PRODUCTO WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Hewlett-Packard"));
#Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM PRODUCTO WHERE PRECIO >= (SELECT MAX(PRECIO) FROM PRODUCTO WHERE CODIGO_FABRICANTE = (SELECT CODIGO FROM FABRICANTE WHERE NOMBRE = "Lenovo"));
#Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Asus' AND producto.precio > (
 SELECT AVG(precio)
 FROM fabricante INNER JOIN producto
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.nombre = 'Asus');
/*Subconsultas con ALL y ANY*/
#Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >= ALL (SELECT PRECIO FROM PRODUCTO);
#Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO <= ALL (SELECT PRECIO FROM PRODUCTO);
#Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT NOMBRE FROM FABRICANTE WHERE CODIGO = ANY(SELECT CODIGO_FABRICANTE FROM PRODUCTO);
#Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT NOMBRE FROM FABRICANTE WHERE CODIGO != ALL(SELECT CODIGO_FABRICANTE FROM PRODUCTO);



/*Subconsultas con IN y NOT IN*/
#Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT NOMBRE FROM FABRICANTE WHERE CODIGO IN (SELECT CODIGO_FABRICANTE FROM PRODUCTO);
#Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT NOMBRE FROM FABRICANTE WHERE CODIGO NOT IN (SELECT CODIGO_FABRICANTE FROM PRODUCTO);



/*Subconsultas con EXISTS y NOT EXISTS*/
#Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT NOMBRE FROM FABRICANTE WHERE EXISTS (SELECT CODIGO_FABRICANTE FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO);
#Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS)
SELECT NOMBRE FROM FABRICANTE WHERE NOT EXISTS (SELECT CODIGO_FABRICANTE FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO);



/*Subconsultas correlacionadas*/
#Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo 
WHERE producto.precio =
(
 SELECT MAX(precio)
 FROM producto
 WHERE codigo_fabricante = fabricante.codigo
);
#Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE 
FROM PRODUCTO INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= (SELECT AVG(PRECIO) FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO);
#Lista el nombre del producto más caro del fabricante Lenovo.
SELECT PRODUCTO.NOMBRE
FROM FABRICANTE INNER JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE FABRICANTE.NOMBRE = "Lenovo" AND PRODUCTO.PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO);
/*Subconsultas (En la cláusula HAVING)*/
#Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo
SELECT fabricante.nombre
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) >= (
 SELECT COUNT(producto.codigo)
 FROM fabricante INNER JOIN producto
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.nombre = 'Lenovo');
 