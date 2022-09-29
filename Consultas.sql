 --Where
 select * from articulos where nombre = 'impresora';
 select nombre, descripcion from articulos where nombre = 'mouse';
 
 --Operadores
 /*
 =      --> Igual
 !=     --> Distinto a
 >      --> mayor a
 <      --> menor a
 >=     --> mayor o igual a
 <=     --> menor o igual a
 */
 
 select * from articulos where nombre = 'monitor';
 select * from articulos where nombre != 'monitor';
 select * from articulos where precio > 100;
 select * from articulos where precio < 100;
 select * from articulos where precio >= 100;
 select * from articulos where precio <= 100;
 
 
 --Delete
 create table agenda(
  apellido varchar2(30),
  nombre varchar2(20),
  domicilio varchar2(30),
  telefono varchar2(11)
 );

 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Alvarez','Alberto','Colon 123','4234567');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Salas','Susana','Gral. Paz 1234','4123456');
   
 select * from agenda;
 delete from agenda where nombre = 'Juan';
 select * from agenda;
 
 --borrar todo
 delete from agenda;
 select * from agenda;
 
 
 --update (tabla articulos)
 select * from articulos;
 update articulos set precio = 600 where descripcion = 'Epson Stylus C85';
 select * from articulos;
 update articulos set nombre = 'impresora' where codigo = 8;
 select * from articulos;
 
 --update para varios campos de un mismo registro
 update articulos set nombre = 'impresora', precio = 500 where codigo = 2;
 select * from articulos;
 
 --Actualizar todos los campos de una columna
 update articulos set precio = 1000;
 
 
 --Comentarios
 /*
 comentarios
 multilinea
 */
 
 --null
 /*
 No se pueden dejar vacios, es obligatorio insertar datos en esa columna
 */
 
 create table libros3(
                    titulo varchar(30) not null,
                    autor varchar(20) not null,
                    editorial varchar(15) null,
                    precio number(5,2)
                    );
                    
 insert into libros3 values('El aleph','Borges','Emece',null);
 select * from libros3;
 
 insert into libros3 values(null, 'Lewis Carrol','Campos',300.00); --Error - campo titulo no puede ser null
 insert into libros3 values('Alicia', 'Lewis Carrol','Campos',300.00); --Registro ingresado correctamente
 select * from libros3;
 
 insert into libros3 values('El quijote', 'Miguel de Cervantes','Casa del libro',0);
 select * from libros3;
 
 
 -- is null
 create table medicamentos(
  codigo number(5) not null,
  nombre varchar2(20) not null,
  laboratorio varchar2(20),
  precio number(5,2),
  cantidad number(3,0) not null
 );

 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
  
 select * from medicamentos where laboratorio is null;
 select * from medicamentos where precio is null;
 select * from medicamentos where laboratorio is not null;
 select * from medicamentos where precio is not null;
 select * from medicamentos where laboratorio = ' ';            --Campos vacios
 select * from medicamentos;
 
 
 --primary key - Campo unico no se repite
 select * from empleado;
 create table usuarios(
                                    nombre varchar(20) not null,
                                    clave varchar2(10) not null,
                                    primary key (nombre)
                                    );
 insert into usuarios values('José','123456');
 insert into usuarios values('Manuel','456123');
 insert into usuarios values('José','145623');      --Error - campo nombre no puede repetirse
 select * from usuarios;
 describe usuarios;
 
 
 --Truncate Vacia los registros de la tabla
 select * from articulos;
 delete from articulos;
 select * from articulos;
 rollback;                  --Deshace la accion anterior solo funciona para cuando borras por completo algo
 select * from articulos;
 truncate table articulos;
 select * from articulos;
 
 --default
 create table libros4(
                    titulo varchar2(40) not null,
                    autor varchar2(30) default 'Desconocido',
                    editorial varchar2(40) not null,
                    precio number(5,2),
                    cantidad number(3) default 0
                    );
                    
 insert into libros4 values ('El quijote','Miguel de Cervantes','La casa del libro',650.00,10);
 insert into libros4 values ('Guerra y paz',default,'Mensajero ruso',50.00,5);
 select * from libros4;
 insert into libros4 values ('Cien años de soledad','Gabriel G Marquez','Sudamericana',480.00,default);
 
 --Columnas calculadas
 select titulo, precio, cantidad, precio*cantidad from libros4;
 select titulo, precio, cantidad, precio-(precio*0.1) from libros4;  
 update libros4 set precio = precio-(precio*0.1);
 select * from libros4;
 select titulo || ' ' || autor as "libro autor" from libros4;        --Un solo campo
 select titulo, autor from libros4;                                  --Dos campos
 select titulo || ' $' || precio from libros4;
 --Alias --> as
 select * from articulos;
 select nombre, descripcion, precio+(precio*.20) as "recargo" from articulos where nombre = 'impresora';
 
 
 --Funciones string
 --chr(num)    --> caracter ascii
 select chr(64) from dual;
 select ascii('d') from dual;
 select * from dual;
 
 --concat || o concat('buenas','tardes')
 -- initcap('buenas tardes') --> 'Buenas tardes'
 -- lower('BUENAS tardes')   --> 'buenas tardes'
 -- upper('buenas tardes')   --> 'BUENAS TARDES'
 -- lpad('oracle',11,abc)    --> 'abcaboracle'  --> (palabra,numerodeespacios,relleno) --> Rellena con el tercer argumento hasta completar la longitud de caracteres del segundo argumento a la izquierda
 -- rpad('oracle',11,abc)    --> 'oracleabcab' --> (palabra,numerodeespacios,relleno) --> Rellena con el tercer argumento hasta completar la longitud de caracteres del segundo argumento a la derecha
 -- ltrim('curso de oracle','cur') --> 'so de oracle'
 -- rtrim('curso de oracle','cle') --> 'curso de ora'
 -- trim('    oracle    ')   --> 'oracle'
 -- replace ('www.oracle.com', 'w', 'p') --> 'ppp.oracle.com'
 -- substr('www.oracle.com', 1, 10) --> 'www.oracle' --> ('string',inicial,final)
 -- substr('www.oracle.com', -3) --> 'com' --> ('string',inicial,final)
 -- length('www.oracle.com') --> 14
 -- instr('curso de oracle sql','curso') --> 1 -->posicion de caracter
 -- translate('curso de oracle sql','aoe', 'xyz') --> 'cursy dz yrxclz'
 
 -- Funciones matematicas
 -- abs(-50) --> 50
 -- ceil(15.50) --> 16
 -- floor(15.50) --15
 -- mod(10,3) --> 1
 -- power(2,3) --> 8
 -- round(123.456,1) --> 123.5
 -- sign(-100) --> -1   sign(100) --> 1
 -- trunc(123.456,1) --> 123.4
 -- sqrt(9) --> 3
 -- round(sqrt(27)) --> 5
 
 --Funciones date
 -- add_moths(to_date('10/10/2020','dd/mm/yyyy'), 5) --> 10/03/2021
 -- add_moths(to_date('10/10/2020','dd/mm/yyyy'), -5) --> 10/05/2020
 -- last_day(to_date('09/02/2020','dd/mm/yyyy')) --> 29/02/20
 -- months_between(to_date('19/05/2020','dd/mm/yyyy'),to_date('19/08/2020','dd/mm/yyyy')) --> -3
 -- next_day(to_date('10/08/2020', 'dd/mm/yyyy'), 'LUNES') --> 17/08/2020    Si esta en ingles hya q colocar el dia en ingles
 -- current_date --> fecha y/o hora actual
 -- sysdate --> fecha del sistema
 -- current_timestamp --> fecha, hora y region
 -- systimestamp --> fecha y hora actuales configuradas en el sistema
 -- to_char('10/10/2020') --> 10/10/2020
 
 
 -- order by
 drop table articulos;
 CREATE TABLE ARTICULOS(
ID_ARTICULO	INT NOT NULL PRIMARY KEY,
ARTICULO VARCHAR2(50) NOT NULL,
COD_FABRICANTE	NUMBER(10) NOT NULL,
PESO NUMBER(4) NOT NULL,
CATEGORIA	VARCHAR2(50),
PRECIO_VENTA NUMBER(6,2),
PRECIO_COSTO NUMBER(6,2),
EXISTENCIAS	NUMBER(5)
);
     
insert into articulos values(2,'TALADRO WALT',1012546955,45,'CONSTRUCCION',400,560,20);
insert into articulos values(3,'ALICATE ACE',1012432365,23,'MECANICA',200,350.25,120);
insert into articulos values(4,'PALA SENIC',1012345678,16,'CONSTRUCCION',100,230.5,200);
insert into articulos values(5,'TALADRO MILLWAKEE',1012545210,55,'CONSTRUCCION',300,423.5,50);
insert into articulos values(6,'GRIFO APERTURA MANOS',1010023654,26,'PLOMERIA',400,560.25,90);
insert into articulos values(7,'FREGADERO MURAL',1015487966,200,'PLOMERIA',600,780.50,52);
insert into articulos values(8,'TALADRO ELECTRICO BOSCH',1025493013,34,'CONSTRUCCION',250,380.25,41);
insert into articulos values(9,'CEPILLO CONICO ONDULADO',1025852000,44,'EBANISTERIA',150,240.25,88);
insert into articulos values(10,'CEPILLO TAZA ONDULADO',122247789,49,'EBANISTERIA',148,240.50,90);
insert into articulos values(11,'CEPILLO TAZA TRENZADA',1016467985,	42,'EBANISTERIA',139,210.50,89);

select * from articulos;
select * from articulos order by id_articulo desc;  --select * from articulos order by 1 desc;
select * from articulos order by id_articulo asc;   ----select * from articulos order by 1 ;


-- and, or y not 

create table peliculas(
  codigo number(4) primary key,
  titulo varchar2(40) not null,
  actor varchar2(20),
  duracion number(3)
  );

 insert into peliculas values(1020,'Mision imposible','Tom Cruise',120);
 insert into peliculas values(1021,'Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas values(1022,'Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas values(1200,'Mision imposible 2','Tom Cruise',120);
 insert into peliculas values(1234,'Mujer bonita','Richard Gere',120);
 insert into peliculas values(900,'Tootsie','D. Hoffman',90);
 insert into peliculas values(1300,'Un oso rojo','Julio Chavez',100);
 insert into peliculas values(1301,'Elsa y Fred','China Zorrilla',110);
 
 select * from peliculas;
 select * from peliculas where actor = 'Tom Cruise' or actor = 'Richard Gere';
 select * from peliculas where actor = 'Tom Cruise' and duracion >= 100;
 select * from peliculas where not actor = 'Daniel R.'
 select * from peliculas where actor = 'Daniel R.' and duracion = 180;
 select * from peliculas where actor = 'Daniel R.' and duracion > 180;
 select * from peliculas where duracion >= 100 and duracion <= 120;
 
 
 -- between
 
 
 