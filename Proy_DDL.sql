drop database if exists Proy_DDL;
create database Proy_DDL;
use proy_DDL;

create table Usuarios(
	id int primary key auto_increment,
    nombre varchar(50),
    apellidos varchar(50),
    DNI char(9),
    email varchar(50),
    tipo enum('Alumno', 'Profesor', 'Tutor', 'Administrativo')
);
create table Centro (
	id int primary key auto_increment,
	nombre varchar(100),
    direccion varchar(100),
    telefono char(9),
    DNI char(9),
    tipo enum('Instituto', 'Colegio', 'FP')
);
create table curso(
	id int primary key auto_increment,
    year_inicio date,
    year_fin date
);
create table asignatura(
	id int primary key auto_increment,
    nombre varchar(50),
    codigo int,
    curso_asignado int,
    constraint fk_asignatura_curso foreign key (curso_asignado) references curso(id)
);
create table matricula(
	id int primary key auto_increment,
    alumno int,
    asignatura int,
    estado enum('Aprobado', 'Pendiente'),
    constraint pk_matricula primary key (id, alumno, asignatura),
    constraint fk_matricula_alumno foreign key (alumno) references alumno(id),
    constraint fk_matricula_asignatura foreign key (asignatura) references asignatura(id)
);
