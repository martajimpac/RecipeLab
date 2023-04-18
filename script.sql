### BASE DE DATOS RECIPELAB
CREATE DATABASE  IF NOT EXISTS recipelab;
USE recipelab;

### Eliminar las tablas si ya existian
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS seguidorDe;
DROP TABLE IF EXISTS valoracion;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS listaRecetas;
DROP TABLE IF EXISTS detallesLista;
DROP TABLE IF EXISTS receta;
DROP TABLE IF EXISTS pasosReceta;
DROP TABLE IF EXISTS detallesReceta;
DROP TABLE IF EXISTS ingrediente;

### Creacion de las tablas  
CREATE TABLE usuario (
  nombreUsuario varchar(45),
  contraseña varchar(45),
  email varchar(45),
  rolUsuario  enum('administrador', 'publicador'),
  avatar blob,
  esPrivado boolean default 0,
  valoracion double(1,1),
  PRIMARY KEY (email)    
);

CREATE TABLE receta (
  id varchar(45),
  emailUsuario varchar(45),
  nombre varchar(45),
  numPersonas int,
  dificultadReceta enum('facil', 'media', 'dificil'),
  duracionEnSec int,
  valoracionMedia int,
  comentariosActivados boolean default 1,
  precio double,
  imagenReceta blob,                                              
  categoria enum ('desayuno', 'comida', 'cena', 'snack', 'postre'),
  PRIMARY KEY (id),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE seguidorDe (
  email varchar(45),
  emailUsuario varchar(45),
  PRIMARY KEY (email,emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE valoracion (
  puntuacion int,
  emailUsuario varchar(45),
  PRIMARY KEY (puntuacion,emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE comentario (
  emailUsuario varchar(45),
  idReceta varchar(45),
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
  imagenLista blob,
  PRIMARY KEY (nombre, emailUsuario),
  FOREIGN KEY (emailUsuario) REFERENCES usuario(email)
);

CREATE TABLE detallesLista (
  nombreLista varchar(45),
  idReceta varchar(45),
  PRIMARY KEY (nombreLista, idReceta),
  FOREIGN KEY (nombreLista) REFERENCES listaRecetas(nombre),
  FOREIGN KEY (idReceta) REFERENCES receta(id)
);

CREATE TABLE pasosReceta (
  idReceta varchar(45),
  numeroPaso int,
  descripcion varchar(500),
  PRIMARY KEY (numeroPaso, idReceta),
  FOREIGN KEY (idReceta) REFERENCES receta(id)
);

CREATE TABLE ingrediente (
  nombre varchar(45),
  disponibilidad boolean default 1,
  precio double(4,2),
  PRIMARY KEY (nombre)
);
  

CREATE TABLE detallesReceta (
  idReceta varchar(45),
  nombreIngrediente varchar(45),
  cantidad  varchar(15),
  opcionalidad boolean default 1,
  PRIMARY KEY (nombreIngrediente, idReceta),
  FOREIGN KEY (idReceta) REFERENCES receta(id),
  FOREIGN KEY (nombreIngrediente) REFERENCES ingrediente(nombre)
);

  

### Insertar tuplas

### usuario
INSERT INTO usuario VALUES
('usuario1', 'contraseña1', 'usuario1@example.com', 'publicador', LOAD_FILE('C:\Users\marta\Documents\SSW\ENTREGAS\ENTREGA 3\fotosBD\avatar1.jpg'), false, 4.5),
('usuario2', 'contraseña2', 'usuario2@example.com', 'administrador', LOAD_FILE('C:\Users\marta\Documents\SSW\ENTREGAS\ENTREGA 3\fotosBD\avatar2.jpg'), true, 3.8);

### seguidorDe
INSERT INTO seguidorDe VALUES
('usuario1@example.com', 'usuario2@example.com'),
('usuario2@example.com', 'usuario1@example.com');

### valoracion
INSERT INTO valoracion VALUES
(4, 'usuario1@example.com'),
(5, 'usuario2@example.com');

### comentario
INSERT INTO comentario VALUES
('usuario1@example.com', 'receta1', 4, '¡Muy buena receta!', false, '2023-04-16', NULL),
('usuario2@example.com', 'receta1', 5, 'Increíble receta, ¡muchas gracias por compartirla!', false, '2023-04-15', '¡Gracias por tu comentario!');

### listaRecetas
INSERT INTO listaRecetas VALUES
('Mis recetas favoritas', 'usuario1@example.com', '2023-04-15', '2023-04-16', 'Lista en la que guardo mis recetas favoritas', LOAD_FILE('C:\Users\marta\Documents\SSW\ENTREGAS\ENTREGA 3\fotosBD\receta1.jpg'));

### detallesLista
INSERT INTO receta VALUES
('Mis recetas favoritas', '1'),
('Mis recetas favoritas', '2');

### receta
INSERT INTO receta VALUES
('1', 'usuario1@example.com', 'Tarta de manzana', '8', 'media', '3600', '4', '1', '12.50', LOAD_FILE('C:\Users\marta\Documents\SSW\ENTREGAS\ENTREGA 3\fotosBD\receta1.jpg'), 'postre'),
('2', 'usuario2@example.com', 'Lasaña de verduras', '4', 'dificil', '4800', '5', '1', '18.75', LOAD_FILE('C:\Users\marta\Documents\SSW\ENTREGAS\ENTREGA 3\fotosBD\receta2.jpg'), 'comida');

# pasosReceta
INSERT INTO pasosReceta VALUES
('1', '1', 'Pelar y cortar las manzanas en rodajas finas.'),
('1', '2', 'Colocar las rodajas de manzana en una fuente para horno previamente forrada con masa quebrada.'),
('1', '3', 'Mezclar en un bol la harina, el azúcar, la canela y la mantequilla hasta que quede una masa homogénea.'),
('1', '4', 'Desmenuzar la masa sobre las manzanas y hornear a 180 grados durante 45 minutos.'),
('2', '1', 'Cocer las láminas de lasaña en agua hirviendo durante 10 minutos.'),
('2', '2', 'Pelar y cortar en juliana fina las verduras elegidas (por ejemplo, calabacín, berenjena, pimiento rojo, cebolla y champiñones).'),
('2', '3', 'Saltear las verduras en una sartén con aceite de oliva hasta que estén tiernas.'),
('2', '4', 'Preparar la bechamel con leche, harina y mantequilla y añadirle queso rallado.'),
('2', '5', 'Montar la lasaña intercalando capas de láminas de lasaña, verduras y bechamel.'),
('2', '6', 'Hornear la lasaña a 200 grados durante 30 minutos.');

#detallesReceta
INSERT INTO detallesReceta VALUES
('1', 'manzanas', '8', '0'),
('1', 'harina', '200 gr', '0'),
('1', 'azúcar', '150 gr', '0'),
('1', 'mantequilla', '100 gr', '0'),
('1', 'masa quebrada', '1', '0'),
('2', 'láminas de lasaña', '12', '0'),
('2', 'calabacín', '2', '0'),
('2', 'berenjena', '1', '0'),
('2', 'pimiento rojo', '1', '0'),
('2', 'cebolla', '1', '1'),
('2', 'champiñones', '200 gr', '0'),
('2', 'leche', '500 ml', '0'),
('2', 'harina', '50 gr', '0'),
('2', 'mantequilla', '50 gr', '0'),
('2', 'queso rallado', '100 gr', '0');

#ingrediente
INSERT INTO ingrediente VALUES
('manzanas', 1, 0.75),
('harina', 1, 0.15),
('azúcar', 1, 0.12),
('mantequilla', 1, 0.25),
('masa quebrada', 1, 1.50),
('láminas de lasaña', 1, 2.00),
('calabacín', 1, 1.50),
('berenjena', 1, 1.00),
('pimiento rojo', 1, 0.75),
('cebolla', 1, 0.25),
('champiñones', 1, 1.00),
('leche', 1, 0.40),
('queso rallado', 1, 0.75);
