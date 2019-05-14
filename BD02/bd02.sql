DROP TABLE ALUMNO;
DROP TABLE CURSO;
DROP TABLE PROFESOR;

CREATE TABLE PROFESOR(
    nombre varchar2 (20)PRIMARY KEY,
    apel_1 varchar2 (20),
    apel_2 varchar2 (20),
    nif varchar2 (9) PRIMARY KEY ,
    direccion varchar2(50),
    titulacion varchar2(20),
    salario number (7,2) NOT NULL,
    CONSTRAINT Prof_nom_UK UNIQUE ( nombre, apel_1 , apel_2)
);

CREATE TABLE CURSO(
    nombre varchar2(20) UNIQUE,
    codigo varchar2(10) PRIMARY KEY,
    nif_prof varchar2(9) ,
    max_alum number (3,0),
    f_incio date,
    f_final date,
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
    CONSTRAINT Alu_sex_DM CHECK ( sexo IN (M,H))
);



