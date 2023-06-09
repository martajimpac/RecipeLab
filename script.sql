# BASE DE DATOS RECIPELAB
CREATE DATABASE IF NOT EXISTS recipelab;
USE recipelab;

# Eliminar las tablas si ya existian
DROP TABLE IF EXISTS seguidorDe;
DROP TABLE IF EXISTS valoracion;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS detallesLista;
DROP TABLE IF EXISTS listaRecetas;
DROP TABLE IF EXISTS pasosReceta;
DROP TABLE IF EXISTS detallesReceta;
DROP TABLE IF EXISTS ingrediente;
DROP TABLE IF EXISTS receta;
DROP TABLE IF EXISTS usuario;

# Creacion de las tablas  
CREATE TABLE usuario (
  nombreUsuario varchar(45),
  contraseña varchar(45),
  email varchar(45) unique,
  rolUsuario enum('administrador', 'publicador'),
  avatar LONGBLOB,                                            
  esPrivado boolean default 0,
  valoracion double,
  codigoRecuperacion varchar(6),
  PRIMARY KEY (email)    
);

CREATE TABLE receta (
  id integer not null AUTO_INCREMENT,
  # id varchar(45),
  emailUsuario varchar(45),
  nombre varchar(45),
  numPersonas int,
  dificultadReceta enum('facil', 'media', 'dificil'),
  duracionEnSec int,
  valoracionMedia double,
  comentariosActivados boolean default 1,
  precio double,
  imagenReceta LONGBLOB,                                                                                
  categoria enum ('desayuno', 'comida', 'cena', 'snack', 'postre'),
  fechaPublicacion date,
  PRIMARY KEY (id),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE seguidorDe (
  email varchar(45),
  emailUsuario varchar(45),
  PRIMARY KEY (email, emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE valoracion (
  puntuacion int,
  emailUsuario varchar(45),
  PRIMARY KEY (puntuacion, emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE comentario (
  emailUsuario varchar(45),
  idReceta int,
  valoracion int,
  texto varchar(300),
  leido boolean default 0,
  fechaComentario date,
  respuesta varchar(300),
  PRIMARY KEY (fechaComentario, idReceta, emailUsuario),
  FOREIGN KEY (idReceta) REFERENCES receta(id),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE listaRecetas (
  nombre varchar(45),
  emailUsuario varchar(45),
  fechaCreacion date,
  fechaModificacion date,
  descripcion varchar(200),
  imagenLista LONGBLOB,                                            
  PRIMARY KEY (nombre, emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE detallesLista (
  nombreLista varchar(45),
  idReceta int,
  PRIMARY KEY (nombreLista, idReceta),
  FOREIGN KEY (nombreLista) REFERENCES listaRecetas(nombre),
  FOREIGN KEY (idReceta) REFERENCES receta(id)
);

CREATE TABLE pasosReceta (
  idReceta int,
  numeroPaso int,
  descripcion varchar(500),
  PRIMARY KEY (numeroPaso, idReceta),
  FOREIGN KEY (idReceta) REFERENCES receta(id)
);

CREATE TABLE ingrediente (
  nombre varchar(45),
  disponibilidad boolean default 1,
  precio double,
  PRIMARY KEY (nombre)
);
  

CREATE TABLE detallesReceta (
  idReceta int,
  nombreIngrediente varchar(45),
  cantidad  varchar(15),
  opcionalidad boolean default 1,
  PRIMARY KEY (nombreIngrediente, idReceta),
  FOREIGN KEY (idReceta) REFERENCES receta(id),
  FOREIGN KEY (nombreIngrediente) REFERENCES ingrediente(nombre)
);

  

# Insertar tuplas

# usuario 
INSERT INTO usuario VALUES
('usuario1', 'contrasena1', 'usuario1@example.com', 'publicador',LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\avatar1.jpg'), false, 4.5, null),
('usuario2', 'contrasena2', 'usuario2@example.com', 'publicador', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\avatar2.jpg'), true, 3.8, null),
('usuario3', 'contrasena3', 'usuario3@example.com', 'publicador', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\avatar3.jpg'), true, 3.3, null);

# receta
INSERT INTO receta VALUES
(1, 'usuario1@example.com', 'Tarta de manzana', 8, 'media', 3600, 4.2, true, 12.50, LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\receta1.jpg'), 'postre', '2023-01-21'),
(2, 'usuario2@example.com', 'Lasaña de verduras', 4, 'dificil', 4800, 5, false, 18.75, LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\receta2.jpg'), 'comida', '2023-03-20'),
(3, 'usuario3@example.com', 'Tarta de Chocolate', 8, 'media', 3600, 4.8, true, 19.99, LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\receta3.jpg'), 'postre', '2023-05-21');

# seguidorDe
INSERT INTO seguidorDe VALUES
('usuario1@example.com', 'usuario2@example.com'),
('usuario1@example.com', 'usuario3@example.com'),
('usuario2@example.com', 'usuario1@example.com');

# valoracion
INSERT INTO valoracion VALUES
(4, 'usuario1@example.com'),
(5, 'usuario2@example.com');

# comentario
INSERT INTO comentario VALUES
('usuario1@example.com', 1, 4, '¡Muy buena receta!', true, '2023-04-16', 'Gracias por tu comentario!'),
('usuario2@example.com', 1, 5, 'Increíble receta, ¡muchas gracias por compartirla!', false, '2023-04-15', '');

# listaRecetas
INSERT INTO listaRecetas VALUES  
('Mis recetas favoritas', 'usuario1@example.com', '2023-04-15', '2023-04-16', 'Lista en la que guardo mis recetas favoritas', LOAD_FILE('C:\Users\juani\Desktop\UNI\3ano\SSW\prueba\RecipeLab\src\main\webapp\images\DB\lista1.jpg'));

# detallesLista
INSERT INTO detallesLista VALUES
('Mis recetas favoritas', '1'),
('Mis recetas favoritas', '2');


# pasosReceta
INSERT INTO pasosReceta VALUES
('1', 1, 'Pelar y cortar las manzanas en rodajas finas.'),
('1', 2, 'Colocar las rodajas de manzana en una fuente para horno previamente forrada con masa quebrada.'),
('1', 3, 'Mezclar en un bol la harina, el azúcar, la canela y la mantequilla hasta que quede una masa homogénea.'),
('1', 4, 'Desmenuzar la masa sobre las manzanas y hornear a 180 grados durante 45 minutos.'),
('2', 1, 'Cocer las láminas de lasaña en agua hirviendo durante 10 minutos.'),
('2', 2, 'Pelar y cortar en juliana fina las verduras elegidas (por ejemplo, calabacín, berenjena, pimiento rojo, cebolla y champiñones).'),
('2', 3, 'Saltear las verduras en una sartén con aceite de oliva hasta que estén tiernas.'),
('2', 4, 'Preparar la bechamel con leche, harina y mantequilla y añadirle queso rallado.'),
('2', 5, 'Montar la lasaña intercalando capas de láminas de lasaña, verduras y bechamel.'),
('2', 6, 'Hornear la lasaña a 200 grados durante 30 minutos.'),
('3', 1, 'Precalienta el horno a 180°C.'),
('3', 2, 'Derrite el chocolate y la mantequilla en el microondas.'),
('3', 3, 'En un bol, mezcla los huevos y el azúcar.'),
('3', 4, 'Añade la harina y la mezcla de chocolate derretido, y mezcla bien.'),
('3', 5, 'Vierte la mezcla en un molde para tarta previamente engrasado.'),
('3', 6, 'Hornea durante 30-35 minutos o hasta que esté firme.'),
('3', 7, 'Deja enfriar antes de servir.');


# ingrediente
INSERT INTO ingrediente VALUES
('manzanas', true, 0.75),
('harina', true, 0.15),
('azúcar', true, 0.12),
('mantequilla', true, 0.25),
('masa quebrada', false, 1.50),
('láminas de lasaña', true, 2.00),
('calabacín', false, 1.50),
('berenjena', true, 1.00),
('pimiento rojo', true, 0.75),
('cebolla', true, 0.25),
('champiñones', true, 1.00),
('leche', true, 0.40),
('queso rallado', true, 0.75),
('Chocolate', true, 3.99), 
('Huevos', true, 2.49);


# detallesReceta
INSERT INTO detallesReceta VALUES
('1', 'manzanas', '8', false),
('1', 'harina', '200 gr', false),
('1', 'azúcar', '150 gr', false),
('1', 'mantequilla', '100 gr', false),
('1', 'masa quebrada', '1', false),
('2', 'láminas de lasaña', '12', false),
('2', 'calabacín', '2', false),
('2', 'berenjena', '1', false),
('2', 'pimiento rojo', '1', false),
('2', 'cebolla', '1', true),
('2', 'champiñones', '200 gr', false),
('2', 'leche', '500 ml', false),
('2', 'harina', '50 gr', false),
('2', 'mantequilla', '50 gr', false),
('2', 'queso rallado', '100 gr', false),
('3', 'Chocolate', '200g', false),
('3', 'mantequilla', '150g', true),
('3', 'Huevos', '4 unidades', false),
('3', 'azúcar', '200g', false),
('3', 'harina', '150g', false);