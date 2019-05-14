/*01-Código y nombre de todos los departamentos.*/

SELECT * 
FROM departamentos;

/*02-Mes y ejercicio de los justificantes de nómina pertenecientes al empleado cuyo código es 1.*/

SELECT just_nominas.mes, just_nominas.ejercicio
FROM just_nominas 
WHERE cod_emp=1;

/*03-Número de cuenta y nombre de los empleados cuya retención es mayor o igual que 10.*/

SELECT cuenta,nombre
FROM empleados
WHERE retencion >=10;

/*04-Código y nombre de los empleados ordenados ascendentemente por nombre*/

SELECT codigo, nombre
FROM empleados
ORDER BY nombre;

/*05-Nombre de los empleados que tienen más de 2 hijos.*/

SELECT nombre
FROM empleados
WHERE hijos > 2;

/*06-Código y número de cuenta de los empleados cuyo nombre empieze por 'A' o por 'J'.*/

SELECT codigo, cuenta
FROM empleados
WHERE nombre LIKE 'A%' or nombre LIKE 'J%';

/*07-Número de empleados que hay en la base de datos.*/

SELECT COUNT(*)
FROM empleados;

/*08-Nombre del primer y último empleado en términos alfabéticos.*/

SELECT MIN(nombre)
FROM empleados
UNION
SELECT MAX(nombre)
FROM empleados;

/*9 Nombre y número de hijos de los empleados cuya retención es: 8, 10 o 12. */

SELECT nombre, hijos
FROM empleados
WHERE retencion = 8 or retencion= 10 or retencion=12;

/*10-Número de hijos y número de empleados agrupados por hijos, 
mostrando sólo los grupos cuyo número de empleados sea mayor que 1.*/

SELECT  hijos , COUNT(nombre) as num_emplados
FROM empleados
GROUP BY hijos
HAVING COUNT(*)>1;

/*11-Número de hijos, retención máxima, mínima y media de los empleados 
agrupados por hijos.*/

SELECT  hijos , MIN(retencion) as min_retencion,MAX(retencion) as max_retencion , 
AVG(retencion) as retencion_media
FROM empleados
GROUP BY hijos

/*12-Nombre y función de los empleados que han trabajado en el departamento 1.*/

SELECT e.nombre,funcion
FROM trabajan tr
JOIN empleados e ON tr.cod_emp=e.codigo
JOIN departamentos dep ON dep.codigo=tr.cod_dep
WHERE dep.codigo=1;

/*13-Nombre del empleado, nombre del departamento y función que han realizado 
de los empleados que tienen 1 hijo.*/

SELECT e.nombre,dep.nombre , tr.funcion
FROM trabajan tr
JOIN empleados e ON tr.cod_emp=e.codigo
JOIN departamentos dep ON dep.codigo=tr.cod_dep
WHERE e.hijos=1;
/*14 Nombre del empleado y nombre del departamento en el que han trabajado 
empleados que no tienen hijos.*/

SELECT e.nombre,dep.nombre
FROM trabajan tr
JOIN empleados e ON tr.cod_emp=e.codigo
JOIN departamentos dep ON dep.codigo=tr.cod_dep
WHERE e.hijos=0;

/*15-Nombre del empleado, mes y ejercicio de sus justificantes de nómina, número de línea y 
cantidad de las líneas de los justificantes para el empleado cuyo código=1.*/

SELECT e.nombre , jn.mes,jn.ejercicio , ln.numero , ln.cantidad 
FROM just_nominas jn
JOIN empleados e ON e.codigo=jn.cod_emp
JOIN lineas ln on ln.cod_emp=e.codigo
WHERE e.codigo=1;

/*16-Nombre del empleado, mes y ejercicio de sus justificantes de nómina para los empleados que 
han trabajado en el departamento de Ventas.*/

SELECT e.nombre,jn.mes,jn.ejercicio
FROM empleados e 
JOIN trabajan tr ON  tr.cod_emp=e.codigo
JOIN departamentos dp ON dp.codigo=tr.cod_dep
JOIN just_nominas jn ON e.codigo=jn.cod_emp
WHERE dp.nombre='Ventas';

/*17-Nombre del empleado e ingresos totales percibidos agrupados por nombre.*/

SELECT SUM(jn.ingreso),e.nombre
FROM empleados e
JOIN just_nominas jn ON jn.cod_emp=e.codigo
GROUP BY e.nombre;

/*18-Nombre de los empleados que han ganado más de 2000 € en el año 2006.*/

SELECT e.nombre
FROM empleados e
JOIN just_nominas jn ON jn.cod_emp=e.codigo
GROUP BY jn.ejercicio, e.nombre
HAVING jn.ejercicio=2006 AND sum(jn.ingreso)>2000;

/*19-Número de empleados cuyo número de hijos es superior a la media de hijos de los empleados.*/

SELECT COUNT(*)
FROM empleados
WHERE hijos > 
(SELECT AVG(hijos)
FROM empleados );
/*20-Nombre de los empleados que más hijos tienen o que menos hijos tienen.*/

SELECT nombre
FROM empleados
WHERE hijos = 
(SELECT MAX(hijos)
FROM empleados) 
union
SELECT nombre
FROM empleados
WHERE hijos = 
(SELECT MIN(hijos)
FROM empleados) 
/*21-Nombre de los empleados que no tienen justificante de nóminas.
------------NO FUNCIONA -----------------------*/
SELECT e.nombre
FROM empleados 
LEFT OUTER JOIN just_nominas jn on jn.cod_emp=e.codigo;
WHERE jn.mes IS NULL;
/*-ESTA FUNCIONA PERO QUERIA SABER PORQUE A DE ARRIBA NO */
SELECT nombre
FROM empleados
WHERE codigo not in 
(select cod_emp
from just_nominas)
/*22-Nombre y fecha de nacimiento de todos los empleados.*/

SELECT nombre , fnacimiento
FROM empleados;
/*23-Nombre y fecha de nacimiento con formato "1 de Enero de 2000" y 
etiquetada la columna como fecha, de todos los empleados.*/

SELECT nombre , REPLACE(to_char(fnacimiento,'D/MONTH/YYYY'),'/',' de ') as fecha
FROM empleados;

/*24-Nombre de los empleados, nombre de los departamentos en los que ha trabajado y 
función en mayúsculas que ha realizado en cada departamento.*/

SELECT e.nombre, dep.nombre as departamento , UPPER(tr.funcion)
FROM empleados e
JOIN trabajan tr ON tr.cod_emp=e.codigo
JOIN departamentos dep ON tr.cod_dep=dep.codigo;

/*25-Nombre, fecha de nacimiento y nombre del día de la semana de 
su fecha de nacimiento de todos los empleados.*/

SELECT nombre, fnacimiento , to_char(fnacimiento,'DAY') as dia_nacimiento
FROM empleados;

/*26-Nombre y edad de los empleados.*/

SELECT nombre , FLOOR(MONTHS_BETWEEN(SYSDATE,fnacimiento)/12) as edad 
FROM empleados

/*27-Nombre, edad y número de hijos de los empleados que tienen 
menos de 40 años y tienen hijos.*/

SELECT nombre , FLOOR(MONTHS_BETWEEN(SYSDATE,fnacimiento)/12) as edad , hijos
FROM empleados
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE,fnacimiento)/12)>40 AND hijos > 0

/*28-Nombre, edad de los empleados y nombre del departamento de los empleados 
que han trabajado en más de un departamento.*/

SELECT  e.nombre, dp.nombre as nombre_departamento , 
FLOOR(MONTHS_BETWEEN(SYSDATE,e.fnacimiento)/12) as edad  
FROM trabajan tr 
JOIN empleados e ON e.codigo = tr.cod_emp
JOIN departamentos dp ON dp.codigo=tr.cod_dep
WHERE  e.nombre in
(SELECT e.nombre
FROM trabajan tr
JOIN empleados e ON e.codigo = tr.cod_emp
JOIN departamentos dp ON dp.codigo=tr.cod_dep
GROUP BY e.nombre
HAVING Count(e.nombre)>1)

/*29-Nombre, edad y número de cuenta de aquellos empleados cuya 
edad es múltiplo de 3.*/

SELECT nombre, FLOOR(MONTHS_BETWEEN(SYSDATE,fnacimiento)/12) as edad , cuenta
FROM empleados
WHERE  MOD (FLOOR(MONTHS_BETWEEN(SYSDATE,fnacimiento)/12),3)=0;

/*30-Nombre e ingresos percibidos empleado más joven y del más longevo*/

SELECT e.nombre , SUM(jn.ingreso) as ingresos 
FROM empleados e
JOIN just_nominas jn ON jn.cod_emp= e.codigo
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE,e.fnacimiento)/12) IN
(SELECT MAX(FLOOR(MONTHS_BETWEEN(SYSDATE,e.fnacimiento)/12))
FROM empleados e)
OR FLOOR(MONTHS_BETWEEN(SYSDATE,e.fnacimiento)/12) IN
(SELECT MIN(FLOOR(MONTHS_BETWEEN(SYSDATE,e.fnacimiento)/12))
FROM empleados e)
GROUP BY e.nombre;

