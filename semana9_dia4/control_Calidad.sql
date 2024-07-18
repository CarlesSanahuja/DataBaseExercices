-- Drop de la base de datos Control_de_Calidad si existe
DROP DATABASE IF EXISTS Control_de_Calidad;

-- Creación de la base de datos Control_de_Calidad
CREATE DATABASE Control_de_Calidad;
use Control_de_Calidad;

-- Codigo que tengo que reparar
CREATE TABLE Estudiantes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Cursos VARCHAR(255) -- Aquí almacenamos múltiples cursos en una sola columna
);

INSERT INTO Estudiantes (ID, Nombre, Cursos) VALUES
(1, 'Juan Pérez', 'Matemáticas, Historia'),
(2, 'Ana Gómez', 'Biología'),
(3, 'Luis Rodríguez', 'Matemáticas, Física, Química');

CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoría VARCHAR(100),
    Proveedor VARCHAR(100),
    Precio DECIMAL(10, 2),
    Proveedores VARCHAR(255) -- Almacenamos los nombres de múltiples proveedores
);

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    Telefonos VARCHAR(255), -- Almacenando múltiples números de teléfono en una sola columna
    Dirección VARCHAR(255)
);

CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    Cliente VARCHAR(100),
    Fecha DATE,
    Productos VARCHAR(255), -- Almacena múltiples productos en una sola columna
    Cantidades VARCHAR(255), -- Almacena cantidades correspondientes en una sola columna
    Total DECIMAL(10, 2),
    Estado VARCHAR(50)
);

-- Primera optimización

drop table estudiantes ; -- Eliminar tabla estudiantes

CREATE TABLE Estudiantes ( -- Crear tabla esudiantes poniendo como una id auto incremental ya que el nombre puede repetirse y eliminiar el curso ya que no pude haber un valor por celda
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

create table cursos( -- Crear tabla cursos para relacionarla con los estudiantes
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(100)
);

create table cursos_estudiantes( -- Crear tabla intermedia para hacer la relación con los estudiantes ya que puede tener más de uno y poner como pk la unión de la id del estudiante más la id del curso
	estudiante_id int,
	curso_id int,
	primary key (curso_id,estudiante_id),
	FOREIGN KEY (curso_id) REFERENCES cursos(id),
	FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id)
);

-- Rellenar tablas
INSERT INTO Estudiantes (Nombre) VALUES
('Juan Pérez'),
('Ana Gómez'),
('Luis Rodríguez');

insert into cursos (nombre) values
('Matemáticas'),
('Historia'),
('Biología'),
('Física'),
('Química');

insert into cursos_estudiantes values
(1,1),
(1,2),
(2,3),
(3,1),
(3,4),
(3,5);

-- Segunda optimización

 drop table productos; -- Eliminar tabla productos
 
 -- Una posible mejora para que en un futuro al rellenar la tabla productos no hayan errores en la categoría (se produzcan errores ortográficos o conceptuales), sería bueno crear la tabla categorias y relacionar la id de cada categoría a su producto
create table categorias (
	ID INT auto_increment PRIMARY KEY,
	nombre varchar(100)
);

 -- Crear tabla productos con una id autoincremental y eliminar la columna proveedores ya que no puede haber más de un valor por celda.
CREATE TABLE Productos (
    ID INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria_id int,
    Proveedor VARCHAR(100),
    Precio DECIMAL(10, 2),
    FOREIGN KEY (Categoria_id) REFERENCES categorias(ID)
);
create table proveedores( -- Crear tabla proveedores con una id autoincremental
	ID INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(100)
);
create table productos_proveedores( -- Crear tabla intermedia para relacionar los productos con sus proveedores ya que puede tener más de uno y como pk la id del producto junto con la id del proveedor
	producto_id int,
	proveedor_id int,
	primary key (producto_id,proveedor_id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

-- Tercera optimización

drop table clientes; -- Eliminar la tabla clientes
	
-- Crear tabla clientes con una id auto incremental y eliminar la tabla telefonos ya que no puede haber más de un valor por celda
CREATE TABLE Clientes (
    ID INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    Dirección VARCHAR(255)
);

-- Crear tabla teléfonos con la fk id cliente, en este caso no es necesario hacer tabla intermedia ya que el telefono no puede ser de más de un cliente  
CREATE TABLE Telefonos (
    ID INT auto_increment PRIMARY KEY,
    Cliente_id INT,
    Numero VARCHAR(15),
    FOREIGN KEY (Cliente_id) REFERENCES Clientes(ID)
);

-- Cuarta optimización

-- Eliminar tabla pedidos
drop table pedidos;

-- Crear de nuevo la tabla pedidos con una id auto incremental y sin las columnas productos(no puede haber más de un dato por celda) y la columna cantidad ya que va unida a productos
-- También sería bueno unir el pedido con el cliente para posibles busquedas
CREATE TABLE Pedidos (
    ID INT auto_increment PRIMARY KEY,
    Cliente_id int(100), -- Cambiar cliente por cliente_id que tiene que ser una int
    Fecha DATE,
    Total DECIMAL(10, 2),
    Estado VARCHAR(50),
    FOREIGN KEY (Cliente_id) REFERENCES Clientes(ID)
);

-- Crear una tabla intermedia para relacionar cada pedido con los productos que incluye
create table pedidos_productos(
	pedido_id int,
	producto_id int,
	cantidad int,
	primary key (pedido_id,producto_id),
	FOREIGN KEY (pedido_id) REFERENCES pedidos(ID),
	FOREIGN KEY (producto_id) REFERENCES productos(ID)
);

-- Rellenar las tablas vacias
INSERT INTO Categorias (Nombre) VALUES
('Categoría A'),
('Categoría B'),
('Categoría C');

INSERT INTO Productos (Nombre, Categoria_ID, Proveedor, Precio) VALUES
('Producto 1', 1, 'Proveedor 1', 10.50),
('Producto 2', 2, 'Proveedor 2', 20.75),
('Producto 3', 3, 'Proveedor 3', 30.00),
('Producto 4', 1, 'Proveedor 1', 40.25),
('Producto 5', 2, 'Proveedor 2', 50.50),
('Producto 6', 3, 'Proveedor 3', 60.75),
('Producto 7', 1, 'Proveedor 1', 70.00),
('Producto 8', 2, 'Proveedor 2', 80.25),
('Producto 9', 3, 'Proveedor 3', 90.50),
('Producto 10', 1, 'Proveedor 1', 100.75);

INSERT INTO Proveedores (Nombre) VALUES
('Proveedor 1'),
('Proveedor 2'),
('Proveedor 3'),
('Proveedor 4'),
('Proveedor 5'),
('Proveedor 6'),
('Proveedor 7'),
('Proveedor 8'),
('Proveedor 9'),
('Proveedor 10');

INSERT INTO Productos_Proveedores (Producto_ID, Proveedor_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3),
(7, 1),
(8, 2),
(9, 3),
(10, 1);
INSERT INTO Clientes (Nombre, Email, Dirección) VALUES
('Cliente 1', 'cliente1@example.com', 'Dirección 1'),
('Cliente 2', 'cliente2@example.com', 'Dirección 2'),
('Cliente 3', 'cliente3@example.com', 'Dirección 3'),
('Cliente 4', 'cliente4@example.com', 'Dirección 4'),
('Cliente 5', 'cliente5@example.com', 'Dirección 5'),
('Cliente 6', 'cliente6@example.com', 'Dirección 6'),
('Cliente 7', 'cliente7@example.com', 'Dirección 7'),
('Cliente 8', 'cliente8@example.com', 'Dirección 8'),
('Cliente 9', 'cliente9@example.com', 'Dirección 9'),
('Cliente 10', 'cliente10@example.com', 'Dirección 10');

INSERT INTO Telefonos (Cliente_ID, Numero) VALUES
(1, '123456789'),
(2, '234567890'),
(3, '345678901'),
(4, '456789012'),
(5, '567890123'),
(6, '678901234'),
(7, '789012345'),
(8, '890123456'),
(9, '901234567'),
(10, '012345678');

INSERT INTO Pedidos (Cliente_ID, Fecha, Total, Estado) VALUES
(1, '2024-01-01', 100.50, 'En Proceso'),
(2, '2024-02-02', 200.75, 'Completado'),
(3, '2024-03-03', 300.00, 'Enviado'),
(4, '2024-04-04', 400.25, 'Pendiente'),
(5, '2024-05-05', 500.50, 'Cancelado'),
(6, '2024-06-06', 600.75, 'En Proceso'),
(7, '2024-07-07', 700.00, 'Completado'),
(8, '2024-08-08', 800.25, 'Enviado'),
(9, '2024-09-09', 900.50, 'Pendiente'),
(10, '2024-10-10', 1000.75, 'Cancelado');

INSERT INTO Pedidos_Productos (Pedido_ID, Producto_ID, Cantidad) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 4),
(2, 4, 1),
(3, 5, 2),
(3, 6, 3),
(4, 7, 4),
(4, 8, 1),
(5, 9, 2),
(5, 10, 3),
(6, 1, 1),
(6, 2, 2),
(7, 3, 3),
(7, 4, 4),
(8, 5, 1),
(8, 6, 2),
(9, 7, 3),
(9, 8, 4),
(10, 9, 1),
(10, 10, 2);
