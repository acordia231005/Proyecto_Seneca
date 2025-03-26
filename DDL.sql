drop database if exists Proy_DDL;
create database Proy_DDL;
use proy_DDL;

create table alumno(
	id int primary key auto_increment,
    nombre varchar(50),
    apellidos varchar(50),
    DNI char(9),
    fecha_nac date
);
create table profesor (
	id int primary key auto_increment
);