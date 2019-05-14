# Practica 02
## Ejercicio 1
Vamos a crear las tablas para una Academia donde se imparten distintos cursos de informática. Empezaremos creando con SQL las siguientes tablas:

* Tabla ALUMNOS recogerá información sobre el alumnado: Nombre, Apellido1, Apellido2, NIF, Dirección, Sexo, Fecha de Nacimiento y Curso en el que se matricula.
* Tabla CURSOS con los siguientes campos: Nombre del Curso, Código del Curso que lo identifica, NIF del Profesor, Máximo número de alumnos/as recomendado, Fecha de inicio, Fecha final, Número de horas totales del curso. Los alumnos/as no pueden compaginar varios cursos a la vez.
* Tabla PROFESORES con los siguientes campos: Nombre, Apellido1, Apellido2, NIF, Dirección, Titulación, Salario.
1. Debes elegir los nombres más adecuados para los atributos teniendo en cuenta las reglas.
2. Debes elegir los tipos de datos adecuados en función del contenido de los campos.
3. Debes establecer las siguientes restricciones:
	+ El alumno o alumna debe matricularse en un curso antes de que se le pueda dar de alta.
	+ En un curso, el número de horas es un dato que no puede faltar, es obligatorio que contenga información.
	+ En la tabla PROFESORES, el atributo Salario no puede estar vacío.
	+ Dos cursos no pueden llamarse de la misma forma.
	+ Dos profesores no pueden llamarse igual.
	+ Podremos diferenciar las tuplas de la tabla CURSOS por el Código del Curso.
	+ Podremos diferenciar las tuplas de la tabla PROFESORES y ALUMNOS por el NIF.
	+ La fecha de comienzo del curso nunca puede ser menor que la fecha de finalización.
	+ El dominio del atributo sexo es M (mujer) y H (hombre).
	+ Se debe cumplir la regla de integridad referencial.


## Ejercicio 2
Vamos a modificar las tablas que hemos creado en el apartado anterior:

1. Crea un nuevo atributo llamado Edad de tipo numérico a la tabla ALUMNOS.
Añade las siguientes restricciones:

2. Modifica el campo que has creado anteriormente para que la edad del alumno o alumna esté comprendida entre 14 y 65 años.
3. Modifica el campo Número de horas del CURSO de manera que solo pueda haber cursos con 30, 40 o 60 horas.
4. No podemos añadir un curso si su número máximo de alumnos es inferior a 15.
5. Elimina la restricción que controla los valores que puede tomar el atributo Sexo.
6. Elimina la columna Dirección de la tabla PROFESORES.
7. Cambia la clave primaria de la tabla PROFESORES por Nombre y Apellidos.
8. Renombra la tabla PROFESORES por TUTORES.
9. Elimina la tabla ALUMNOS.
10. Crea un usuario con tu nombre y clave BD02 y dale todos los privilegios sobre la tabla CURSOS.
11. Ahora al usuario anterior quítale permisos para modificar o actualizar la tabla CURSOS.