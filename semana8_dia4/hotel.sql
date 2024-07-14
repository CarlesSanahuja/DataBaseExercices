-- Drop de la base de datos hotel si existe
DROP DATABASE IF EXISTS hotel;

-- Creación de la base de datos hotel
CREATE DATABASE hotel;
use hotel;

-- Crear tabla servio
create table servicios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(255) not null,
	descripcion varchar(255)
);

-- Crear tabla cliente
create table clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(255) not null,
	email varchar(255)
);

-- Crear tabla hoteles
create table hoteles(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(255) not null,
	direccion varchar(255) not null
);

-- Crear tabla habitaciones
create table habitaciones(
	id INT AUTO_INCREMENT PRIMARY KEY,
	numero int,
	tipo varchar(255) not null,
	estado varchar(255),
	id_hotel int,
	FOREIGN KEY (id_hotel) REFERENCES hoteles(id)
);

-- Crear tabla caracteristicasHabitacion
create table caracteristicasHabitacion(
	id int primary key,
	dimensiones decimal,
	balcon boolean,
	fumador boolean,
	numero_personas int,
	foreign key (id) references habitaciones(id)
);

-- Crear tabla reserva
create table reservas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	cliente_id int,
	habitacion_id int,
	fecha_inicio date,
	fecha_fin date,
	estado varchar(255),
	FOREIGN KEY (cliente_id) REFERENCES clientes(id),
	FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
);

-- Crear tabla intermedia cliente_servicios para la relación many-to-many
CREATE TABLE cliente_servicios(
    cliente_id INT,
    servicio_id INT,
    PRIMARY KEY (cliente_id, servicio_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

-- Crear tabla para la relación one-to-one entre clientes y habitaciones
CREATE TABLE cliente_habitacion(
    cliente_id INT UNIQUE,
    habitacion_id INT UNIQUE,
    PRIMARY KEY (cliente_id, habitacion_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
);

-- Crear tabla reserva_servicio
create table reserva_servicio(
reserva_id int,
servicio_id int,
primary key (reserva_id,servicio_id),
FOREIGN KEY (reserva_id) REFERENCES reservas(id),
FOREIGN KEY (servicio_id) REFERENCES servicios(id)
);

-- Modificación de Estructura de Tablas
ALTER TABLE reservas
ADD fecha_checkin DATE,
ADD fecha_checkout DATE;

-- Insertar datos en la tabla servicios
INSERT INTO servicios (nombre, descripcion) VALUES
('WiFi', 'Conexión inalámbrica a internet'),
('Desayuno', 'Desayuno buffet incluido'),
('Piscina', 'Acceso a la piscina del hotel'),
('Gimnasio', 'Acceso al gimnasio del hotel'),
('Spa', 'Servicios de spa y bienestar');

-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María García', 'maria.garcia@example.com'),
('Carlos Sánchez', 'carlos.sanchez@example.com'),
('Lucía Fernández', 'lucia.fernandez@example.com'),
('Ana López', 'ana.lopez@example.com');

-- Insertar datos en la tabla hoteles
INSERT INTO hoteles (nombre, direccion) VALUES
('Hotel Sol', 'Calle del Sol, 123'),
('Hotel Luna', 'Avenida de la Luna, 456'),
('Hotel Estrella', 'Plaza de la Estrella, 789');

-- Insertar datos en la tabla habitaciones
INSERT INTO habitaciones (numero, tipo, estado, id_hotel) VALUES
(101, 'Individual', 'Disponible', 1),
(102, 'Doble', 'Ocupada', 1),
(103, 'Suite', 'Disponible', 1),
(201, 'Individual', 'Disponible', 2),
(202, 'Doble', 'Ocupada', 2),
(203, 'Suite', 'Disponible', 2),
(301, 'Individual', 'Disponible', 3),
(302, 'Doble', 'Ocupada', 3),
(303, 'Suite', 'Disponible', 3);

-- Insertar datos en la tabla caracteristicasHabitacion
INSERT INTO caracteristicasHabitacion (id, dimensiones, balcon, fumador, numero_personas) VALUES
(1, 20.5, FALSE, FALSE, 1),
(2, 30.0, TRUE, TRUE, 2),
(3, 50.0, TRUE, FALSE, 4),
(4, 20.5, FALSE, FALSE, 1),
(5, 30.0, TRUE, TRUE, 2),
(6, 50.0, TRUE, FALSE, 4),
(7, 20.5, FALSE, FALSE, 1),
(8, 30.0, TRUE, TRUE, 2),
(9, 50.0, TRUE, FALSE, 4);

-- Insertar datos en la tabla reservas
INSERT INTO reservas (cliente_id, habitacion_id, fecha_inicio, fecha_fin, estado, fecha_checkin, fecha_checkout) VALUES
(1, 2, '2024-07-01', '2024-07-05', 'Confirmada', '2024-07-01', '2024-07-05'),
(2, 5, '2024-07-02', '2024-07-06', 'Confirmada', '2024-07-02', '2024-07-06'),
(3, 8, '2024-07-03', '2024-07-07', 'Confirmada', '2024-07-03', '2024-07-07');

-- Insertar datos en la tabla intermedia cliente_servicios
INSERT INTO cliente_servicios (cliente_id, servicio_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

-- Insertar datos en la tabla para la relación one-to-one entre clientes y habitaciones
INSERT INTO cliente_habitacion (cliente_id, habitacion_id) VALUES
(1, 2),
(2, 5),
(3, 8);

-- Insertar datos en reserva_servicio
insert into reserva_servicio (reserva_id,servicio_id) values
(1,1),
(1,2),
(2,4),
(2,1),
(3,1);

-- Consulta con joins
select h.numero,c.nombre
from habitaciones h 
join cliente_habitacion ch on h.id = ch.habitacion_id 
join clientes c on ch.cliente_id = c.id 
join reservas r on h.id = r.habitacion_id 
where r.estado = 'Confirmada';

-- Retos Acidionales
select count(r.id)
from reservas r 
join habitaciones h on h.id = r.habitacion_id 
join hoteles h2 on h2.id  = h.id_hotel 
where  h2.nombre = 'Hotel Sol' and month (r.fecha_inicio) =7;

-- Crear indices en reservas

-- Crear índice para cliente_id
CREATE INDEX idx_cliente_id ON reservas(cliente_id);

-- Crear índice para habitacion_id
CREATE INDEX idx_habitacion_id ON reservas(habitacion_id);

-- Crear índice para fecha_inicio
CREATE INDEX idx_fecha_inicio ON reservas(fecha_inicio);

-- Crear índice para fecha_fin
CREATE INDEX idx_fecha_fin ON reservas(fecha_fin);

-- Transacción

-- Simular reserva por Cliente A


DELIMITER //

CREATE PROCEDURE ReservarHabitacion(
    IN p_cliente_id INT,
    IN p_habitacion_id INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    DECLARE v_count INT;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Verificar si ya hay una reserva en el mismo período para la misma habitación
    SELECT COUNT(*) INTO v_count
    FROM reservas
    WHERE habitacion_id = p_habitacion_id
      AND (
          (p_fecha_inicio BETWEEN fecha_inicio AND fecha_fin) OR
          (p_fecha_fin BETWEEN fecha_inicio AND fecha_fin) OR
          (fecha_inicio BETWEEN p_fecha_inicio AND p_fecha_fin) OR
          (fecha_fin BETWEEN p_fecha_inicio AND p_fecha_fin)
      );

    -- Si no hay reservas conflictivas, proceder con la nueva reserva
    IF v_count = 0 THEN
        -- Insertar la nueva reserva
        INSERT INTO reservas (cliente_id, habitacion_id, fecha_inicio, fecha_fin, estado, fecha_checkin, fecha_checkout)
        VALUES (p_cliente_id, p_habitacion_id, p_fecha_inicio, p_fecha_fin, 'Confirmada', p_fecha_inicio, p_fecha_fin);

        -- Marcar la habitación como ocupada
        UPDATE habitaciones
        SET estado = 'Ocupada'
        WHERE id = p_habitacion_id;

        -- Confirmar la transacción
        COMMIT;
    ELSE
        -- Cancelar la transacción
        ROLLBACK;
        SELECT 'La habitación ya está reservada en el período solicitado' AS mensaje;
    END IF;
END //

DELIMITER ;

CALL ReservarHabitacion(5, 6, '2024-07-01', '2024-07-05');

DELIMITER //

-- Crear Trigger para Insertar Nueva Reserva
CREATE TRIGGER after_insert_reserva
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Confirmada' THEN
        UPDATE habitaciones
        SET estado = 'Ocupada'
        WHERE id = NEW.habitacion_id;
    END IF;
END //

DELIMITER ;

-- Crear Trigger para Actualizar Estado de Habitación al Realizar Check-Out
DELIMITER //

CREATE TRIGGER after_update_reserva
AFTER UPDATE ON reservas
FOR EACH ROW
BEGIN
    IF NEW.fecha_checkout IS NOT NULL AND NEW.fecha_checkout < CURDATE() THEN
        UPDATE habitaciones
        SET estado = 'Disponible'
        WHERE id = NEW.habitacion_id;
    END IF;
END //

DELIMITER ;
