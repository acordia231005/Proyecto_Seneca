use proy_seneca;
-- Consulta 1. Nota media del RA1 de la asignatura “Bases de datos” por cada alumno.
select a.id id, avg(e.nota) nota_media
from alumno a
	join evaluacion e on a.id = e.alumno
	join criterios_evaluacion ce on e.criterios_evaluacion = ce.id
	join ra ra on ce.ra = ra.id
	join modulo_profesional mp on ra.modulo_profesional = mp.id
    join imparte i on i.modulo_profesional = mp.id
    join profesor p on i.profesor = p.id
where p.especialidad = 'Bases de datos' 
    and ra.id = 3
group by a.id;

-- Consulta 2. Nombre y apellidos del alumno que ha obtenido mayor nota en cualquier criterio de
-- evaluación de cualquier módulo profesional.
select p.nombre, p.apellidos
from alumno a
	join evaluacion e on a.id = e.alumno
	join persona p on a.id = p.id
where e.nota = (
    select max(nota)
    from evaluacion
);

-- Consulta 3. Nota media de una asignatura cualquiera.
select mp.nombre modulo_profesional, round(avg(e.nota)) nota_media
from evaluacion e
	join tarea t on e.tarea = t.id
	join ra r on e.criterios_evaluacion = r.id
	join modulo_profesional mp on r.modulo_profesional = mp.id
group by mp.id, mp.nombre;

-- Consulta 4. Nota media de expediente académico para cada alumno.
select p.nombre, p.apellidos, avg(e.nota) nota_media_expediente
from alumno a
	join evaluacion e on a.id = e.alumno
	join persona p on a.id = p.id
group by a.id, p.nombre, p.apellidos;

-- Consulta 5. Muestra el/los RA con mayor número de criterios
select r.id id, r.descripcion descripcion, count(ce.id) num_criterios
from ra r
	join criterios_evaluacion ce on r.id = ce.ra
group by r.id, r.descripcion
order by num_criterios desc
limit 1;

-- Consulta 6. Para el alumno cuyo primer ID es 1 muestra la nota final por cada módulo profesional.
select mp.nombre modulo_profesional, avg(e.nota) nota_final
from evaluacion e
	join tarea t on e.tarea = t.id
	join ra r on e.criterios_evaluacion = r.id
	join modulo_profesional mp on r.modulo_profesional = mp.id
where e.alumno = 7
group by mp.id, mp.nombre;

-- Consulta 7. Muestra todos los RA suspensos para cada alumno. El listado debe incluir nombre
-- completo del alumno, nombre del módulo y descripción del RA
select p.nombre nombre_alumno, p.apellidos apellidos_alumno, mp.nombre modulo_profesional,
		r.descripcion resultado_aprendizaje, e.nota nota
from evaluacion e
	join alumno a on e.alumno = a.id
	join persona p on a.id = p.id
	join tarea t on e.tarea = t.id
	join ra r on e.criterios_evaluacion = r.id
	join modulo_profesional mp on r.modulo_profesional = mp.id
where e.nota < 5
order by p.nombre, p.apellidos, mp.nombre;


-- Consulta 8. Muestra el nombre del profesor que tiene la asignatura con mayor número de suspensos.
select p.nombre nombre_profesor
from profesor pr
	join imparte i on pr.id = i.profesor
	join modulo_profesional mp on i.modulo_profesional = mp.id
	join ra r on mp.id = r.modulo_profesional
	join evaluacion e on r.id = e.criterios_evaluacion
    join persona p on p.id = pr.id
where e.nota < 5
group by pr.id, p.nombre
order by count(e.nota) desc
limit 1;

-- Consulta 9. Muestra los alumnos matriculados en el IES Los Alcores
select p.nombre, p.apellidos
from alumno a
	join matricula m on a.id = m.alumno
	join curso c on m.curso = c.id
	join oferta_educativa oe on c.oferta_educativa = oe.id
	join centro ce on oe.centro = ce.id
	join persona p on a.id = p.id
where ce.nombre = 'IES Los Alcores';
