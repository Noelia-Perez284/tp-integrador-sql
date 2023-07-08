use tienda;
select * from tienda.cliente;
select * from tienda.producto;
select * from tienda.orden_de_compra;

select * from tienda.detalle_orden_de_compra;


/*EJERCICIO 4
Realiza una consulta utilizando SELECT JOIN para obtener la información de los
productos comprados por cada cliente.
*/

SELECT c.nombre AS nombre, c.id_cliente AS id, producto.nombre AS producto , detalle_orden_de_compra.cantidad AS cantidad
FROM cliente AS c
JOIN orden_de_compra ON c.id_cliente = orden_de_compra.id_cliente
JOIN detalle_orden_de_compra ON orden_de_compra.id_orden_de_compra = detalle_orden_de_compra.id_orden_de_compra
JOIN producto ON detalle_orden_de_compra.id_producto = producto.id_producto;

select *
from cliente
left join orden_de_compra
on cliente.id_cliente=orden_de_compra.id_cliente;

select *
from orden_de_compra
left join detalle_orden_de_compra
on detalle_orden_de_compra.id_orden_de_compra=orden_de_compra.id_orden_de_compra;

select *
from orden_de_compra
right join detalle_orden_de_compra
on detalle_orden_de_compra.id_orden_de_compra=orden_de_compra.id_orden_de_compra


/* Crea una VIEW que muestre los productos con descuento.*/
/*aca me trae todos los producyos, con descuento y sin descuento*/
CREATE VIEW vista_producto_descuento AS
SELECT nombre, precio, descuento, precio - (precio * descuento) AS precio_con_descuento
FROM producto;
SELECT * FROM vista_producto_descuento;
DROP VIEW vista_producto_descuento;


/*aca me trae solo los productos con descuento*/
CREATE VIEW vista_producto_con_descuento AS
SELECT nombre, precio, descuento, precio - (precio * descuento) AS precio_con_descuento
FROM producto
WHERE descuento IS NOT NULL;
SELECT * FROM vista_producto_con_descuento;

/*Crea un INDEX en la columna "nombre" de la tabla "Productos" para mejorar la
velocidad de las consultas.*/

CREATE INDEX idx_nombre ON producto(nombre);