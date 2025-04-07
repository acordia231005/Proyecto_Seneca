use proy_seneca;

insert into persona (nombre, apellidos, direccion, fecha_nac, dni, genero) values
('Juan', 'Pérez García', 'Calle Mayor 12', '1990-05-15', '12345678A', 'Masculino'),
('Ana', 'López Martínez', 'Avenida Sol 45', '1985-08-20', '87654321B', 'Femenino'),
('Carlos', 'Ruiz Fernández', 'Plaza Luna 7', '1992-03-10', '34567890C', 'Masculino'),
('Lucía', 'Gómez Torres', 'Calle Tecnología 5', '1988-12-10', '56789012D', 'Femenino'),
('Pedro', 'Sánchez Díaz', 'Plaza Desarrollo 9', '1993-03-25', '87654321F', 'Masculino'),
('Laura', 'Martínez López', 'Calle Innovación 22', '1995-07-18', '23456789E', 'Femenino'),
('David', 'Hernández Gil', 'Calle Progreso 8', '1991-04-14', '65432109G', 'Masculino'),
('Marta', 'Díaz Pérez', 'Avenida Futuro 34', '1987-11-30', '78901234H', 'Femenino'),
('Alberto', 'Fernández Ruiz', 'Calle Avance 19', '1994-02-18', '89012345I', 'Masculino'),
('Sofía', 'Navarro Ortiz', 'Plaza Creatividad 3', '1996-09-22', '90123456J', 'Femenino'),
('Luis', 'Moreno Vega', 'Avenida Desarrollo 11', '1989-06-29', '01234567K', 'Masculino'),
('Elena', 'Castro Ramírez', 'Calle Innovadora 4B', '1993-01-05', '34567891L', 'Femenino'),
('Javier', 'Ramos López', 'Plaza Tecnología 10A','1992-08-17','45678901M','Masculino'),
('Clara','Jiménez Torres','Av. Metodología 23','1990-03-11','56789012N','Femenino');

insert into profesor (id, especialidad) values
(1, 'Desarrollo Web Cliente'),
(2, 'Desarrollo Web Servidor'),
(3, 'Bases de Datos'),
(4, 'Seguridad Informática'),
(5, 'Programación Multimedia y Videojuegos'),
(6, 'Interfaces Gráficas y Usabilidad');

insert into alumno (id, estado) values
(7, true),
(8, true),
(9, false),
(10, true),
(11, true),
(12, false),
(13, true),
(14, true);

insert into faltas_asistencia (alumno, faltas_justificadas, faltas_injustificadas) values
(7, 2, 1),
(8, 0, 3),
(9, 1, 0),
(11, 3, 2),
(13, 1, 4),
(14, 0, 0);

insert into ciclo (nombre, anio, periodo) values
('Desarrollo de Aplicaciones Web - Cliente/Servidor', 2025, 'Semestral'),
('Administración de Sistemas en Red', 2024, 'Cuatrimestral'),
('Programación Multimedia y Videojuegos', 2025, 'Trimestral'),
('Desarrollo de Aplicaciones Multiplataforma', 2026, 'Semestral'),
('Ciberseguridad en Entornos Web', 2025, 'Cuatrimestral');

insert into modulo_profesional (ciclo, nombre, tipo) values
(1, 'Programación Web en Entorno Cliente', 'Obligatoria'),
(1, 'Programación Web en Entorno Servidor', 'Obligatoria'),
(2, 'Administración de Sistemas Operativos', 'Obligatoria'),
(3, 'Diseño de Interfaces Gráficas', 'Optativa'),
(4, 'Desarrollo de Aplicaciones para Dispositivos Móviles', 'Optativa'),
(5, 'Seguridad en Aplicaciones Web', 'Obligatoria'),
(1, 'Bases de Datos', 'Obligatoria');

insert into imparte (profesor, modulo_profesional) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(1, 7);

insert into ra (modulo_profesional, ponderacion, descripcion) values
(1, 25, 'Desarrollar interfaces de usuario ricas y accesibles.'),
(2, 30, 'Implementar lógica de negocio en el servidor.'),
(3, 20, 'Administrar sistemas operativos de red.'),
(4, 15, 'Diseñar interfaces gráficas intuitivas y usables.'),
(5, 25, 'Crear aplicaciones para dispositivos móviles.'),
(6, 30, 'Implementar medidas de seguridad en aplicaciones web.'),
(7, 10, 'Administrar y gestionar bases de datos.');

insert into criterios_evaluacion (nombre, ponderacion, ra) values
('a', 40, 1),
('b', 30, 2),
('c', 20, 3),
('a', 10, 4),
('b', 40, 5),
('c', 30, 6),
('c', 15, 2),
('b', 20, 7);

insert into tarea (nombre, fecha_entrega, tipo) values
('Proyecto Final Cliente', '2025-06-15', 'Proyecto'),
('Examen Servidor Web', '2025-06-20', 'Cuestionario'),
('Práctica de Seguridad Informática', '2025-06-25', 'Practica'),
('Entrega Diseño de Interfaz', '2025-06-30', 'Proyecto'),
('Desarrollo App Móvil', '2025-07-05', 'Proyecto'),
('Examen Bases de Datos', '2025-07-10', 'Cuestionario'),
('Laboratorio Administración Sistemas', '2025-07-15', 'Practica');

insert into evaluacion (alumno, tarea, criterios_evaluacion, nota) values
(7, 1, 1, 8),
(10, 2, 2, 9),
(8, 3, 1, 7),
(11, 4, 4, 4),
(12, 5, 5, 8),
(9, 6, 6, 7),
(14, 7, 7, 9);

insert into centro (nombre, direccion, localidad, provincia, tipo) values
('IES Tecnológico Madrid', 'Calle Innovación 10', 'Madrid', 'Madrid', 'Instituto'),
('Centro FP Barcelona Norte', 'Avenida Tecnología S/N', 'Barcelona', 'Barcelona', 'FP'),
('Universidad Politécnica Valencia', 'Campus Vera S/N', 'Valencia', 'Valencia', 'Universidad'),
('Escuela Superior de Informática Sevilla', 'Calle Programación 5', 'Sevilla', 'Sevilla', 'Universidad'),
('IES Los Alcores', 'Avenida Industria 15', 'Mairena del Alcor', 'Sevilla', 'Instituto');

insert into oferta_educativa (centro, ciclo, fecha_inicio, fecha_fin) values
(1, 1, '2025-09-01', '2026-06-30'),
(2, 2, '2024-09-01', '2025-06-30'),
(3, 3, '2025-09-01', '2026-06-30'),
(4, 4, '2026-09-01', '2027-06-30'),
(5, 5, '2025-09-01', '2026-06-30');

insert into curso (oferta_educativa, tipo) values
(1, 'FP'),
(2, 'FP'),
(3, 'Universidad'),
(4, 'FP'),
(5, 'FP');

insert into matricula (alumno, curso, num_alum, anio_inicio, anio_final) values
(7, 1, 101, '2025-09-01', '2026-06-30'),
(13, 2, 202, '2024-09-01', '2025-06-30'),
(9, 3, 303, '2025-09-01', '2026-06-30'),
(12, 4, 404, '2026-09-01', '2027-06-30'),
(14, 5, 505, '2025-09-01', '2026-06-30');