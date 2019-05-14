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