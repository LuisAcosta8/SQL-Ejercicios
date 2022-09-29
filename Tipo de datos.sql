#Tipodedatos
#NUMERICOS
#Enteros
tinyint (-127,128)  #Se utiliza el unsigned para que los numeros sean solo positivos
smallint #32k de numeros
mediumint #5 millones de numeros
int o integer #200 millones de numeros
bigint 
#Decimales
float (longitudtotal, decimales 0-24) #-199.99 al 999.99
double 
decimal 
#Cadenas
char (255 caracteres)
varchar (65534 caracteres) #La diferencia entre char y varchar es que si se utiliza char va a ocupar en memoria todos los espacios que no se ocuparon ejemplo: nombre juan****** char(10) nombre juan varchar(10)
binary y varbinary #Es lo mismo que char y varchar pero en estos se almacenan bytes
text
blob
tinyblob(255) mediumblob y longblob(4gb)
enum #Especificar el numero de datos que se va a ingresar
set #(conjunto)  como el enum pero permite seleccionar varias opciones

#Fecha
date #Almacenar fechas AAAA-MM-DD
datetime #Fecha y horario en un instante AAAA-MM-DD HH:MM:SS
time #Hora HH:MM:SS
timestamp
on update current_timestamp
year #año



