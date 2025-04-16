USE `tienda`; SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.1 FROM producto;
SELECT nombre AS `name product`, precio AS euros, precio * 1.1 AS dollars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS initials FROM fabricante;
SELECT nombre, ROUND(precio) AS price_rounded FROM producto;
SELECT nombre, TRUNCATE(precio,0) AS price_truncated FROM producto;
SELECT fabricante.codigo FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT DISTINCT fabricante.codigo FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre FROM fabricante ORDER BY fabricante.nombre ASC;
SELECT fabricante.nombre FROM fabricante ORDER BY fabricante.nombre DESC;
SELECT producto.nombre FROM producto ORDER BY producto.nombre ASC, producto.precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT * FROM producto ORDER BY producto.precio ASC LIMIT 1;
SELECT * FROM producto ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
SELECT * FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' HAVING producto.precio > 200;
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate');
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante HAVING producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- ↑↑ store 33q ↑↑
USE universidad; SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE isnull(telefono);
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = "profesor" AND RIGHT(nif,1) = 'K' AND isnull(telefono);
SELECT * FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre AS nombre_dept FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1, apellido2, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M'; 
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_grado = 4;
SELECT DISTINCT persona.* FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE persona.tipo = 'alumno' AND alumno_se_matricula_asignatura.id_curso_escolar = 5;
-- ↑↑ university 9q ↑↑
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id RIGHT JOIN persona ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT * FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id WHERE persona.tipo = 'profesor' AND isnull(profesor.id_departamento);
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE isnull(profesor.id_departamento);
SELECT persona.* FROM persona JOIN  profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE isnull(asignatura.id_profesor);
SELECT asignatura.* FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE isnull(profesor.id_profesor);
-- ↑↑ university 5q ↑↑ LEFT/RIGHT JOIN
SELECT COUNT(*) FROM persona WHERE persona.tipo = 'alumno';
SELECT COUNT(*) FROM persona WHERE persona.tipo = 'alumno' AND year(persona.fecha_nacimiento) = 1999;
SELECT COUNT(*) AS teachers_total, departamento.nombre AS department FROM profesor JOIN  departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY teachers_total DESC;
SELECT departamento.nombre AS dept, COUNT(profesor.id_profesor) AS total_teachers FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY total_teachers DESC;
SELECT grado.nombre AS degree, COUNT(asignatura.id) AS total_subjects FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY Total_Subjects DESC;
SELECT grado.nombre AS degree, COUNT(asignatura.id) AS total_subjects FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING total_subjects > 40 ORDER BY total_subjects DESC;
SELECT grado.nombre AS degree, asignatura.tipo AS credit_type, COUNT(asignatura.creditos) AS total_credits FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo;
SELECT curso_escolar.anyo_inicio AS first_year, COUNT(DISTINCT persona.id) AS total_students_enrolled FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar LEFT JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id GROUP BY curso_escolar.anyo_inicio ORDER BY curso_escolar.anyo_inicio DESC;
SELECT persona.id AS id, persona.nombre AS name, persona.apellido1 AS first_family_name, persona.apellido2 AS second_family_name, COUNT(DISTINCT asignatura.id) AS total_subjects FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor LEFT JOIN profesor ON persona.id = profesor.id_profesor GROUP BY persona.id ORDER BY total_subjects DESC;
SELECT * FROM persona WHERE persona.tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT persona.* FROM persona JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_departamento IS NOT NULL AND asignatura.id IS NULL;
-- ↑↑ university 11q ↑↑ RESUMS