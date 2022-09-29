CREATE DATABASE IF NOT EXISTS pruebas;
USE pruebas;


CREATE TABLE tblUsuarios (
   idx INT PRIMARY KEY AUTO_INCREMENT,
   usuario VARCHAR(20),
   nombre VARCHAR(20),
   sexo VARCHAR(1),
   nivel TINYINT,
   email VARCHAR(50),
   telefono VARCHAR(20),
   marca VARCHAR(20),
   compañia VARCHAR(20),
   saldo FLOAT,
   activo BOOLEAN
);

INSERT INTO tblUsuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');



#Listar los nombres de los usuarios
select nombre from tblUsuarios;
#Calcular el saldo máximo de los usuarios de sexo “Mujer”
select max(saldo) as 'Saldo Máximo' from tblUsuarios;
#select nombre, saldo from tblUsuarios where saldo = max(saldo); <-- subconsulta
#Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
select nombre, telefono, marca from tblUsuarios where marca = 'NOKIA' or marca = 'BLACKBERRY' or marca = 'SONY';
#Contar los usuarios sin saldo o inactivos
select count(idx) from tblUsuarios where saldo = '0' or activo = '0';
#Listar el login de los usuarios con nivel 1, 2 o 3
select usuario, nivel from tblUsuarios where nivel != '0';
#Listar los números de teléfono con saldo menor o igual a 300
select nombre, telefono, saldo from tblUsuarios where saldo <= '300'; 
#Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
select sum(saldo) from tblUsuarios;
#Contar el número de usuarios por compañía telefónica
select compañia, count(idx) from tblUsuarios group by compañia;
#Contar el número de usuarios por nivel
select nivel, count(idx) from tblUsuarios group by nivel order by nivel asc;
#Listar el login de los usuarios con nivel 2
select nombre, usuario, nivel from tblUsuarios where nivel = '2';
#Mostrar el email de los usuarios que usan gmail
select email from tblUsuarios where email like '%gmail%';
#Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
select nombre, telefono, marca from tblUsuarios where marca = 'LG' or marca = 'SAMSUNG' or marca = 'MOTOROLA';
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG
SELECT nombre, telefono, marca FROM tblUsuarios WHERE marca NOT IN('LG', 'SAMSUNG');
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL
select usuario, telefono, compañia from tblUsuarios where compañia = 'IUSACELL';
#Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL
select usuario, telefono, compañia from tblUsuarios where compañia != 'TELCEL';
select usuario, telefono, compañia from tblUsuarios where compañia <> 'TELCEL';
#Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA
select marca, avg(saldo) as 'Saldo usuarios nokia' from tblUsuarios where marca = "NOKIA";
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL
select usuario, telefono, compañia from tblUsuarios where compañia = 'IUSACELL' or compañia = 'AXEL';
#Mostrar el email de los usuarios que no usan yahoo
select email from tblUsuarios where email not like '%yahoo%';
#Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL
select usuario, telefono, compañia from tblUsuarios where compañia not in ('TELCEL', 'IUSACELL');
#Listar el login y teléfono de los usuarios con compañia telefónica UNEFON
select usuario, telefono from tblUsuarios where compañia = 'UNEFON';
#Listar las diferentes marcas de celular en orden alfabético descendentemente
select distinct marca from tblUsuarios order by marca;
#Listar las diferentes compañias en orden alfabético aleatorio
select distinct compañia from tblUsuarios;
#Listar el login de los usuarios con nivel 0 o 2
select usuario from tblUsuarios where nivel = '0' or nivel = '2';
#calcular el saldo promedio de los usuarios que tienen teléfono marca LG
select avg(saldo) as 'Saldo usuarios con LG' from tblUsuarios where marca = 'LG';
#Listar el login de los usuarios con nivel 1 o 3
############################################################################################
select usuario from tblUsuarios where nivel = '1' or nivel = '3';
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY
select nombre, telefono, marca from tblUsuarios where marca != 'BLACKBERRY';
#Listar el login de los usuarios con nivel 3
select usuario from tblUsuarios where nivel = '3';
#Listar el login de los usuarios con nivel 0
select usuario from tblUsuarios where nivel = '0';
#Listar el login de los usuarios con nivel 1
select usuario from tblUsuarios where nivel = '1';
#Contar el número de usuarios por sexo
select sexo, sum(idx) from tblUsuarios group by sexo; 
#Listar el login y teléfono de los usuarios con compañia telefónica AT&T
select usuario, telefono from tblUsuarios where compañia = 'AT&T';
#Listar las diferentes compañias en orden alfabético descendentemente
select compañia from tblUsuarios group by compañia order by compañia desc;
#Listar el login de los usuarios inactivos
select usuario from tblUsuarios where activo = '0';
#Listar los números de teléfono sin saldo
select telefono from tblUsuarios where saldo = '0';
#Calcular el saldo mínimo de los usuarios de sexo “Hombre”
select min(saldo) from tblUsuarios where sexo = 'H';
#Listar los números de teléfono con saldo mayor a 300
select telefono from tblUsuarios where saldo > '300';
#Contar el número de usuarios por marca de teléfono
select marca, count(idx) from tblUsuarios group by marca;
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG
select nombre, telefono from tblUsuarios where marca != 'LG';
#Listar las diferentes compañias en orden alfabético ascendentemente
select compañia from tblUsuarios group by compañia order by compañia asc;
#Calcular la suma de los saldos de los usuarios de la compañia telefónica UNEFON
select compañia, sum(saldo) from tblUsuarios where compañia = 'UNEFON';
#Mostrar el email de los usuarios que usan hotmail
select email from tblUsuarios where email like '%hotmail%';
#Listar los nombres de los usuarios sin saldo o inactivos
select nombre from tblUsuarios where saldo = '0' or activo = '0';
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL
select usuario, telefono from tblUsuarios where compañia = 'IUSACELL' or compañia = 'TELCEL';
#Listar las diferentes marcas de celular en orden alfabético ascendentemente
select distinct marca from tblUsuarios order by marca asc;
#Listar las diferentes marcas de celular en orden alfabético aleatorio
select distinct marca from tblUsuarios order by marca;
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o UNEFON
select usuario, telefono from tblUsuarios where compañia = 'IUSACELL' or compañia = 'UNEFON';
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTOROLA o NOKIA
select nombre, telefono from tblUsuarios where marca != 'MOTOROLA' or marca != 'NOKIA';
#Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL
select marca, sum(saldo) from tblUsuarios where compañia = 'TELCEL';