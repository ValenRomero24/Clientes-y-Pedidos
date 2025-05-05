-- // Insertar clientes
INSERT INTO clientes (nombre, telefono, direccion)
VALUES 	('Victoria Zapata','543 431 1223','Calle falsa 1'), 
		('Valentin Romero','221 565 7016','Calle falsa 2'),
        ('Agustin Argañaraz','234 432 3242','Calle falsa 3'),
        ('Agustina Bueno','132 572 1098','Calle falsa 4'),
        ('Julian Romero','335 213 5876','Calle falsa 2');

-- SELECT * FROM clientes;
        
-- // Insertar pedidos
INSERT INTO pedidos (total, clientes_id)
VALUES 	(200.50, 1),
		(300.50, 1),
        (400.50, 1),
        (140.50, 4),
        (600.50, 2),
        (240.00, 3),
        (250.60, 5),
        (200.70, 2),
        (120.50, 4),
        (700.80, 2);
        
-- SELECT * FROM pedidos;

-- //Proyectar todos los clientes de la tabla clientes y sus pedidos
SELECT clientes.nombre AS 'Cliente', pedidos.id AS 'Pedido'
FROM clientes INNER JOIN pedidos
	ON clientes.id = pedidos.clientes_id;
    
-- //Proyectar todos los pedidos de un cliente especifico usando su ID
SELECT * 
FROM pedidos
WHERE clientes_id = 2;


-- // Calcular el total de todos los pedidos para cada cliente
SELECT clientes_id AS 'ID', clientes.nombre AS 'Nombre', ROUND(SUM(pedidos.total)) AS 'Total'
FROM clientes JOIN pedidos
ON clientes.id = pedidos.clientes_id
GROUP BY clientes.id, clientes.nombre;

-- // Eliminar clientes de la tabla de clientes y cada uno de sus pedidos de la tabla pedidos
DELETE FROM pedidos WHERE clientes_id=3;

DELETE FROM clientes WHERE id = 3;

-- // Proyectar los 3 clientes que han realizado mas pedidos de forma descendente por nro de pedidos
SELECT c.id, c.nombre, COUNT(p.id) AS cant_pedidos
FROM clientes AS C
JOIN pedidos AS p
ON c.id = p.clientes_id
GROUP BY c.id, c.nombre
ORDER BY cant_pedidos DESC
LIMIT 3;