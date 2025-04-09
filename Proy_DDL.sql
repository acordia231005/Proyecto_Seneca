drop database if exists proy_seneca;
create database proy_seneca;
use proy_seneca;

create table persona (
	id int primary key auto_increment,
    nombre varchar(50),
    apellidos varchar(100),
    direccion varchar(100),
    fecha_nac date,
    dni char(9),
    genero enum('Masculino', 'Femenino')
);

create table profesor (
	id int primary key auto_increment,
    especialidad varchar(100),
    constraint fk_profesor_persona foreign key (id) references persona(id)
);

create table alumno(
	id int primary key auto_increment,
    estado boolean default false,
	constraint fk_alumno_persona foreign key (id) references persona(id)
);

create table faltas_asistencia (
	id int primary key auto_increment,
    alumno int,
    faltas_justificadas int,
    faltas_injustificadas int,
    constraint fk_faltas_asistencias_alumno foreign key (alumno) references alumno(id)
);

create table ciclo (
	id int primary key auto_increment,
    nombre varchar(100),
    anio year,
    periodo enum('Trimestral', 'Cuatrimestral', 'Semestral')
);

create table modulo_profesional (
	id int primary key auto_increment,
    ciclo int,
    nombre varchar(100),
    tipo enum('Obligatoria', 'Optativa'),
    constraint fk_modulo_profesional_ciclo foreign key (ciclo) references ciclo(id)
);

create table imparte (
	 profesor int,
     modulo_profesional int,
     constraint pk_imparte primary key (profesor,modulo_profesional),
     constraint fk_imparte_profesor foreign key (profesor) references profesor(id),
     constraint fk_imparte_modulo_profesional foreign key (modulo_profesional) references modulo_profesional(id)
);

create table ra (
	id int primary key auto_increment,
    modulo_profesional int,
    ponderacion int,
    descripcion text,
    constraint fk_ra_modulo_profesional foreign key (modulo_profesional) references modulo_profesional(id)
);

create table criterios_evaluacion (
	 id int primary key auto_increment,
     nombre char(3),
     ponderacion int,
     ra int,
     constraint fk_criterios_evaluacion_ra foreign key (ra) references ra(id)
);

create table tarea (
	id int primary key auto_increment,
    nombre varchar(100),
    fecha_entrega date,
    tipo enum('Proyecto', 'Cuestionario', 'Oral', 'Practica', 'Papel')
);

create table evaluacion (
     alumno int,
     tarea int,
     criterios_evaluacion int,
     nota int,
     constraint pk_evaluacion primary key (alumno, tarea, criterios_evaluacion),
     constraint fk_evaluacion_alumno foreign key (alumno) references alumno(id),
     constraint fk_evaluacion_tarea foreign key (tarea) references tarea(id),
     constraint fk_evaluacion_criterios_evolucion foreign key (criterios_evaluacion) references criterios_evaluacion(id)
);

create table centro (
	id int primary key auto_increment,
    nombre varchar(100),
    direccion varchar(100),
    localidad varchar(100),
    provincia varchar(100),
    tipo enum('Instituto', 'Colegio', 'FP', 'Universidad')
);

create table oferta_educativa (
	id int primary key auto_increment,
    centro int,
    ciclo int,
    fecha_inicio date,
    fecha_fin date,
    constraint fk_oferta_educativa_centro foreign key (centro) references centro(id),
    constraint fk_oferta_educativa_ciclo foreign key (ciclo) references ciclo(id)
);

create table curso (
	id int primary key auto_increment,
    oferta_educativa int,
    tipo enum('FP', 'Universidad'),
    constraint fk_curso_oferta_educativa foreign key (oferta_educativa) references oferta_educativa(id)
);

create table matricula (
	alumno int,
    curso int,
    num_alum int,
    anio_inicio date,
    anio_final date,
    constraint pk_matricula primary key (alumno, curso),
    constraint fk_matricula_alumno foreign key (alumno) references alumno(id),
    constraint fk_matricula_curso foreign key (curso) references curso(id)
);