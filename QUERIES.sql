USE `tienda`;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;

SELECT nombre AS `name product`, precio AS euros,
precio * 1.1 AS dollars
FROM producto;

SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;



