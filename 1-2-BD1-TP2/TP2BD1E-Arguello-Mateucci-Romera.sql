-- TP2
-- ARGUELLO JUAN 
-- MATEUCCI FEDERICO
-- ROMERA MATIAS

-- SA � B�sicas
-- EJ01
-- Indicar cu�les son los t�tulos y autores de los libros cuyo tipo sea �no� y sus precios
-- originales superen los $21. 

SELECT TITULO, AUTOR
FROM LIBRO
WHERE TIPO ='no' AND PRECIO_ORI > 21;

-- EJ02
-- �Cu�les son los n�meros, precios originales y ediciones de los libros cuyo tipo sea �no�
-- o que sus precios originales superen $21 y las ediciones sean posteriores a 1985? 

SELECT NRO_LIBRO, PRECIO_ORI, EDICION
FROM LIBRO
WHERE (TIPO ='no' OR PRECIO_ORI > 21) AND EDICION > 1985;

-- EJ03
-- Obtener la lista autores y ediciones de los libros cuyos nombres de autores comiencen
-- con la letra L 

SELECT AUTOR, EDICION
FROM LIBRO
WHERE AUTOR LIKE 'L%';

-- EJ04
-- Obtener la lista de autores y ediciones de los libros cuyos nombres de autores no
-- comiencen con la letra G.  

SELECT AUTOR, EDICION
FROM LIBRO
WHERE AUTOR NOT LIKE 'G%'

-- EJ05
-- Obtener la lista de autores, precios originales y ediciones de los libros cuyos autores
-- tengan la hilera "RR" en alg�n lugar del nombre 

SELECT AUTOR, PRECIO_ORI, EDICION
FROM LIBRO
WHERE AUTOR LIKE '%RR%'

-- EJ06
-- Obtener la lista de t�tulos y ediciones de aquellos libros cuyos precios originales no
-- est�n comprendidos entre $12 y $25. 

SELECT TITULO, EDICION
FROM LIBRO
WHERE NOT (PRECIO_ORI < 25 AND PRECIO_ORI > 12)

-- EJ07
-- Obtener todos los tipos y ediciones DISTINTAS(en tipo y Edici�n) de los libros,
-- ordenado por Edici�n y a�o de edici�n ascendente. 

SELECT DISTINCT TIPO, EDICION 
FROM LIBRO
ORDER BY EDICION ASC

-- EJ08
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias
-- de precios para todos los libros clasificado por tipo y por dicha diferencia en forma
-- ascendente, en ese orden. 

SELECT NRO_LIBRO, EDICION, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) as "Dif de precios"
FROM LIBRO
ORDER BY TIPO, "Dif de Precios" ASC

-- EJ09
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias
-- de precios para todos los libros de estudio. 

SELECT NRO_LIBRO, EDICION, TIPO, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) as "Dif de precios"
FROM LIBRO 
WHERE TIPO = 'es'

-- EJ10
-- �Cu�les son los n�meros, precios originales y ediciones de los libros cuyas ediciones
-- son posteriores a 1985 y adem�s o bien el tipo es �no� o el precio original supera $21

SELECT NRO_LIBRO, PRECIO_ORI, EDICION
FROM LIBRO
WHERE EDICION > 1985 AND (TIPO = 'no' OR PRECIO_ORI > 21)

-- EJ11
-- �Cu�les son los t�tulos y nombres de los autores de los libros cuyo tipo sea �no� o
-- aquellos cuyos precios de origen superan $21? 

SELECT TITULO, AUTOR
FROM LIBRO
WHERE TIPO = 'no' OR PRECIO_ORI > 21

-- EJ12
-- Obtener la lista de t�tulos y precios originales de los libros que se editaron en 1948,
-- 1978 y 1985 

SELECT TITULO, PRECIO_ORI, EDICION
FROM LIBRO
WHERE EDICION IN (1948, 1978, 1985)

-- EJ13
-- Obtener los t�tulos y ediciones de los libros cuyos precios originales est�n dentro del
-- rango de $12 a $25 inclusive

SELECT TITULO, EDICION
FROM LIBRO
WHERE PRECIO_ORI BETWEEN 12 AND 25

-- EJ14 
-- Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros cuyos t�tulos
-- tengan las letras "R" y "S" en alg�n lugar y en ese orden. 

SELECT TITULO, PRECIO_ORI, EDICION
FROM LIBRO
WHERE TITULO LIKE '%R%S%'

-- EJ15
-- Obtener la lista de t�tulos, precios originales y ediciones de aquellos libros que tengan
-- a letra "A" en la segunda posici�n del t�tulo. 

SELECT TITULO, PRECIO_ORI, EDICION
FROM LIBRO
WHERE TITULO LIKE '_A%'

-- EJ16
-- Ordenar en secuencia ascendente por a�o de edici�n los t�tulos de los libros cuyo tipo
-- sea �no�. Listar tambi�n la edici�n. 

SELECT TIPO, EDICION
FROM LIBRO
WHERE TIPO = 'no'
ORDER BY EDICION ASC


-- EJ17
-- Listar los n�meros, ediciones y tipos de libros cuyos precios originales superen los $20.
-- Clasificar por edici�n en forma descendente y por n�mero de libro ascendente en ese
-- orden. 

SELECT NRO_LIBRO, EDICION, TIPO
FROM LIBRO
WHERE PRECIO_ORI > 20
ORDER BY EDICION DESC, NRO_LIBRO ASC

-- EJ18
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias
-- de precios para todos los libros cuyas diferencias de precio sean superiores a $10. 

SELECT NRO_LIBRO, EDICION, TIPO, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) as DIF_PRECIO 
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10

-- EJ19
-- Listar los n�meros, ediciones, tipos, precios originales, precios actuales y diferencias
-- de precios para todos los libros cuyas diferencias de precio sean superiores a $10,
-- clasificado por dicha diferencia en forma descendente. 

SELECT NRO_LIBRO, EDICION, TIPO, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) as DIF_PRECIO 
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10
ORDER BY DIF_PRECIO DESC

-- B - Funciones de Agregaci�n, Having
-- EJ01
-- Obtener la suma y el promedio de los precios originales y el m�nimo y el m�ximo de los
-- precios actuales para todos los libros cuyo a�o de edici�n sea mayor a 1970 

SELECT SUM (PRECIO_ORI) as SUMA_PRECIOS_ORI, AVG (PRECIO_ORI) as PROMEDIO_PRECIOS_ORI,
		MIN (PRECIO_ACT) as MIN_PRECIOS_ACT, MAX (PRECIO_ACT) as MAX_PRECIOS_ACT
FROM LIBRO
WHERE EDICION > 1970

-- EJ02
-- Obtener de la suma total de la suma de los precios originales m�s los actuales, el
-- promedio de dicha suma y el m�nimo y el m�ximo de las diferencias de precios para
-- todos los libros cuyo a�o de edici�n sea superior a 1970. 

SELECT SUM (LI.PRECIO_ACT + LI.PRECIO_ORI) as SUMA_TOTAL, AVG(LI.PRECIO_ACT + LI.PRECIO_ORI) as PROM_SUMA,
		MIN(LI.PRECIO_ACT - LI.PRECIO_ORI) as MINIMO, MAX (LI.PRECIO_ACT - LI.PRECIO_ORI) as MAXIMO
FROM LIBRO LI
WHERE EDICION > 1970

-- EJ03
-- Listar la cantidad de libros, los distintos tipos de libros, el m�nimo y el m�ximo del
-- precio original, pero s�lo para aquellos libros cuyo precio original supere los $45. 

SELECT COUNT(NRO_LIBRO) as CANT_LIBROS, COUNT(DISTINCT TIPO) as TIPOS, MIN(PRECIO_ORI) as MIN_PRECIO_ORI, 
		MAX(PRECIO_ORI) as MAX_PRECIO_ORI
FROM LIBRO
WHERE PRECIO_ORI > 45

-- EJ04
-- Listar los tipos de libros, totales de precios originales, promedios de precios actuales,
-- resumidos por tipo de libro y para los libros cuyas ediciones no sean de 1946, pero s�lo
-- para aquellos tipos de libros cuya sumatoria de precios originales supere $40.

SELECT TIPO, SUM(PRECIO_ORI) as TOTAL_PRECIO_ORI, AVG(PRECIO_ACT) as PROMEDIO_ACT
FROM LIBRO
WHERE EDICION != 1946
GROUP BY TIPO
HAVING SUM(PRECIO_ORI) > 40

-- EJ05
-- Listar los tipos de libros y promedios de precios originales agrupados por tipos, para
-- aquellos tipos que tengan el promedio de sus precios originales por arriba del
-- promedio de precios originales de todos los libros. 

SELECT TIPO, AVG(PRECIO_ORI) as PROMEDIO_ORI
FROM LIBRO
GROUP BY TIPO
HAVING AVG(PRECIO_ORI) > (SELECT AVG(PRECIO_ORI) FROM LIBRO)

-- EJ06
-- Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
-- de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro. 

SELECT TIPO, SUM(PRECIO_ORI) as TOTAL_PRECIO_ORI, AVG(PRECIO_ACT) as PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO

-- EJ07
-- Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
-- de aquellos libros que no fueron editados en 1946, resumidos por tipo de libro
-- clasificado por promedio de precios actuales de menor a mayor. 

SELECT TIPO, SUM(PRECIO_ORI) as TOTAL_PRECIO_ORI, AVG(PRECIO_ACT) as PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION != 1946
GROUP BY TIPO
ORDER BY PROM_PRECIO_ACT ASC


-- EJ08
-- Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
-- de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro.

SELECT TIPO, SUM(PRECIO_ORI) as TOTAL_PRECIO_ORI, AVG(PRECIO_ACT) as PROM_PRECIO_ACT
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO

-- EJ09
-- Listar el salario m�ximo agrupado por el tipo de trabajo.

SELECT MAX(SALARIO) as MAX_SALARIO
FROM LECTOR
GROUP BY TRABAJO

-- EJ10
-- Listar el salario promedio agrupado por tipo de trabajo de los lectores que viven en
-- capital.

SELECT TRABAJO, AVG(SALARIO) as PROM_SALARIO
FROM LECTOR
WHERE DIRECCION LIKE '%CAP%'
GROUP BY TRABAJO

-- C - Uso de Operadores Especiales (ALL, ANY) , SubQuerys
-- EJ01
-- Obtener los cinco primeros caracteres de los nombres de todos los lectores de libros 

SELECT SUBSTRING(NOMBRE, 1,5) as CARACTERES
FROM LECTOR

-- EJ02
-- Listar los nombres y la direcci�n de los lectores que tienen libros a pr�stamo (usar
-- subconsultas) 

SELECT LE.NOMBRE, LE.DIRECCION
FROM LECTOR LE
WHERE NRO_LECTOR IN (SELECT PE.NRO_LECTOR 
					 FROM PRESTAMO PE
					 WHERE PE.F_DEVOL IS NULL)

-- EJ03
-- Listar el n�mero, t�tulo y precio actual del libro que tenga el m�ximo precio original. 

SELECT LI.NRO_LIBRO, LI.TITULO, LI.PRECIO_ACT 
FROM LIBRO LI
WHERE LI.PRECIO_ORI IN (SELECT MAX(LI.PRECIO_ORI) 
						FROM LIBRO)

-- EJ04
-- Listar el n�mero, t�tulo y precio original de aquellos libros cuyos precios originales sean
-- m�s altos que el promedio de precios actuales de todos los libros. 

SELECT LI.NRO_LIBRO, LI.TITULO, LI.PRECIO_ORI
FROM LIBRO LI
WHERE LI.PRECIO_ORI > (SELECT AVG(PRECIO_ACT)
					   FROM LIBRO)

-- EJ05
-- Listar los n�meros, t�tulos y precios originales de aquellos libros cuyos precios
-- originales sean mayores que todos y cada uno de los precios originales de las novelas. 

SELECT LI.NRO_LIBRO, LI.TITULO, LI.PRECIO_ORI
FROM LIBRO LI
WHERE LI.PRECIO_ORI > ALL (SELECT PRECIO_ORI 
							FROM LIBRO
							WHERE TIPO = 'no')

-- EJ06
-- Listar los n�meros, t�tulos y precios originales de aquellos libros cuyos precios
-- originales sean mayores que alguno cualquiera de los precios originales de las novelas.

SELECT LI.NRO_LIBRO, LI.TITULO, LI.PRECIO_ORI
FROM LIBRO LI
WHERE LI.PRECIO_ORI > ANY (SELECT PRECIO_ORI 
							FROM LIBRO
							WHERE TIPO = 'no')

-- D - Consultas en varias tablas � uso de join (inner join � left join � right join)
-- EJ01
-- Listar el Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros prestados

SELECT LI.TITULO, PRE.F_PREST, PRE.F_DEVOL
FROM LIBRO LI
RIGHT JOIN PRESTAMO PRE
ON LI.NRO_LIBRO = PRE.NRO_LIBRO

-- EJ02
-- Listar el Nro de Libro, Titulo, fecha de Pr�stamo y la fecha de Devoluci�n de los Libros
-- prestados

SELECT LI.NRO_LIBRO, LI.TITULO, PRE.F_PREST, PRE.F_DEVOL
FROM LIBRO LI
INNER JOIN PRESTAMO PRE
ON LI.NRO_LIBRO = PRE.NRO_LIBRO

-- EJ03
-- Listar el n�mero de lector, su nombre y la cantidad de pr�stamos realizados a ese
-- lector. 

SELECT LE.NRO_LECTOR, LE.NOMBRE, COUNT(PRE.F_PREST) AS PRESTAMOS_X_LECTOR
FROM LECTOR LE
RIGHT JOIN PRESTAMO PRE 
ON LE.NRO_LECTOR = PRE.NRO_LECTOR
GROUP BY LE.NRO_LECTOR, LE.NOMBRE

-- EJ04
-- Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos
-- realizados para cada copia de cada libro. 

SELECT LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA, COUNT(PRE.NRO_COPIA) AS PRESTAMOS_X_COPIA
FROM LIBRO LI
RIGHT JOIN PRESTAMO PRE
ON LI.NRO_LIBRO = PRE.NRO_LIBRO
GROUP BY LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA
ORDER BY LI.NRO_LIBRO

-- EJ05
-- Listar el n�mero de libro, el t�tulo, y la cantidad de pr�stamos realizados para ese libro
-- a partir del a�o 2012 

SELECT LI.NRO_LIBRO, LI.TITULO, COUNT(PRE.NRO_COPIA) AS PRESTAMOS_X_LIBRO
FROM LIBRO LI
RIGHT JOIN PRESTAMO PRE
ON LI.NRO_LIBRO = PRE.NRO_LIBRO
WHERE PRE.F_PREST > 2012
GROUP BY LI.NRO_LIBRO, LI.TITULO

-- EJ06
-- Listar el n�mero de libro, el t�tulo, el n�mero de copia, y la cantidad de pr�stamos
-- realizados para cada copia de cada libro, pero s�lo para aquellas copias que se hayan
-- prestado m�s de 1 vez. 

SELECT LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA, COUNT(NRO_COPIA) AS CANT_PRESTAMOS
FROM LIBRO LI
INNER JOIN PRESTAMO PRE ON LI.NRO_LIBRO = PRE.NRO_LIBRO
GROUP BY LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA
HAVING COUNT(PRE.NRO_COPIA) > 1

-- EJ07
-- Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Pr�stamo, de todas las Copias,
-- hayan sido prestadas o no 

SELECT LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA, PRE.F_PREST 
FROM LIBRO LI
LEFT JOIN PRESTAMO PRE ON LI.NRO_LIBRO = PRE.NRO_LIBRO
GROUP BY LI.NRO_LIBRO, LI.TITULO, PRE.NRO_COPIA, PRE.F_PREST

-- EJ08
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripci�n del Tipo de Libro , fecha
-- de pr�stamo que aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea
-- Novela o Cuentos 

SELECT LE.NRO_LECTOR, LE.NOMBRE, LI.NRO_LIBRO, LI.TITULO, TI.DESCTIPO, PRE.F_PREST, PRE.F_DEVOL
FROM LECTOR LE
LEFT JOIN PRESTAMO PRE ON LE.NRO_LECTOR = PRE.NRO_LECTOR
LEFT JOIN LIBRO LI ON PRE.NRO_LIBRO = LI.NRO_LIBRO
LEFT JOIN TIPOLIBRO TI ON LI.TIPO = TI.TIPO
WHERE PRE.F_DEVOL IS NOT NULL AND TI.TIPO IN ('no','cu')
ORDER BY PRE.NRO_LECTOR

-- EJ09
-- Obtener la lista de los t�tulos de los libros prestados y los nombres de los lectores que
-- los tienen en pr�stamo 

SELECT LI.TITULO, LE.NOMBRE
FROM LIBRO LI
INNER JOIN PRESTAMO PRE ON LI.NRO_LIBRO = PRE.NRO_LIBRO
INNER JOIN LECTOR LE ON PRE.NRO_LECTOR = LE.NRO_LECTOR
WHERE PRE.F_DEVOL IS NULL

-- EJ10
-- Listar el Nro de Lector, Nombre y fecha de Pr�stamo de aquellos Lectores que hayan
-- realizado un pr�stamo y no lo hayan devuelto

SELECT LE.NRO_LECTOR, LE.NOMBRE, PRE.F_PREST
FROM LECTOR LE
INNER JOIN PRESTAMO PRE ON LE.NRO_LECTOR = PRE.NRO_LECTOR
WHERE PRE.F_DEVOL IS NULL

-- EJ11
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos
-- Prestamos que hayan sido devueltos

SELECT LE.NRO_LECTOR, LE.NOMBRE, LI.NRO_LIBRO, LI.TITULO, PRE.F_PREST
FROM LECTOR LE
INNER JOIN PRESTAMO PRE ON PRE.NRO_LECTOR = LE.NRO_LECTOR
INNER JOIN LIBRO LI ON LI.NRO_LIBRO = PRE.NRO_LIBRO
WHERE PRE.F_DEVOL IS NOT NULL

-- EJ12
-- Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de pr�stamo que aquellos
-- Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos 

SELECT LE.NRO_LECTOR, LE.NOMBRE, LI.NRO_LIBRO, LI.TITULO, PRE.F_PREST
FROM LECTOR LE
INNER JOIN PRESTAMO PRE ON PRE.NRO_LECTOR = LE.NRO_LECTOR
INNER JOIN LIBRO LI ON LI.NRO_LIBRO = PRE.NRO_LIBRO
WHERE PRE.F_DEVOL IS NOT NULL AND LI.TIPO IN ('cu', 'no')

-- EJ13
-- Listar el Nro de Lector, Nombre y fecha de Pr�stamo de Todos los Lectores, hayan
-- tenido Prestamos o no 

SELECT LE.NRO_LECTOR, LE.NOMBRE, PRE.F_PREST
FROM LECTOR LE
INNER JOIN PRESTAMO PRE ON PRE.NRO_LECTOR = LE.NRO_LECTOR
ORDER BY LE.NRO_LECTOR

-- E � Insert � Update - Delete
-- EJ01
-- Agregar un nuevo LIBRO y sus respectivos valores a la tabla COPIAS

INSERT INTO LIBRO
VALUES ('999999', 'Caperucita Roja', 'Luis Ramirez', 'cu', '10', '20', '1975', null)

INSERT INTO COPIAS
VALUES ('999999', '1', null)

-- EJ02
-- Modificar el precio Actual del Libro LAS MIL Y UNA NOCHES a 35.35UPDATE LIBRO
SET PRECIO_ACT = '35.35'
WHERE TITULO = 'LAS MIL Y UNA NOCHES'

-- EJ03
-- Eliminar los lectores cuyo salario sea menor $ 1000. �Cu�ntos lectores se han
-- eliminado?DELETE FROM LECTORWHERE SALARIO < 1000-- Se han eliminado 4-- F � PLUS-- EJ01-- Realizar una sentencia SQL que involucre TODOS los campos de TODAS las tablas
-- �Es esto posible?

-- Quiza haya alguna forma de hacerlo pero no tiene mucho sentido realizarla, ya 
-- que se mezclaran valores que no tienen relacion alguna