-- Drop de la base de datos empresa si existe
DROP DATABASE IF EXISTS empresa;

-- Creación de la base de datos empresa
CREATE DATABASE empresa;
use empresa;

-- Crear tabla de departamentos
create table departamentos(
	departamento_id int auto_increment primary key,
	nombre varchar(100) not null
);

-- Crear tabla de empleados
create  table empleados(
	empleado_id int auto_increment primary key,
	nombre varchar(100) not null,
	salario decimal(10,2) not null,
	departamento_id int,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Crear tabla proyectos
create table proyectos(
	proyecto_id int auto_increment primary key,
	nombre varchar(100) not null
);

-- Crear tabla intermedia empleado_proyecto

create table empleado_proyecto(
	empleado_id Int,
	proyecto_id int,
	FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
	FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Crear la tabla detalles_empleados
create table detalles_empleados(
	empleado_id int primary key,
	director varchar(255) not null,
	telefono varchar(15) not null,
	FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Rellenar tablas
-- Insertar datos en la tabla departamentos
INSERT INTO departamentos (nombre) VALUES
('Recursos Humanos'),
('Ventas'),
('Desarrollo'),
('Marketing'),
('Finanzas');

-- Insertar datos en la tabla empleados
INSERT INTO empleados (nombre, salario, departamento_id) VALUES
('Juan Pérez', 50000.00, 1),
('María García', 55000.00, 2),
('Carlos Sánchez', 60000.00, 3),
('Lucía Fernández', 58000.00, 4),
('Ana López', 62000.00, 5),
('Pedro Gómez', 52000.00, 1),
('Elena Ruiz', 53000.00, 2),
('Marta Jiménez', 61000.00, 3),
('Luis Hernández', 59000.00, 4),
('Sofía Martín', 57000.00, 5);

-- Insertar datos en la tabla proyectos
INSERT INTO proyectos (nombre) VALUES
('Proyecto A'),
('Proyecto B'),
('Proyecto C'),
('Proyecto D'),
('Proyecto E'),
('Proyecto F'),
('Proyecto G'),
('Proyecto H'),
('Proyecto I'),
('Proyecto J');

-- Insertar datos en la tabla intermedia empleado_proyecto
INSERT INTO empleado_proyecto (empleado_id, proyecto_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Insertar datos en la tabla detalles_empleados
INSERT INTO detalles_empleados (empleado_id, director, telefono) VALUES
(1, 'Laura Núñez', '123456789'),
(2, 'Miguel Torres', '234567890'),
(3, 'Raquel González', '345678901'),
(4, 'Alberto Morales', '456789012'),
(5, 'Patricia Díaz', '567890123'),
(6, 'Javier Castillo', '678901234'),
(7, 'Verónica León', '789012345'),
(8, 'Oscar Ramos', '890123456'),
(9, 'Silvia Castro', '901234567'),
(10, 'David Alonso', '012345678');

-- Crear una función para calcular bonificación

DELIMITER $$

CREATE FUNCTION calcular_bonificacion (empleado_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE salario_base DECIMAL(10,2);
    DECLARE bonificacion DECIMAL(10,2);
    DECLARE salario_total DECIMAL(10,2);

    -- Obtener el salario base del empleado
    SELECT salario INTO salario_base FROM empleados WHERE id = empleado_id;

    -- Calcular la bonificación
    SET bonificacion = salario_base * 0.10;

    -- Calcular el salario total
    SET salario_total = salario_base + bonificacion;

    RETURN salario_total;
END$$

DELIMITER ;

-- Añadir una constraint
ALTER TABLE empleados ADD CONSTRAINT fk_departamento_empleado FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id);


-- Parte dos del laboratorio
-- Hacer bidireccional la relación empleados departamentos(crear tabla intermedia)
create table empleados_departamentos(
	empleado_id int,
	departamento_id int,
	primary key (empleado_id,departamento_id),
	FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
	FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Hacer bidireccional la relación entre empleados y detalles_empleados
ALTER TABLE empleados ADD detalles_id INT;
ALTER TABLE empleados ADD CONSTRAINT fk_detalles_empleado FOREIGN KEY (detalles_id) REFERENCES detalles_empleados(empleado_id);

-- Actualizar la tabla empleados para incluir el detalles_id
UPDATE empleados SET detalles_id = empleado_id;

-- Insertar datos en la tabla empleados_departamentos
INSERT INTO empleados_departamentos (empleado_id, departamento_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- Crear la tabla beneficios
CREATE TABLE beneficios (
    beneficio_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    descripcion VARCHAR(255) NOT NULL,
    CONSTRAINT fk_empleado_beneficio FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Rellenar tabla beneficios
-- Insertar datos en la tabla beneficios
INSERT INTO beneficios (empleado_id, descripcion) VALUES
(1, 'Seguro médico'),
(2, 'Bonificación anual'),
(3, 'Vales de despensa'),
(4, 'Días adicionales de vacaciones'),
(5, 'Descuento en gimnasio'),
(6, 'Seguro dental'),
(7, 'Ayuda para transporte'),
(8, 'Bono por desempeño'),
(9, 'Plan de retiro'),
(10, 'Acceso a capacitación continua');
