
-- Drop de la base de datos lab1 si existe
DROP DATABASE IF EXISTS lab1;

-- Creación de la base de datos lab1
CREATE DATABASE lab1;
use lab1;
-- Ejercicio 1: Base de Datos de Películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(255),
    director VARCHAR(255),
    año_estreno INT,
    genero VARCHAR(255),
    actor_principal VARCHAR(255),
    actor_secundario VARCHAR(255),
    pais_origen VARCHAR(255)
);
-- Ejercicio 2: Base de Datos de Coches
CREATE TABLE Coches (
    id_coche INT PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    año INT,
    propietario_nombre VARCHAR(255),
    propietario_direccion VARCHAR(255),
    propietario_telefono VARCHAR(255),
    taller_nombre VARCHAR(255),
    taller_direccion VARCHAR(255)
);
-- Ejercicio 3: Base de Datos de Equipos de Fútbol
CREATE TABLE EquiposFutbol (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    estadio VARCHAR(255),
    entrenador VARCHAR(255),
    ciudad VARCHAR(255),
    jugador1 VARCHAR(255),
    jugador2 VARCHAR(255),
    jugador3 VARCHAR(255)
);
-- Ejercicio 4: Base de Datos de Canciones
CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY,
    titulo VARCHAR(255),
    artista VARCHAR(255),
    album VARCHAR(255),
    año_lanzamiento INT,
    genero VARCHAR(255),
    duracion TIME,
    compositor VARCHAR(255)
);
-- Ejercicio 5: Base de Datos de Animales
CREATE TABLE Animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(255),
    especie VARCHAR(255),
    edad INT,
    propietario_nombre VARCHAR(255),
    propietario_direccion VARCHAR(255),
    veterinario_nombre VARCHAR(255),
    veterinario_direccion VARCHAR(255)
);
-- Insertar datos en la tabla de películas
INSERT INTO Peliculas (id_pelicula, titulo, director, año_estreno, genero, actor_principal, actor_secundario, pais_origen) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'Tim Robbins', 'Morgan Freeman', 'USA'),
(2, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'Marlon Brando', 'Al Pacino', 'USA'),
(3, 'The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'Christian Bale', 'Heath Ledger', 'USA'),
(4, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'Tom Hanks', 'Robin Wright', 'USA'),
(5, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'John Travolta', 'Samuel L. Jackson', 'USA'),
(6, 'Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'USA'),
(7, 'Titanic', 'James Cameron', 1997, 'Romance', 'Leonardo DiCaprio', 'Kate Winslet', 'USA'),
(8, 'The Matrix', 'The Wachowskis', 1999, 'Sci-Fi', 'Keanu Reeves', 'Laurence Fishburne', 'USA'),
(9, 'Avatar', 'James Cameron', 2009, 'Sci-Fi', 'Sam Worthington', 'Zoe Saldana', 'USA'),
(10, 'Gladiator', 'Ridley Scott', 2000, 'Action', 'Russell Crowe', 'Joaquin Phoenix', 'USA');

-- Insertar datos en la tabla Coches
INSERT INTO Coches (id_coche, marca, modelo, año, propietario_nombre, propietario_direccion, propietario_telefono, taller_nombre, taller_direccion) VALUES
(1, 'Toyota', 'Corolla', 2018, 'Juan Pérez', 'Calle Principal 123', '123-456-7890', 'Taller Juan', 'Avenida Central 456'),
(2, 'Honda', 'Civic', 2017, 'María López', 'Avenida Libertad 456', '987-654-3210', 'Taller Martínez', 'Calle Independencia 789'),
(3, 'Ford', 'Mustang', 2020, 'Pedro García', 'Calle Sur 789', '456-789-0123', 'Taller Rodríguez', 'Avenida Norte 123'),
(4, 'Chevrolet', 'Camaro', 2019, 'Ana Martínez', 'Calle Este 567', '321-654-0987', 'Taller Sánchez', 'Avenida Oeste 567'),
(5, 'Nissan', 'Altima', 2016, 'Luisa Torres', 'Avenida Central 789', '789-012-3456', 'Taller Gómez', 'Calle Principal 234'),
(6, 'BMW', 'X5', 2021, 'Carlos Ruiz', 'Calle Norte 345', '210-987-6543', 'Taller López', 'Avenida Sur 890'),
(7, 'Mercedes-Benz', 'C-Class', 2019, 'Sofía Rodríguez', 'Avenida Oeste 890', '543-210-9876', 'Taller Martín', 'Calle Este 678'),
(8, 'Audi', 'A4', 2018, 'Javier Gómez', 'Calle Este 789', '012-345-6789', 'Taller Pérez', 'Avenida Norte 345'),
(9, 'Hyundai', 'Elantra', 2017, 'Laura Sánchez', 'Avenida Libertad 678', '876-543-2109', 'Taller Hernández', 'Calle Sur 456'),
(10, 'Kia', 'Optima', 2019, 'Diego Martín', 'Calle Principal 567', '234-567-8901', 'Taller Ruiz', 'Avenida Central 678');

-- Insertar datos en la tabla EquiposFutbol
INSERT INTO EquiposFutbol (id_equipo, nombre_equipo, estadio, entrenador, ciudad, jugador1, jugador2, jugador3) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 'Carlo Ancelotti', 'Madrid', 'Karim Benzema', 'Luka Modric', 'Sergio Ramos'),
(2, 'FC Barcelona', 'Camp Nou', 'Ronald Koeman', 'Barcelona', 'Lionel Messi', 'Gerard Piqué', 'Sergio Busquets'),
(3, 'Liverpool FC', 'Anfield', 'Jürgen Klopp', 'Liverpool', 'Mohamed Salah', 'Virgil van Dijk', 'Sadio Mané'),
(4, 'Manchester City', 'Etihad Stadium', 'Pep Guardiola', 'Manchester', 'Kevin De Bruyne', 'Raheem Sterling', 'Phil Foden'),
(5, 'Juventus FC', 'Allianz Stadium', 'Massimiliano Allegri', 'Turín', 'Cristiano Ronaldo', 'Paulo Dybala', 'Giorgio Chiellini'),
(6, 'Bayern Munich', 'Allianz Arena', 'Julian Nagelsmann', 'Múnich', 'Robert Lewandowski', 'Thomas Müller', 'Manuel Neuer'),
(7, 'Paris Saint-Germain', 'Parc des Princes', 'Mauricio Pochettino', 'París', 'Kylian Mbappé', 'Neymar Jr.', 'Marco Verratti'),
(8, 'Chelsea FC', 'Stamford Bridge', 'Thomas Tuchel', 'Londres', 'N\'Golo Kanté', 'Mason Mount', 'Christian Pulisic'),
(9, 'Atlético de Madrid', 'Wanda Metropolitano', 'Diego Simeone', 'Madrid', 'Luis Suárez', 'João Félix', 'Jan Oblak'),
(10, 'AC Milan', 'San Siro', 'Stefano Pioli', 'Milán', 'Zlatan Ibrahimović', 'Gianluigi Donnarumma', 'Franck Kessié');

-- Insertar datos en la tabla Canciones
INSERT INTO Canciones (id_cancion, titulo, artista, album, año_lanzamiento, genero, duracion, compositor) VALUES
(1, 'Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 1975, 'Rock', '00:05:55', 'Freddie Mercury'),
(2, 'Shape of You', 'Ed Sheeran', '÷', 2017, 'Pop', '00:03:53', 'Ed Sheeran'),
(3, 'Rolling in the Deep', 'Adele', '21', 2010, 'Pop', '00:03:48', 'Adele Adkins'),
(4, 'Despacito', 'Luis Fonsi', 'Vida', 2017, 'Pop', '00:03:48', 'Luis Fonsi, Daddy Yankee'),
(5, 'Billie Jean', 'Michael Jackson', 'Thriller', 1982, 'Pop', '00:04:54', 'Michael Jackson'),
(6, 'Hotel California', 'Eagles', 'Hotel California', 1976, 'Rock', '00:06:30', 'Don Felder, Glenn Frey, Don Henley'),
(7, 'Stairway to Heaven', 'Led Zeppelin', 'Led Zeppelin IV', 1971, 'Rock', '00:08:02', 'Jimmy Page, Robert Plant'),
(8, 'Thinking Out Loud', 'Ed Sheeran', '×', 2014, 'Pop', '00:04:41', 'Ed Sheeran, Amy Wadge'),
(9, 'Shape of You', 'Ed Sheeran', '÷ (Divide)', 2017, 'Pop', '00:03:54', 'Ed Sheeran'),
(10, 'Thriller', 'Michael Jackson', 'Thriller', 1982, 'Pop', '00:05:57', 'Rod Temperton');

-- Insertar datos en la tabla Animales
INSERT INTO Animales (id_animal, nombre, especie, edad, propietario_nombre, propietario_direccion, veterinario_nombre, veterinario_direccion) VALUES
(1, 'Max', 'Perro', 5, 'Ana Martínez', 'Calle Principal 123', 'Dr. Pérez', 'Avenida Central 456'),
(2, 'Whiskers', 'Gato', 3, 'Luisa Rodríguez', 'Calle Libertad 456', 'Dr. Gómez', 'Avenida Sur 789'),
(3, 'Buddy', 'Perro', 7, 'Carlos Sánchez', 'Avenida Norte 789', 'Dra. López', 'Calle Este 123'),
(4, 'Oliver', 'Gato', 2, 'Laura Pérez', 'Calle Oeste 567', 'Dr. Martínez', 'Avenida Central 890'),
(5, 'Luna', 'Perro', 4, 'Diego Gómez', 'Calle Principal 234', 'Dra. Rodríguez', 'Avenida Libertad 678'),
(6, 'Simba', 'Gato', 1, 'María López', 'Avenida Sur 890', 'Dr. Hernández', 'Calle Norte 345'),
(7, 'Charlie', 'Perro', 6, 'Javier Ruiz', 'Calle Este 678', 'Dra. Sánchez', 'Avenida Oeste 456'),
(8, 'Milo', 'Gato', 5, 'Sofía Martín', 'Avenida Norte 345', 'Dr. Pérez', 'Calle Principal 567'),
(9, 'Bella', 'Perro', 3, 'Pablo Hernández', 'Calle Oeste 678', 'Dra. Gómez', 'Avenida Central 789'),
(10, 'Oreo', 'Gato', 2, 'Lucía Rodríguez', 'Calle Libertad 890', 'Dr. Martínez', 'Avenida Sur 456');

-- Ejercicio 1
-- Crear tabla Genero_peliculas
CREATE TABLE Genero_Peliculas (
    id_genero INT auto_increment PRIMARY KEY,
    genero VARCHAR(255)
);
-- Rellenar tabla Genero_Peliculas
insert into Genero_Peliculas (genero) values
	('Drama'),
	('Crime'),
	('Action'),
	('Sci-Fi'),
	('Romance');
-- Crear tabla Actores
 CREATE TABLE Actores (
    id_actor INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)
);
-- Rellenar tabla Actores
insert into actores (nombre) values
	('Tim Robbins'),
	('Marlon Brando'),
	('Christian Bale'),
	('Tom Hanks'),
	('John Travolta'),
	('Leonardo DiCaprio'),
	('Keanu Reeves'),
	('Sam Worthington'),
	('Russell Crowe'),
	('Morgan Freeman'),
	('Al Pacino'),
	('Heath Ledger'),
	('Robin Wright'),
	('Samuel L. Jackson'),
	('Joseph Gordon-Levitt'),
	('Kate Winslet'),
	('Laurence Fishburne'),
	('Zoe Saldana'),
	('Joaquin Phoenix');
-- Crear tabla Peliculas_Actores
CREATE TABLE Peliculas_Actores (
	id_pelicula INT,
    id_actor_principal INT,
    id_actor_secundario INT,
    foreign key (id_pelicula) references peliculas(id_pelicula),
    foreign key (id_actor_principal) references actores(id_actor),
    foreign key (id_actor_secundario) references actores(id_actor)
);
-- Rellenar tabla Peliculas_Actores
insert into Peliculas_Actores (id_pelicula,id_actor_principal,id_actor_secundario) values
	(1,1,10),
	(2,2,11),
	(3,3,12),
	(4,4,13),
	(5,5,14),
	(6,6,15),
	(7,6,16),
	(8,7,17),
	(9,8,18),
	(10,9,19);
-- Crear tabla Directores
 CREATE TABLE Directores (
    id_director INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)
);
-- Rellenar tabla Directores
insert into Directores(nombre) values
	('Frank Darabont'),
	('Francis Ford Coppola'),
	('Christopher Nolan'),
	('Robert Zemecki'),
	('Quentin Tarantino'),
	('James Cameron'),
	('The Wachowski'),
	('Ridley Scott'),
	('Russell Crowe');
-- Crear tabla Peliculas_DIrectores
CREATE TABLE Peliculas_Diretores (
	id_pelicula INT,
    id_director INT,
    foreign key (id_pelicula) references peliculas(id_pelicula),
    foreign key (id_director) references directores(id_director)  
);
-- Rellenar tabla Directores
insert into Peliculas_Diretores(id_pelicula,id_director) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,7),
	(10,9);
-- Eliminar columnas no deseadas de peliculas
ALTER TABLE peliculas DROP COLUMN director;
ALTER TABLE peliculas DROP COLUMN genero;
ALTER TABLE peliculas DROP COLUMN actor_principal;
ALTER TABLE peliculas DROP COLUMN actor_secundario;

-- Ejercicio 2
-- Crear tabla propietarios
 CREATE TABLE Propietarios (
    id_propietario INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255),
    direcion VARCHAR(255),
    telefono VARCHAR(255)
);
-- Rellenar tabla Propietarios
insert into propietarios (nombre,direcion,telefono)
	select propietario_nombre, propietario_direccion, propietario_telefono
	from coches ;
-- Crear tabla talleres
 CREATE TABLE Talleres (
    id_taller INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255),
    direcion VARCHAR(255)
);
-- Rellenar tabla Talleres
insert into Talleres (nombre,direcion)
	select taller_nombre,taller_direccion 
	from coches ;
-- Crear tabla Coches_propietarios
CREATE table Coches_propietarios (
	id_coche INT,
    id_propietario INT,
    foreign key (id_coche) references coches(id_coche),
    foreign key (id_propietario) references propietarios(id_propietario)  
);
-- Rellenar tabla Coches_propietarios
insert into coches_propietarios (id_coche ,id_propietario) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);
	-- Crear tabla Coches_talleres
CREATE table Coches_talleres (
	id_coche INT,
    id_taller INT,
    foreign key (id_coche) references coches(id_coche),
    foreign key (id_taller) references talleres(id_taller)  
);
-- Rellenar tabla Coches_propietarios
insert into Coches_talleres(id_coche ,id_taller) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);
-- Eliminar columnas no deseadas de coches
ALTER TABLE coches DROP COLUMN propietario_nombre;
ALTER TABLE coches DROP COLUMN propietario_direccion;
ALTER TABLE coches DROP COLUMN propietario_telefono;
ALTER TABLE coches DROP COLUMN taller_nombre;
ALTER TABLE coches DROP COLUMN taller_direccion;

-- Ejercicio 3
-- Crear tabla Entrenadores
CREATE TABLE Entrenadores (
    id_entrenador INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla Entrenadores
insert into Entrenadores (nombre)
	select entrenador
	from equiposfutbol ;
-- Crear tabla equipos_entrenadores
CREATE table equipos_entrenadores (
	id_equipo INT,
    id_entrenador INT,
    foreign key (id_equipo) references equiposfutbol(id_equipo),
    foreign key (id_entrenador) references entrenadores(id_entrenador)  
);
-- Rellenar tabla equipos_entrenadores
insert into equipos_entrenadores(id_equipo ,id_entrenador) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);
-- Crear tabla ciudades
CREATE TABLE ciudades (
    id_ciudad INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla ciudades
insert into ciudades(nombre)values
	('Madrid'),
	('Barcelona'),
	('Liverpool'),
	('Manchester'),
	('Turin'),
	('Múnich'),
	('Paris'),
	('Londres'),
	('Milan');

-- Crear tabla equipos_ciudad
CREATE table equipos_ciudad (
	id_equipo INT,
    id_ciudad INT,
    foreign key (id_equipo) references equiposfutbol(id_equipo),
    foreign key (id_ciudad) references ciudades(id_ciudad)  
);
-- Rellenar tabla equipos_entrenadores
insert into equipos_ciudad(id_equipo ,id_ciudad) values
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,1),
	(10,9);
-- Crear tabla jugadores
CREATE TABLE jugadores (
    id_jugador INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla jugadores
insert into jugadores(nombre)
	select jugador1 
	from equiposfutbol ;
insert into jugadores(nombre)
	select jugador2 
	from equiposfutbol ;
insert into jugadores(nombre)
	select jugador3 
	from equiposfutbol ;
-- Crear tabla equipos_jugador
CREATE table equipos_jugador (
	id_equipo INT,
    id_jugador1 INT,
    id_jugador2 INT,
    id_jugador3 INT,
    foreign key (id_equipo) references equiposfutbol(id_equipo),
    foreign key (id_jugador1) references jugadores(id_jugador),
    foreign key (id_jugador2) references jugadores(id_jugador),
    foreign key (id_jugador3) references jugadores(id_jugador)
);
-- Rellenar tabla equipos_jugador
insert into equipos_jugador(id_equipo ,id_jugador1,id_jugador2,id_jugador3) values
	(1,1,16,31),
	(2,2,17,32),
	(3,3,18,33),
	(4,4,19,34),
	(5,5,20,35),
	(6,6,21,36),
	(7,7,22,37),
	(8,8,23,38),
	(9,9,24,39),
	(10,10,25,40);
-- Eliminar columnas no deseadas de equiposfutbol
ALTER TABLE equiposfutbol DROP COLUMN entrenador;
ALTER TABLE equiposfutbol DROP COLUMN ciudad;
ALTER TABLE equiposfutbol DROP COLUMN jugador1;
ALTER TABLE equiposfutbol DROP COLUMN jugador2;
ALTER TABLE equiposfutbol DROP COLUMN jugador3;

-- Ejercicio 4
-- Crear tabla Artistas
CREATE TABLE Artistas (
    id_artista INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla artistas
insert into artistas(nombre)values
	('Queen'),
	('Ed Sheeran'),
	('Adele'),
	('Luis Fonsi'),
	('Michael Jackson'),
	('Eagles'),
	('Led Zeppelin');
-- Crear tabla canciones_artistas
CREATE table canciones_artistas (
	id_cancion INT,
    id_artista INT,
    foreign key (id_cancion) references canciones(id_cancion),
    foreign key (id_artista) references artistas(id_artista)  
);
-- Rellenar tabla canciones_artistas
insert into canciones_artistas(id_cancion,id_artista)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,2),
(9,2),
(10,5);
-- Crear tabla albums
CREATE TABLE Albums (
    id_album INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla Albums
insert into albums (nombre)
	select album
	from canciones ;
-- Crear tabla canciones_albums
CREATE table canciones_albums (
	id_cancion INT,
    id_album INT,
    foreign key (id_cancion) references canciones(id_cancion),
    foreign key (id_album) references albums(id_album)  
);
-- Rellenar tabla canciones_albums
insert into canciones_albums(id_cancion,id_album)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- Crear tabla generos_Musica
CREATE TABLE generos_Musica (
    id_genero INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla generos_musica
insert  into generos_musica(nombre) values
('Rock'),
('Pop');
-- Crear tabla canciones_generos_musica
CREATE table canciones_generos_musica (
	id_cancion INT,
    id_genero INT,
    foreign key (id_cancion) references canciones(id_cancion),
    foreign key (id_genero) references generos_Musica(id_genero)  
);
-- Rellenar tabla canciones_generos_musica
insert  into canciones_generos_musica(id_cancion,id_genero)values
(1,1),
(2,2),
(3,2),
(4,2),
(5,2),
(6,1),
(7,1),
(8,2),
(9,2),
(10,2);
-- Crear tabla compositores
CREATE TABLE Compositores (
    id_compositor INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla compositores
insert into compositores (nombre)
	select compositor 
	from canciones ;
-- Crear tabla canciones_compositores
CREATE table canciones_compositores (
	id_cancion INT,
    id_compositor INT,
    foreign key (id_cancion) references canciones(id_cancion),
    foreign key (id_compositor) references compositores(id_compositor)  
    
);
-- Rellenar tabla canciones_compositores
insert  into canciones_compositores(id_cancion,id_compositor)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- Eliminar columnas no deseadas de canciones
ALTER TABLE canciones DROP COLUMN artista;
ALTER TABLE canciones DROP COLUMN album;
ALTER TABLE canciones DROP COLUMN genero;
ALTER TABLE canciones DROP COLUMN compositor;

-- Ejercicio 5

-- Crear tabla especies
CREATE TABLE especies (
    id_especie INT auto_increment PRIMARY KEY,
    nombre VARCHAR(255)  
);
-- Rellenar tabla especies
insert  into especies(nombre) values
('Perro'),
('Gato');
-- Crear tabla animales_especie
CREATE table animales_especie (
	id_animal INT,
    id_especie INT,
    foreign key (id_animal) references animales(id_animal),
    foreign key (id_especie) references especies(id_especie)  
    
);
-- Rellenar tabla animales_especie
insert  into animales_especie(id_animal,id_especie)values
(1,1),
(2,2),
(3,1),
(4,2),
(5,1),
(6,2),
(7,1),
(8,2),
(9,1),
(10,2);

-- crear tabla propietarios
create table propietarios_animales(
	id_propietario INT auto_increment PRIMARY KEY,
	nombre VARCHAR(255), 
	direccion VARCHAR(255)  
); 
-- Rellenar tabla propietarios_animales
insert into propietarios_animales (nombre,direccion)
	select propietario_nombre,propietario_direccion 
	from animales ;
-- Crear tabla animales_propietario
CREATE table animales_propietario (
	id_animal INT,
    id_propietario INT,
    foreign key (id_animal) references animales(id_animal),
    foreign key (id_propietario) references propietarios_animales(id_propietario)  
    
);

-- Rellenar tabla animales_propietario
insert  into animales_propietario(id_animal,id_propietario)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- crear tabla veterinarios
create table veterinarios(
	id_veterinario INT auto_increment PRIMARY KEY,
	nombre VARCHAR(255), 
	direccion VARCHAR(255)  
); 
-- Rellenar tabla veterinarios
insert into veterinarios (nombre,direccion)
	select veterinario_nombre,veterinario_direccion 
	from animales ;
-- Crear tabla animales_propietario
CREATE table animales_veterinario (
	id_animal INT,
    id_veterinario INT,
    foreign key (id_animal) references animales(id_animal),
    foreign key (id_veterinario) references veterinarios(id_veterinario)  
    
);

-- Rellenar tabla animales_veterinario
insert  into animales_veterinario(id_animal,id_veterinario)values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
-- Eliminar columnas no deseadas de animales
ALTER TABLE animales DROP COLUMN especie;
ALTER TABLE animales DROP COLUMN propietario_nombre;
ALTER TABLE animales DROP COLUMN propietario_direccion;
ALTER table animales DROP COLUMN veterinario_nombre;
ALTER table animales DROP COLUMN veterinario_direccion;
