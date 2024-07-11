-- Drop de la base de datos Peliculas_complejo si existe
DROP DATABASE IF EXISTS Peliculas_complejo;

-- Creación de la base de datos Peliculas_complejo
CREATE DATABASE Peliculas_complejo;
use Peliculas_complejo;

-- Crear tabla Directores
CREATE TABLE Directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla Actores
CREATE TABLE Actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla generos
CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla peliculas
CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    id_director INT,
    id_genero INT NOT NULL,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director),
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero)
);


-- Crear tabla peliculasActores
CREATE TABLE PeliculasActores (
    id_pelicula INT,
    id_actor_principal INT,
    id_actor_secundario INT,
    PRIMARY KEY (id_pelicula, id_actor_principal),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor_principal) REFERENCES Actores(id_actor),
    FOREIGN KEY (id_actor_secundario) REFERENCES Actores(id_actor)
);

-- Rellenar directores
INSERT INTO Directores (nombre) VALUES
('George Lucas'),
('Francis Ford Coppola'),
('Quentin Tarantino'),
('Christopher Nolan'),
('Robert Zemeckis'),
('Peter Jackson'),
('The Wachowskis'),
('James Cameron'),
('Jonathan Demme'),
('Ridley Scott'),
('Joel Coen'),
('Steven Spielberg'),
('Ivan Reitman'),
('Stanley Kubrick'),
('David Fincher'),
('Frank Darabont'),
('Darren Aronofsky'),
('Bong Joon-ho'),
('Hayao Miyazaki'),
('Jean-Pierre Jeunet'),
('Charles Chaplin'),
('Brad Bird'),
('John Lasseter'),
('Roger Allers'),
('Andrew Adamson'),
('Pete Docter'),
('Andrew Stanton');

-- Rellenar actores
INSERT INTO Actores (nombre) VALUES
('Mark Hamill'),
('Harrison Ford'),
('Marlon Brando'),
('Al Pacino'),
('John Travolta'),
('Samuel L. Jackson'),
('Christian Bale'),
('Heath Ledger'),
('Tom Hanks'),
('Robin Wright'),
('Elijah Wood'),
('Ian McKellen'),
('Keanu Reeves'),
('Laurence Fishburne'),
('Michael J. Fox'),
('Christopher Lloyd'),
('Leonardo DiCaprio'),
('Kate Winslet'),
('Jodie Foster'),
('Anthony Hopkins'),
('Russell Crowe'),
('Joaquin Phoenix'),
('Jeff Bridges'),
('John Goodman'),
('Sam Neill'),
('Jeff Goldblum'),
('Liam Neeson'),
('Ralph Fiennes'),
('Bill Murray'),
('Dan Aykroyd'),
('Arnold Schwarzenegger'),
('Linda Hamilton'),
('Sigourney Weaver'),
('Tom Skerritt'),
('Sean Connery'),
('Henry Thomas'),
('Drew Barrymore'),
('Jack Nicholson'),
('Shelley Duvall'),
('Rutger Hauer'),
('Martin Sheen'),
('Sylvester Stallone'),
('Talia Shire'),
('Malcolm McDowell'),
('Patrick Magee'),
('Edward Norton'),
('Brad Pitt'),
('Bruce Willis'),
('Haley Joel Osment'),
('Orson Welles'),
('Joseph Cotten'),
('Michael Clarke Duncan'),
('Adrien Brody'),
('Thomas Kretschmann'),
('Natalie Portman'),
('Mila Kunis'),
('Kang-ho Song'),
('Sun-kyun Lee'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Jamie Foxx'),
('Christoph Waltz'),
('Roberto Benigni'),
('Nicoletta Braschi'),
('Rumi Hiiragi'),
('Miyu Irino'),
('Audrey Tautou'),
('Mathieu Kassovitz'),
('Craig T. Nelson'),
('Holly Hunter'),
('Tom Hanks'),
('Tim Allen'),
('Matthew Broderick'),
('Jeremy Irons'),
('Mike Myers'),
('Eddie Murphy'),
('Albert Brooks'),
('Ellen DeGeneres'),
('John Goodman'),
('Billy Crystal'),
('Ed Asner'),
('Christopher Plummer'),
('Ben Burtt'),
('Elissa Knight'),
('Patton Oswalt'),
('Ian Holm');
-- Rellenar generos
INSERT INTO Generos (nombre) VALUES
('Ciencia ficción'),
('Crimen'),
('Acción'),
('Drama'),
('Fantasía'),
('Romance'),
('Thriller'),
('Comedia'),
('Aventura'),
('Terror'),
('Guerra'),
('Deportes'),
('Animación'),
('Western');

-- Rellenar peliculas
INSERT INTO Peliculas (titulo, anio, id_director, id_genero) VALUES
('La guerra de las galaxias', 1977, 1, 1),
('El Padrino', 1972, 2, 2),
('Pulp Fiction', 1994, 3, 2),
('El caballero oscuro', 2008, 4, 3),
('Forrest Gump', 1994, 5, 4),
('El señor de los anillos: La comunidad del anillo', 2001, 6, 5),
('Matrix', 1999, 7, 1),
('Regreso al futuro', 1985, 5, 1),
('Titanic', 1997, 8, 6),
('El silencio de los corderos', 1991, 9, 7),
('Gladiator', 2000, 10, 3),
('El gran Lebowski', 1998, 11, 8),
('Jurassic Park', 1993, 12, 1),
('La lista de Schindler', 1993, 12, 4),
('Los cazafantasmas', 1984, 13, 8),
('Terminator 2: El juicio final', 1991, 8, 3),
('Alien, el octavo pasajero', 1979, 10, 1),
('Indiana Jones y la última cruzada', 1989, 12, 9),
('E.T., el extraterrestre', 1982, 12, 1),
('El resplandor', 1980, 14, 10),
('Blade Runner', 1982, 10, 1),
('Apocalypse Now', 1979, 2, 11),
('Rocky', 1976, 15, 12),
('La naranja mecánica', 1971, 14, 2),
('Atrapado sin salida', 1975, 16, 4),
('El club de la lucha', 1999, 14, 4),
('El sexto sentido', 1999, 17, 7),
('Ciudadano Kane', 1941, 18, 4),
('La milla verde', 1999, 16, 4),
('El Pianista', 2002, 19, 4),
('Cisne negro', 2010, 20, 7),
('Parásitos', 2019, 21, 4),
('Interstellar', 2014, 4, 1),
('Django desencadenado', 2012, 3, 13),
('La vida es bella', 1997, 22, 4),
('El viaje de Chihiro', 2001, 23, 13),
('Amélie', 2001, 24, 8),
('El gran dictador', 1940, 25, 8),
('Inception', 2010, 4, 1),
('Los Increíbles', 2004, 26, 13),
('Toy Story', 1995, 27, 13),
('El Rey León', 1994, 24, 13),
('Shrek', 2001, 24, 13),  -- Cambiado a un id_director válido
('Buscando a Nemo', 2003, 24, 13),  -- Cambiado a un id_director válido
('Monstruos, S.A.', 2001, 26, 13),
('Up', 2009, 26, 13),
('WALL·E', 2008, 27, 13),
('Ratatouille', 2007, 26, 13);



-- Insertar datos en la tabla PeliculasActores
INSERT INTO PeliculasActores (id_pelicula, id_actor_principal, id_actor_secundario)
VALUES
(1, 1, 3),
(1, 2, 5),
(2, 3, 7),
(2, 4, 40),
(3, 5, 54),
(3, 6, 33),
(4, 7, 22),
(4, 8, 31),
(5, 9, 21),
(5, 10,6),
(6, 11, 42),
(6, 12, 43),
(7, 13, 42),
(7, 14, 41),
(8, 15, 12),
(8, 16,13),
(9, 17, 14),
(9, 18, 15),
(10, 19, 16),
(10, 20, 19),
(11, 21, 20),
(11, 22, 23),
(12, 23, 24),
(12, 24, 25),
(13, 25, 27),
(13, 26, 28),
(14, 27,29),
(14, 28, 32),
(15, 29, 33),
(15, 30, 34),
(16, 31, 35),
(16, 32, 36),
(17, 33,37),
(17, 34, 38),
(18, 35, 39),
(18, 36, 40),
(19, 37, 41),
(19, 38, 41),
(20, 39, 42),
(20, 40, 43),
(21, 41, 44),
(21, 42, 45),
(22, 43, 46),
(22, 44,47),
(23, 45, 8),
(23, 46, 7),
(24, 47, 50),
(24, 48, 49),
(25, 49, 52),
(25, 50, 52),
(26, 51, 50),
(26, 52, 37),
(27, 53, 38),
(27, 54, 52),
(28, 55, 53),
(28, 56, 54),
(29, 57, 55),
(29, 58, 57),
(30, 59, 58),
(30, 60, 36),
(31, 61, 60),
(31, 62, 69),
(32, 63, 27),
(32, 64, 28),
(33, 65, 29),
(33, 66, 61),
(34, 67, 62),
(34, 68, 63),
(35, 69, 64),
(35, 70, 65),
(36, 71, 66),
(36, 72, 67),
(37, 73, 68),
(37, 74, 69),
(38, 75, 54),
(38, 76, 70),
(39, 77, 71),
(39, 78, 72),
(40, 79, 73),
(40, 80, 74),
(41, 81, 75),
(41, 82, 76),
(42, 83, 77),
(42, 84, 78),
(43, 85,79),
(43, 86, 9);

-- Consultas de peliculas_complejo

-- Consulta 1: Una consulta que devuelva todas las películas.
select *
from peliculas;

-- Consulta 2: Una consulta que devuelva las películas entre el 1980 y 2000 (usa el código del ejercicio anterior!)
select *
	from peliculas
	where anio between 1980 and 2000;

-- Consulta 3: Una consulta que devuelva la cantidad de películas de un género bajo el nombre de "num_peliculas" (Recuerda usar la palabra clave "AS")
select count(*) as num_peliculas
from peliculas p
join generos g on p.id_genero = g.id_genero  
where g.nombre= "Drama";

-- Consulta 4: Una consulta que devuelva todas las películas con sus actores principales y secundarios (deberían ser 3 tablas distintas)
SELECT 
    p.titulo AS titulo_pelicula,
    p.anio AS año,
    d.nombre AS nombre_director,
    gp.nombre AS genero,
    a1.nombre AS actor_principal,
    a2.nombre AS actor_secundario
FROM Peliculas p
JOIN Directores d ON p.id_director = d.id_director
JOIN Generos gp ON p.id_genero = gp.id_genero
JOIN PeliculasActores pa ON p.id_pelicula = pa.id_pelicula
JOIN Actores a1 ON pa.id_actor_principal = a1.id_actor
JOIN Actores a2 ON pa.id_actor_secundario = a2.id_actor;

-- Consulta 5: Una consulta que seleccione todas las películas que tengan un actor específico (Por ejemplo: Tom Hanks)
select *
from peliculas p 
JOIN PeliculasActores pa ON p.id_pelicula = pa.id_pelicula
JOIN Actores a1 ON pa.id_actor_principal = a1.id_actor
JOIN Actores a2 ON pa.id_actor_secundario = a2.id_actor
where a1.nombre = 'Leonardo DiCaprio' or a2.nombre = 'Leonardo DiCaprio';

-- Consulta 6: Inserta datos en varias tablas a la vez usando START TRANSACTION y COMMIT. Recuerda usar también SET @variable
START TRANSACTION;

INSERT INTO Directores (nombre) VALUES ('Carlos Sanahuja');
SET @id_director = LAST_INSERT_ID();

INSERT INTO Peliculas (titulo, anio, id_director, id_genero) 
SELECT 'Sql y la madre que lo parió', 2024, @id_director, id_genero
FROM Generos
WHERE nombre = 'Drama';

COMMIT;
