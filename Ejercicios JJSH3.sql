/*GESTIÓN DE VENTAS*/

DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
CREATE TABLE cliente (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE comercial (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
comisión FLOAT
);
CREATE TABLE pedido (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
total DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_comercial INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id),
FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);
INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);

/*Consultas sobre una tabla*/
#Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM PEDIDO ORDER BY FECHA DESC;
#Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM PEDIDO ORDER BY TOTAL DESC LIMIT 2;
#Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT ID_CLIENTE FROM PEDIDO GROUP BY ID_CLIENTE;
#Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500
SELECT * FROM PEDIDO WHERE FECHA LIKE "%2017%" AND TOTAL > 500; 
#Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM COMERCIAL WHERE COMISIÓN > 0.05 AND COMISIÓN < 0.11;
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM COMERCIAL WHERE COMISIÓN BETWEEN 0.05 AND 0.11;
#Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT MAX(COMISIÓN) FROM COMERCIAL;
#Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT * FROM CLIENTE WHERE APELLIDO2 IS NULL;
#Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT NOMBRE FROM CLIENTE WHERE NOMBRE LIKE "A%N" OR NOMBRE LIKE "P%" ORDER BY NOMBRE ASC;
#Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT NOMBRE FROM CLIENTE WHERE NOMBRE NOT LIKE "A%" ORDER BY NOMBRE ASC;
#Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT NOMBRE FROM COMERCIAL WHERE NOMBRE LIKE "%EL" OR NOMBRE LIKE "%O";



/*Consultas multitabla (Composición interna)*/
#Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT(CLIENTE.ID), CLIENTE.NOMBRE, CLIENTE.APELLIDO1, CLIENTE.APELLIDO2 
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
ORDER BY CLIENTE.NOMBRE;
#Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT * 
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
ORDER BY CLIENTE.NOMBRE;
#Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT * 
FROM PEDIDO INNER JOIN COMERCIAL
ON PEDIDO.ID_COMERCIAL = COMERCIAL.ID;
#Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT * 
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
INNER JOIN COMERCIAL
ON PEDIDO.ID_COMERCIAL = COMERCIAL.ID
ORDER BY CLIENTE.NOMBRE;
#Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT * 
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
WHERE PEDIDO.FECHA LIKE "%2017%" AND PEDIDO.TOTAL BETWEEN 300 AND 1000;
#Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT COMERCIAL.NOMBRE, COMERCIAL.APELLIDO1, COMERCIAL.APELLIDO2
FROM COMERCIAL INNER JOIN PEDIDO
ON COMERCIAL.ID = PEDIDO.ID_COMERCIAL
INNER JOIN CLIENTE
ON PEDIDO.ID_CLIENTE = CLIENTE.ID
WHERE CLIENTE.NOMBRE = "MARÍA" AND CLIENTE.APELLIDO1 = "SANTANA" AND CLIENTE.APELLIDO2 = "MORENO";
#Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT DISTINCT(CLIENTE.NOMBRE) 
FROM CLIENTE INNER JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
INNER JOIN COMERCIAL
ON PEDIDO.ID_COMERCIAL = COMERCIAL.ID
WHERE COMERCIAL.NOMBRE = "DANIEL" AND COMERCIAL.APELLIDO1 = "SÁEZ" AND COMERCIAL.APELLIDO2 = "VEGA";



/*Consultas multitabla (Composición externa)*/
/*Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/
#Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT * 
FROM CLIENTE LEFT JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE;
#Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT * 
FROM COMERCIAL LEFT JOIN PEDIDO
ON COMERCIAL.ID = PEDIDO.ID_COMERCIAL;
#Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * 
FROM CLIENTE LEFT JOIN PEDIDO
ON CLIENTE.ID = PEDIDO.ID_CLIENTE
WHERE PEDIDO.ID_CLIENTE IS NULL;
#Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT * 
FROM COMERCIAL LEFT JOIN PEDIDO
ON COMERCIAL.ID = PEDIDO.ID_COMERCIAL
WHERE PEDIDO.ID_COMERCIAL IS NULL;
#Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.

#¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.




SELECT * FROM CLIENTE;
SELECT * FROM COMERCIAL;
SELECT * FROM PEDIDO;
/*Consultas resumen*/
#Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(TOTAL) FROM PEDIDO;
#Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(TOTAL) FROM PEDIDO;
#Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(NOMBRE) FROM COMERCIAL;
SELECT * FROM COMERCIAL;
#Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(NOMBRE) FROM CLIENTE;
#Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(TOTAL) FROM PEDIDO;
#Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(TOTAL) FROM PEDIDO;
#Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT MAX(CATEGORÍA), CIUDAD FROM CLIENTE GROUP BY CIUDAD;
#Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

#Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

#Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

#Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

#Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

#Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.

#Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

#Devuelve el número total de pedidos que se han realizado cada año.




/*Subconsultas*/
/*Con operadores básicos de comparación*/
#Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT ID, TOTAL, FECHA FROM PEDIDO WHERE ID_CLIENTE = (SELECT ID FROM CLIENTE WHERE NOMBRE = "ADELA" AND APELLIDO1 = "SALAS" AND APELLIDO2 = "DÍAZ");
#Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT COUNT(ID) FROM PEDIDO WHERE ID_COMERCIAL = (SELECT ID FROM COMERCIAL WHERE NOMBRE = "DANIEL" AND APELLIDO1 = "SÁEZ" AND APELLIDO2 = "VEGA");
#Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
SELECT NOMBRE, APELLIDO1, APELLIDO2, CIUDAD FROM CLIENTE WHERE ID = (SELECT ID_CLIENTE FROM PEDIDO WHERE FECHA LIKE "%2019%" HAVING MAX(TOTAL));
#Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT FECHA, MIN(TOTAL) FROM PEDIDO WHERE ID_CLIENTE = (SELECT ID FROM CLIENTE WHERE NOMBRE = "PEPE" AND APELLIDO1 = "RUIZ" AND APELLIDO2 = "SANTANA");
#Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT CLIENTE.NOMBRE, CLIENTE.APELLIDO1, CLIENTE.APELLIDO2, PEDIDO.ID, PEDIDO.TOTAL, PEDIDO.FECHA 
FROM CLIENTE INNER JOIN PEDIDO 
WHERE TOTAL >= (SELECT AVG(TOTAL) FROM PEDIDO WHERE FECHA LIKE"%2017%");



/*Subconsultas con ALL y ANY*/
#Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
SELECT ID, TOTAL, FECHA FROM PEDIDO WHERE TOTAL >= ALL(SELECT TOTAL FROM PEDIDO);
#Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM CLIENTE WHERE ID != ALL(SELECT ID_CLIENTE FROM PEDIDO);
#Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM COMERCIAL WHERE ID != ALL(SELECT ID_COMERCIAL FROM PEDIDO);



/*subconsultas con IN y NOT IN*/
#Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

#Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).




/*Subconsultas con EXISTS y NOT EXISTS*/
#Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

#Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
