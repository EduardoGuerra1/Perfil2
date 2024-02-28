DROP DATABASE IF EXISTS db_quick_bite;
CREATE DATABASE db_quick_bite;

USE db_quick_bite;

CREATE TABLE clientes(
	cliente_id VARCHAR(25) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	telefono VARCHAR(10),
	direccion VARCHAR(255)
);

CREATE TABLE empleados(
	empleado_id VARCHAR(25) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	cargo VARCHAR(50),
	fecha_contratacion DATE,
	salario DECIMAL(10,2),
	CHECK(salario>=0)
);

CREATE TABLE productos(
	producto_id VARCHAR(25) PRIMARY KEY,
	nombre VARCHAR(100),
	descripcion VARCHAR(255),
	precio DECIMAL(10,2),
	existencias INT, 
	
	CHECK(precio>=0),
	CHECK(existencias>=0)
	
);

CREATE TABLE pedidos(
	pedido_id VARCHAR(25) PRIMARY KEY,
	cliente_id VARCHAR(25) NOT NULL,
	fecha_pedido DATE,
	total DECIMAL(10,2),
	estado VARCHAR(20) DEFAULT 'deshabilitado',
	empleado_id VARCHAR(25) NOT NULL,
	
	CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
	CONSTRAINT fk_pedido_empleado FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
	
	CHECK(total>=0)
);

CREATE TABLE detalles_pedido(
	detalle_id VARCHAR(25) PRIMARY KEY,
	pedido_id VARCHAR(25) NOT NULL,
	producto_id VARCHAR(25) NOT NULL,
	cantidad INT,
	precio_unitario DECIMAL(10,2),
	sub_total DECIMAL(10,2),
	
	CONSTRAINT fK_detalle_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
	CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
	
	CHECK(cantidad>=0)
);

DELIMITER //
CREATE TRIGGER borrar_existencia
AFTER INSERT
ON detalles_pedido
FOR EACH ROW
BEGIN
    DECLARE producto_id INT;
    DECLARE cantidad INT;
    SELECT producto_id, cantidad INTO producto_id, cantidad
    FROM detalles_pedido
    WHERE producto_id = NEW.producto_id; 
    UPDATE productos
    SET existencias = existencias - cantidad
    WHERE productos.producto_id = producto_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_cliente(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_telefono VARCHAR(10),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO clientes (cliente_id, nombre, apellido, telefono, direccion)
    VALUES (UUID(), p_nombre, p_apellido, p_telefono, p_direccion);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_empleado(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_cargo VARCHAR(50),
    IN p_fecha_contratacion DATE,
    IN p_salario DECIMAL(10,2)
)
BEGIN
    INSERT INTO empleados (empleado_id, nombre, apellido, cargo, fecha_contratacion, salario)
    VALUES (UUID(), p_nombre, p_apellido, p_cargo, p_fecha_contratacion, p_salario);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_producto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_precio DECIMAL(10,2),
    IN p_existencias INT
)
BEGIN
    INSERT INTO productos (producto_id, nombre, descripcion, precio, existencias)
    VALUES (UUID(), p_nombre, p_descripcion, p_precio, p_existencias);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_pedido(
    IN p_cliente_id VARCHAR(25),
    IN p_fecha_pedido INT,
    IN p_total DECIMAL(10,2),
    IN p_estado VARCHAR(20),
    IN p_empleado_id VARCHAR(25) 
)
BEGIN
    INSERT INTO pedidos (pedido_id, cliente_id, fecha_pedido, total, estado, empleado_id)
    VALUES (UUID(), p_cliente_id, p_fecha_pedido, p_total, p_estado, p_empleado_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_detalle_pedido(
    IN p_pedido_id VARCHAR(25),
    IN p_producto_id VARCHAR(25),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_subtotal DECIMAL(10,2) 
)
BEGIN
    INSERT INTO detalles_pedido (detalle_id, pedido_id, producto_id, cantidad, precio_unitario, sub_total)
    VALUES (UUID(), p_pedido_id, p_producto_id, p_cantidad, p_precio_unitario, p_subtotal);
END //
DELIMITER ;

-- Inserciones en la tabla clientes
CALL insertar_cliente('Juan', 'Pérez', '1234567890', 'Calle 123');
CALL insertar_cliente('María', 'Gómez', '0987654321', 'Avenida Principal');
CALL insertar_cliente('Pedro', 'López', '5555555555', 'Calle 456');
CALL insertar_cliente('Laura', 'García', '6666666666', 'Avenida Central');
CALL insertar_cliente('Luis', 'Hernández', '7777777777', 'Calle 789');
CALL insertar_cliente('Ana', 'Martínez', '8888888888', 'Avenida Sur');
CALL insertar_cliente('Sofía', 'Díaz', '9999999999', 'Calle 1011');
CALL insertar_cliente('Carlos', 'Ruiz', '1010101010', 'Avenida Oeste');
CALL insertar_cliente('Elena', 'Sánchez', '1212121212', 'Calle 1314');
CALL insertar_cliente('Diego', 'Torres', '1414141414', 'Avenida Este');
CALL insertar_cliente('Lucía', 'Fernández', '1616161616', 'Calle 1516');
CALL insertar_cliente('Andrés', 'Ramírez', '1818181818', 'Avenida Norte');
CALL insertar_cliente('Marta', 'Vargas', '1919191919', 'Calle 1718');
CALL insertar_cliente('Pablo', 'Moreno', '2020202020', 'Avenida 1920');
CALL insertar_cliente('Clara', 'Gutiérrez', '2121212121', 'Calle 2021');

-- Inserciones en la tabla empleados
CALL insertar_empleado('Pedro', 'Martínez', 'Gerente', '2024-02-28', 3000.00);
CALL insertar_empleado('Ana', 'López', 'Cajero', '2024-02-28', 2000.00);
CALL insertar_empleado('Luis', 'Gómez', 'Cocinero', '2024-02-28', 2500.00);
CALL insertar_empleado('María', 'Hernández', 'Repartidor', '2024-02-28', 1800.00);
CALL insertar_empleado('Juan', 'Díaz', 'Cajero', '2024-02-28', 2000.00);
CALL insertar_empleado('Laura', 'Ruiz', 'Cocinero', '2024-02-28', 2500.00);
CALL insertar_empleado('Carlos', 'Sánchez', 'Repartidor', '2024-02-28', 1800.00);
CALL insertar_empleado('Elena', 'Torres', 'Cajero', '2024-02-28', 2000.00);
CALL insertar_empleado('Diego', 'Fernández', 'Cocinero', '2024-02-28', 2500.00);
CALL insertar_empleado('Sofía', 'Ramírez', 'Repartidor', '2024-02-28', 1800.00);
CALL insertar_empleado('Andrés', 'Vargas', 'Gerente', '2024-02-28', 3000.00);
CALL insertar_empleado('Marta', 'Moreno', 'Cajero', '2024-02-28', 2000.00);
CALL insertar_empleado('Pablo', 'Gutiérrez', 'Cocinero', '2024-02-28', 2500.00);
CALL insertar_empleado('Clara', 'Díaz', 'Repartidor', '2024-02-28', 1800.00);
CALL insertar_empleado('Lucía', 'Sánchez', 'Cajero', '2024-02-28', 2000.00);

-- Inserciones en la tabla productos
CALL insertar_producto('Hamburguesa', 'Deliciosa hamburguesa con queso y tocino', 5.99, 100);
CALL insertar_producto('Pizza', 'Pizza de pepperoni y queso', 8.50, 50);
CALL insertar_producto('Hot dog', 'Hot dog con salsa y aderezos', 3.99, 75);
CALL insertar_producto('Sándwich de pollo', 'Sándwich de pollo a la parrilla con lechuga y tomate', 6.50, 60);
CALL insertar_producto('Ensalada César', 'Ensalada César con pollo a la parrilla y aderezo César', 7.99, 40);
CALL insertar_producto('Papas fritas', 'Papas fritas crujientes y doradas', 2.50, 90);
CALL insertar_producto('Refresco cola', 'Refresco de cola en lata', 1.99, 200);
CALL insertar_producto('Agua embotellada', 'Agua mineral embotellada', 1.00, 150);
CALL insertar_producto('Nachos con queso', 'Nachos con salsa de queso caliente', 4.99, 80);
CALL insertar_producto('Pollo frito', 'Pollo frito crujiente', 9.99, 30);
CALL insertar_producto('Sopa del día', 'Sopa casera del día', 3.50, 100);
CALL insertar_producto('Tacos al pastor', 'Tacos al pastor con piña y cilantro', 10.50, 25);
CALL insertar_producto('Pescado a la parrilla', 'Filete de pescado a la parrilla con limón', 12.99, 20);
CALL insertar_producto('Huevos rancheros', 'Huevos rancheros con salsa roja y tortillas', 8.99, 35);
CALL insertar_producto('Pastel de chocolate', 'Pastel de chocolate con crema batida', 15.99, 15);


-- Inserciones en la tabla pedidos
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');
CALL insertar_pedido('d7bfa4f7-d65d-11ee-9d3b-a', '2024-02-28', 5.99, 'Enviada', 'd7c58714-d65d-11ee-9d3b-a');


--inserciones en la tabla detalle pedido

CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
CALL insertar_detalle_pedido('f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
