/*GESTIÓN DE EMPLEADOS*/

DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;
CREATE TABLE departamento (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
);
CREATE TABLE empleado (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
codigo_departamento INT UNSIGNED,
FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);


SELECT * FROM DEPARTAMENTO;
SELECT * FROM EMPLEADO;



/*Consultas sobre una tabla*/
#Lista el primer apellido de todos los empleados.
SELECT APELLIDO1 FROM EMPLEADO;
#Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT(APELLIDO1) FROM EMPLEADO;
#Lista todas las columnas de la tabla empleado.
SELECT * FROM EMPLEADO;
#Lista el nombre y los apellidos de todos los empleados.
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM EMPLEADO;
#Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO;
#Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(CODIGO_DEPARTAMENTO) FROM EMPLEADO;
#Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(NOMBRE," ",APELLIDO1," ",APELLIDO2) AS "NOMBRE COMPLETO" FROM EMPLEADO;
#Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(CONCAT(NOMBRE," ",APELLIDO1," ",APELLIDO2)) AS "NOMBRE COMPLETO" FROM EMPLEADO;
#Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(CONCAT(NOMBRE," ",APELLIDO1," ",APELLIDO2)) AS "NOMBRE COMPLETO" FROM EMPLEADO;
#Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará unicamente los dígitos del nif y la otra la letra.
SELECT CODIGO, SUBSTRING(NIF, 1,8) AS NIF, SUBSTRING(NIF,-1) AS LETTER FROM EMPLEADO; 
#Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular
/*este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se
han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos.
Utilice un alias apropiado para la nueva columna columna que está calculando.*/
SELECT NOMBRE, PRESUPUESTO-GASTOS AS "$ DISPONIBLE" FROM DEPARTAMENTO;
#Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT NOMBRE, PRESUPUESTO-GASTOS AS DISPONIBLE FROM DEPARTAMENTO ORDER BY DISPONIBLE ASC;
#Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT NOMBRE FROM DEPARTAMENTO ORDER BY NOMBRE ASC;
#Lista el nombre de todos los departamentos ordenados de forma desscendente.
SELECT NOMBRE FROM DEPARTAMENTO ORDER BY NOMBRE DESC;
#Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
SELECT APELLIDO1, APELLIDO2, NOMBRE FROM EMPLEADO ORDER BY APELLIDO1, NOMBRE;
#Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO ORDER BY PRESUPUESTO DESC LIMIT 3;
#Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO ORDER BY PRESUPUESTO ASC LIMIT 3;
#Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT NOMBRE, GASTOS FROM DEPARTAMENTO ORDER BY GASTOS ASC LIMIT 2;
#Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT NOMBRE, GASTOS FROM DEPARTAMENTO ORDER BY GASTOS DESC LIMIT 2;
#Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * FROM EMPLEADO WHERE CODIGO >= 3 LIMIT 5;
#Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO >= 150000;
#Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT NOMBRE, GASTOS FROM DEPARTAMENTO WHERE GASTOS < 5000;
#Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO >= 100000 AND PRESUPUESTO <=200000;
#Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO <= 100000 OR PRESUPUESTO >=200000;
#Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT NOMBRE FROM DEPARTAMENTO WHERE PRESUPUESTO >= 100000 AND PRESUPUESTO <=200000;
#Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT NOMBRE FROM DEPARTAMENTO WHERE PRESUPUESTO <= 100000 AND PRESUPUESTO >=200000;
#Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de Aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
SELECT NOMBRE, GASTOS, PRESUPUESTO FROM DEPARTAMENTO WHERE GASTOS > PRESUPUESTO;
#Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
SELECT NOMBRE, GASTOS, PRESUPUESTO FROM DEPARTAMENTO WHERE GASTOS < PRESUPUESTO;
#Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
SELECT NOMBRE, GASTOS, PRESUPUESTO FROM DEPARTAMENTO WHERE GASTOS = PRESUPUESTO;
#Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IS NULL;
#Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IS NOT NULL;
#Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM EMPLEADO WHERE APELLIDO2 != "López";
#Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT * FROM EMPLEADO WHERE APELLIDO2 = "Dïaz" OR APELLIDO2 = "Moreno";
#Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IN ("Díaz","Moreno");
#Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT NOMBRE, APELLIDO1, APELLIDO2, NIF, CODIGO_DEPARTAMENTO FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO = 3;
#Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT NOMBRE, APELLIDO1, APELLIDO2, NIF, CODIGO_DEPARTAMENTO FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO = 2 OR CODIGO_DEPARTAMENTO = 4 OR CODIGO_DEPARTAMENTO = 5;



/*Consultas multitabla (Composición interna)*/
#Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT EMPLEADO.NOMBRE, EMPLEADO.APELLIDO1, EMPLEADO.APELLIDO2, DEPARTAMENTO.NOMBRE
FROM EMPLEADO INNER JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO;
#Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena
/*el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar
por los apellidos y el nombre de los empleados.*/
SELECT EMPLEADO.NOMBRE, EMPLEADO.APELLIDO1, EMPLEADO.APELLIDO2, DEPARTAMENTO.NOMBRE
FROM EMPLEADO INNER JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO
ORDER BY DEPARTAMENTO.NOMBRE, EMPLEADO.APELLIDO1, EMPLEADO.APELLIDO2, EMPLEADO.NOMBRE;
#Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT DISTINCT(DEPARTAMENTO.CODIGO), DEPARTAMENTO.NOMBRE
FROM DEPARTAMENTO INNER JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO;
#Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que
/*dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual
lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos
que ha generado (columna gastos).*/
SELECT DISTINCT(DEPARTAMENTO.CODIGO), DEPARTAMENTO.NOMBRE, DEPARTAMENTO.PRESUPUESTO-DEPARTAMENTO.GASTOS AS ACTUAL
FROM DEPARTAMENTO INNER JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO;
#Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT DEPARTAMENTO.NOMBRE 
FROM DEPARTAMENTO INNER JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
WHERE EMPLEADO.NIF = "38382980M";
#Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT DEPARTAMENTO.NOMBRE
FROM DEPARTAMENTO INNER JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
WHERE EMPLEADO.NOMBRE = "Pepe" AND EMPLEADO.APELLIDO1 = "Ruiz" AND EMPLEADO.APELLIDO2 = "Santana";
#Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT * 
FROM EMPLEADO INNER JOIN DEPARTAMENTO 
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO 
WHERE DEPARTAMENTO.NOMBRE = "I+D"
ORDER BY EMPLEADO.NOMBRE ASC;
#Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT * 
FROM EMPLEADO INNER JOIN DEPARTAMENTO 
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO 
WHERE DEPARTAMENTO.NOMBRE = "Sistemas" OR DEPARTAMENTO.NOMBRE = "Contabilidad" OR DEPARTAMENTO.NOMBRE = "I+D" 
ORDER BY EMPLEADO.NOMBRE ASC;
#Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT EMPLEADO.NOMBRE
FROM EMPLEADO INNER JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO
WHERE DEPARTAMENTO.PRESUPUESTO < 100000 OR DEPARTAMENTO.PRESUPUESTO > 200000;
#Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
SELECT DEPARTAMENTO.NOMBRE 
FROM DEPARTAMENTO INNER JOIN EMPLEADO
ON DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO
WHERE EMPLEADO.APELLIDO2 IS NULL;
/*Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.*/
#Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
SELECT * 
FROM EMPLEADO LEFT JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO;
#Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT * 
FROM EMPLEADO LEFT JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO
WHERE CODIGO_DEPARTAMENTO IS NULL;
#Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT DEPARTAMENTO.NOMBRE, DEPARTAMENTO.NOMBRE, DEPARTAMENTO.PRESUPUESTO, DEPARTAMENTO.GASTOS 
FROM EMPLEADO RIGHT JOIN DEPARTAMENTO
ON EMPLEADO.CODIGO_DEPARTAMENTO = DEPARTAMENTO.CODIGO
WHERE CODIGO_DEPARTAMENTO IS NULL;
#Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
/*El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.*/
/*---------FALTA---------*/
#Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
/*---------FALTA---------*/



/*Consultas resumen*/
#Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(PRESUPUESTO) AS "PRESUPUESTO TOTAL" FROM DEPARTAMENTO;
#Calcula la media del presupuesto de todos los departamentos.
SELECT AVG(PRESUPUESTO) AS "PRESUPUESTO PROMEDIO" FROM DEPARTAMENTO;
#Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(PRESUPUESTO) AS "PRESUPUESTO MÍNIMO" FROM DEPARTAMENTO;
#Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
SELECT NOMBRE, MIN(PRESUPUESTO) FROM DEPARTAMENTO;
#Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT MAX(PRESUPUESTO) FROM DEPARTAMENTO;
#Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
SELECT NOMBRE, MAX(PRESUPUESTO) FROM DEPARTAMENTO;
#Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(NOMBRE) FROM EMPLEADO;
#Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT COUNT(NOMBRE) FROM EMPLEADO WHERE APELLIDO2 IS NULL;
#Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el codigo del departamento y otra con el número de empleados que tiene asignados.
SELECT CODIGO_DEPARTAMENTO, COUNT(NOMBRE) FROM EMPLEADO GROUP BY CODIGO_DEPARTAMENTO; 
#Devuelve el codigo de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el codigo del departamento y otra con el número de empleados que tiene asignados.
SELECT CODIGO_DEPARTAMENTO, COUNT(NOMBRE) FROM EMPLEADO GROUP BY CODIGO_DEPARTAMENTO HAVING COUNT(NOMBRE) >= 2;
#Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.
SELECT CODIGO_DEPARTAMENTO, COUNT(*) FROM EMPLEADO GROUP BY CODIGO_DEPARTAMENTO /*MAL*/;
#Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
/*---------FALTA---------*/



/*Subconsultas*/
/*Con operadores básicos de comparación*/
#Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT * FROM EMPLEADO WHERE CODIGO_DEPARTAMENTO = (SELECT CODIGO FROM DEPARTAMENTO WHERE NOMBRE = "Sistemas");
#Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO = (SELECT MAX(PRESUPUESTO) FROM DEPARTAMENTO);
#Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO = (SELECT MIN(PRESUPUESTO) FROM DEPARTAMENTO);



/*Subconsultas con ALL y ANY*/
#Devuelve el nombre del departamento conmayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO >= ALL (SELECT PRESUPUESTO FROM DEPARTAMENTO);
#Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT NOMBRE, PRESUPUESTO FROM DEPARTAMENTO WHERE PRESUPUESTO <= ALL (SELECT PRESUPUESTO FROM DEPARTAMENTO);
#Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT NOMBRE FROM DEPARTAMENTO WHERE CODIGO = ANY (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO);
#Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT NOMBRE FROM DEPARTAMENTO WHERE CODIGO != ALL(SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO);



/*Subconsultas con IN y NOT IN*/
#Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT NOMBRE FROM DEPARTAMENTO WHERE CODIGO IN (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO);
#Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT NOMBRE FROM DEPARTAMENTO WHERE CODIGO NOT IN (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO); /*NO SALIO*/



/*Subconsultas con EXISTS y NOT EXISTS*/
#Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT NOMBRE FROM DEPARTAMENTO  WHERE EXISTS (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO);
#Devuelve los nombres de los departamentos que tienen NO empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT NOMBRE FROM DEPARTAMENTO  WHERE NOT EXISTS (SELECT CODIGO_DEPARTAMENTO FROM EMPLEADO WHERE DEPARTAMENTO.CODIGO = EMPLEADO.CODIGO_DEPARTAMENTO);