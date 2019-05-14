DROP TABLE ALUMNO;
DROP TABLE CURSO;
DROP TABLE PROFESOR;

/*Ejercicio 1*/
CREATE TABLE PROFESOR(
    nombre varchar2 (20),
    apel_1 varchar2 (20),
    apel_2 varchar2 (20),
    nif varchar2 (9)  ,
    direccion varchar2(50),
    titulacion varchar2(20),
    salario number (7,2) NOT NULL,
    CONSTRAINT Prof_nom_UK UNIQUE ( nombre, apel_1 , apel_2),
    CONSTRAINT Prof_nif_PK PRIMARY KEY (nif)
);

CREATE TABLE CURSO(
    nombre varchar2(20) UNIQUE,
    codigo varchar2(10) PRIMARY KEY,
    nif_prof varchar2(9) ,
    max_alum number (3,0),
    f_inicio date ,
    f_final date ,
    num_horas number(3,0) NOT NULL ,
    CONSTRAINT Cur_nifprof_FK FOREIGN KEY (nif_prof) REFERENCES PROFESOR(nif) ON DELETE SET NULL,
    CONSTRAINT Cur_f_ini_f_fin_CK CHECK (f_inicio < f_final)
);

CREATE TABLE ALUMNO(
    nombre varchar2 (20) ,
    apel1 varchar2  (20) ,
    apel2 varchar2 (20),
    nif varchar2(9) PRIMARY KEY,
    direccion varchar2(50),
    sexo varchar2(1),
    f_nac date ,
    curso varchar2(5) NOT NULL,
    CONSTRAINT Alu_cur_FK FOREIGN KEY (curso) REFERENCES CURSO(codigo) ON DELETE CASCADE,
    CONSTRAINT Alu_sex_DM CHECK ( sexo IN ('M','H'))
);

/*Ejercicio 2 */

--Apartado 1
ALTER TABLE ALUMNO ADD (edad NUMBER (3,0));
--Apartado 2
ALTER TABLE ALUMNO ADD(CONSTRAINT Alu_eda_CK CHECK (edad BETWEEN 14 AND 65));
--Apartado 3 
ALTER TABLE CURSO ADD(CONSTRAINT Cur_hor_CK CHECK (num_horas IN (30,40,60 )));
--Apartado 4
ALTER TABLE CURSO ADD(CONSTRAINT Cur_min_al_CK CHECK (max_alum > 15)); 
--Apartado 5
ALTER TABLE ALUMNO DROP CONSTRAINT Alu_sex_DM ;
--Apartado 6
ALTER TABLE PROFESOR DROP COLUMN direccion;
--Apartado 7 
ALTER TABLE PROFESOR DROP CONSTRAINT Prof_nif_PK CASCADE;
ALTER TABLE PROFESOR ADD CONSTRAINT Prof_nom_apel_PK PRIMARY KEY( nombre, apel_1 , apel_2 ); 
--Apartado 8
RENAME PROFESOR TO TUTOR;
--Apartado 9
DROP TABLE ALUMNO;
--Apartado 10
CREATE USER sergiobpena 
IDENTIFIED BY BD04
DEFAULT TABLESPACE ACADEMIA3;

GRANT ALL ON CURSO TO sergiobpena;

--
