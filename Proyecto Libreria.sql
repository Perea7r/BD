DROP SCHEMA IF EXISTS libreria;
DROP USER IF EXISTS 'CRUD'@'localhost';
CREATE DATABASE libreria;
CREATE USER 'CRUD'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, DELETE, UPDATE ON libreria.* TO 'CRUD'@'localhost';

CREATE TABLE libreria.genero (
    IDgenero INT NOT NULL AUTO_INCREMENT,
    CODGenero CHAR(3) NOT NULL,
    NombreGenero VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDgenero)
);

INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (1, 'FIC', 'FICCIÓN');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (2, 'FAN', 'FANTASÍA');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (3, 'HOR', 'HORROR');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (4, 'ROM', 'ROMANCE');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (5, 'SUS', 'SUSPENSO');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (6, 'TEL', 'TELENOVELA');
INSERT INTO libreria.genero (IDgenero, CODGenero, NombreGenero) VALUES (7, 'TRA', 'TRAGEDIA');


CREATE TABLE libreria.autor (
    IDautor INT NOT NULL AUTO_INCREMENT,
    NombreAutor VARCHAR(255) NOT NULL,
    ApellidoAutor VARCHAR(255) NOT NULL,
    Biografia VARCHAR(700) NOT NULL,
    AnnoNacimiento DATE NOT NULL,
    AnnoFallecimiento DATE DEFAULT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDautor)
);

INSERT INTO libreria.autor (NombreAutor, ApellidoAutor, Biografia, AnnoNacimiento, AnnoFallecimiento, Ciudad) VALUES ('J.K.', 'Rowling', 'J.K. Rowling es una autora de literatura británica. Fue escritora de novelas y novelas de terror, y de novelas de ficción. Ha publicado más de cien libros, y ha sido nominada a la Academia Británica de la Literatura por la categoría de la literatura de fantasía.', '1965-07-31', NULL , 'Londres');

INSERT INTO libreria.autor (NombreAutor, ApellidoAutor, Biografia, AnnoNacimiento, AnnoFallecimiento, Ciudad) VALUES ('J.R.R.', 'Tolkien', 'J.R.R. Tolkien es un escritor británico. Fue uno de los primeros autores de la literatura de fantasía. Fue considerado uno de los autores más importantes de la literatura de fantasía. Fue uno de los autores de la literatura más influyente de la historia de la literatura.', '1892-01-03', '1973-09-02' , 'Londres');

INSERT INTO libreria.autor(NombreAutor, ApellidoAutor, Biografia, AnnoNacimiento, AnnoFallecimiento, Ciudad) VALUES ('Stephen', 'King', 'Stephen Edwin King es un escritor estadounidensede novelas de terror, ficción sobrenatural, misterio, ciencia ficción y literatura fantástica. Sus libros han vendido más de 350 millones de ejemplares y en su mayoría han sido adaptados al cine y a la televisión. Ha publicado 61 novelas (siete de ellas, bajo el pseudónimo Richard Bachman) y siete libros de no ficción. Ha escrito, además, alrededor de doscientos relatos y novelas cortas, la mayoría de los cuales han sido recogidos en once colecciones.', '1947-09-21', NULL, 'Nueva York');

INSERT INTO libreria.autor(NombreAutor, ApellidoAutor, Biografia, AnnoNacimiento, AnnoFallecimiento, Ciudad) VALUES ('H.P', 'LOVECRAFT', 'H.P. Lovecraft es un escritor estadounidense. autor de relatos y novelas de terror y ciencia ficción. Se le considera un gran innovador del cuento de terror, al que aportó una mitología propia —los Mitos de Cthulhu—, desarrollada en colaboración con otros autores, actualmente en vigencia. Su obra constituye un clásico del horror cósmico, una línea narrativa que se aparta de las tradicionales historias de terror sobrenatural —satanismo, fantasmas—, incluyendo elementos de ciencia ficción como, por ejemplo, razas alienígenas, viajes en el tiempo o existencia de otras dimensiones.', '1890-08-20', '1937-03-15' , 'Nueva York');

INSERT INTO libreria.autor(NombreAutor, ApellidoAutor, Biografia, AnnoNacimiento, AnnoFallecimiento, Ciudad) VALUES ('Brandon', 'Sanderson', 'Brandon Sanderson es un escritor estadounidense. Creó las Leyes de Magia de Sanderson y popularizó los Sistemas de magia dura y blanda. En 2008, comenzó un podcast llamado Writing Excuses con el escritor Dan Wells y el dibujante Howard Tayler, en el que tratan temas relacionados con la creación de la escritura de géneros y los webcomics.', '1975-12-19', NULL, 'Nebraska');


CREATE TABLE libreria.libro (
    ISBN VARCHAR(13) NOT NULL,
    IDlibro INT NOT NULL AUTO_INCREMENT,
    IDgenero INT NOT NULL,
    IDautor INT NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    NumPag SMALLINT NOT NULL,
    Idioma VARCHAR(255) NOT NULL,
    Encuadernacion ENUM("Tapa Dura", "Tapa Blanda", "Ebook") NOT NULL DEFAULT "Tapa Blanda",
    AñoEdicion DATE NOT NULL,
    Precio DECIMAL(4,2) NOT NULL,
    Alto DECIMAL (10,2) NOT NULL,
    Ancho DECIMAL (10,2) NOT NULL,
    Grueso DECIMAL (10,2) NOT NULL,
    Peso DECIMAL (10,2) NOT NULL,
    Descripcion TEXT NOT NULL,
    PRIMARY KEY (IDlibro),
    FOREIGN KEY (IDgenero) references libreria.genero(IDgenero),
    FOREIGN KEY (IDautor) references libreria.autor(IDautor)
);

INSERT INTO libreria.libro (ISBN, IDlibro, IDgenero, IDautor, Titulo, NumPag, Idioma, Encuadernacion, AñoEdicion, Precio, Alto, Ancho, Grueso, Peso, Descripcion) VALUES ('9788478884452', 1, 2, 1, 'Harry Potter y la piedra filosofal', 264, 'español', 'Tapa Dura', '2000-01-01', 16.20, 21.90, 13.50, 2.10, 394.00, 'Harry Potter y la piedra filosofal es una novela de ficción de terror escrita por el escritor británico J.K. Rowling. La novela está basada en la serie de cuentos de la misma nombre, publicada por primera vez en 1997. La novela está considerada una de las más vendidas de la literatura de terror y ha sido traducida a más de cien idiomas.');

INSERT INTO libreria.libro (ISBN, IDlibro, IDgenero, IDautor, Titulo, NumPag, Idioma, Encuadernacion, AñoEdicion, Precio, Alto, Ancho, Grueso, Peso, Descripcion) VALUES ('9788445009598', 2, 3, 2, 'El Señor de los Anillos: La Comunidad del Anillo', 700, 'español', 'Tapa Blanda', '2001-01-01', 15.20, 21.90, 13.50, 2.10, 394.00, 'El Señor de los Anillos: La Comunidad del Anillo es una novela de ficción de terror escrita por el escritor británico J.R.R. Tolkien. La novela está basada en la serie de cuentos de la misma nombre, publicada por primera vez en 1997. La novela está considerada una de las más vendidas de la literatura de terror y ha sido traducida a más de cien idiomas.');

INSERT INTO libreria.libro (ISBN, IDlibro, IDgenero, IDautor, Titulo, NumPag, Idioma, Encuadernacion, AñoEdicion, Precio, Alto, Ancho, Grueso, Peso, Descripcion) VALUES ('9788466341295', 3, 2, 3, 'La torre Oscura I: La hierba del Diablo', 464, 'español', 'Ebook', '2002-01-01', 20.20, 21.90, 13.50, 2.10, 394.00, 'La torre Oscura I: La hierba del Diablo es una novela de ficción fantástica escrita por el escritor estadounidense Stephen King. La novela está basada en la serie de cuentos de la misma nombre, publicada por primera vez en 1997. La novela está considerada una de las más vendidas de la literatura de terror y ha sido traducida a más de cien idiomas.');

INSERT INTO libreria.libro (ISBN, IDlibro, IDgenero, IDautor, Titulo, NumPag, Idioma, Encuadernacion, AñoEdicion, Precio, Alto, Ancho, Grueso, Peso, Descripcion) VALUES ('9788413143194', 4, 2, 4, 'Nacidos de la Bruma', 541, 'español', 'Tapa Dura', '2006-01-01', 29.90, 21.90, 13.50, 2.10, 394.00, 'Nacidos de la Bruma es una novela de ficción de fantástica escrita por el escritor estadounidense Brandon Sanderson. publicada por primera vez en 1997. La novela está considerada una de las más vendidas de la literatura de terror y ha sido traducida a más de cien idiomas.');

CREATE TABLE libreria.editorial (
    IDeditorial INT NOT NULL AUTO_INCREMENT,
    IDlibro INT NOT NULL,
    NombreEditorial VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDeditorial),
    FOREIGN KEY (IDlibro) references libreria.libro(IDlibro)
);

INSERT INTO libreria.editorial (IDeditorial, IDlibro, NombreEditorial) VALUES (1, 1, 'Editorial El Mollete');

INSERT INTO libreria.editorial (IDeditorial, IDlibro, NombreEditorial) VALUES (2, 2, 'Editorial El Rey');

INSERT INTO libreria.editorial (IDeditorial, IDlibro, NombreEditorial) VALUES (3, 3, 'Editorial El Anillo');

INSERT INTO libreria.editorial (IDeditorial, IDlibro, NombreEditorial) VALUES (4, 4, 'Editorial El Alomante');

CREATE TABLE libreria.Proveedor (
    IDproveedor INT NOT NULL AUTO_INCREMENT,
    NombreProveedor VARCHAR(255) NOT NULL,
    PersonaContacto VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    PRIMARY KEY (IDproveedor)
);

INSERT INTO libreria.Proveedor (IDproveedor, NombreProveedor, PersonaContacto, Direccion) VALUES (1, 'Libros Pepe', 'Juan Perez', 'Calle Falsa 123');

INSERT INTO libreria.Proveedor (IDproveedor, NombreProveedor, PersonaContacto, Direccion) VALUES (2, 'Por si el de arriba no tiene libros', 'Juan Huertas', 'Av Falsa 090');

CREATE TABLE libreria.usuario (
    IDusuario INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Edad TINYINT NOT NULL,
    PRIMARY KEY (IDusuario)
);

INSERT INTO libreria.usuario (IDusuario, Nombre, Apellido, Email, Contraseña, Edad) VALUES (1, 'Juan', 'Huertas', 'email@gmail.com', '123', 20);

INSERT INTO libreria.usuario (IDusuario, Nombre, Apellido, Email, Contraseña, Edad) VALUES (2, 'Pedro', 'Perez', 'invencion@gmail.com', '567', 56);

INSERT INTO libreria.usuario (IDusuario, Nombre, Apellido, Email, Contraseña, Edad) VALUES (3, 'Ruben', 'Perea', 'perea7r@gmail.com', '1234', 27);

CREATE TABLE libreria.reseña (
    IDreseña INT NOT NULL AUTO_INCREMENT,
    IDlibro INT NOT NULL,
    IDusuario INT NOT NULL,
    Opinion VARCHAR(255) NOT NULL,
    Puntuacion TINYINT(1) NOT NULL,
    CONSTRAINT puntuacion1a5 CHECK (Puntuacion >= 1 AND Puntuacion <= 5),
    PRIMARY KEY (IDreseña),
    FOREIGN KEY (IDlibro) references libreria.libro(IDlibro),
    FOREIGN KEY (IDusuario) references libreria.usuario(IDusuario)
);

INSERT INTO libreria.reseña (IDreseña, IDlibro, IDusuario, Opinion, Puntuacion) VALUES (1, 1, 1, 'Muy buen libro', 5);

INSERT INTO libreria.reseña (IDreseña, IDlibro, IDusuario, Opinion, Puntuacion) VALUES (2, 2, 2, 'Opino porque me descuentan un euro', 5);

INSERT INTO libreria.reseña (IDreseña, IDlibro, IDusuario, Opinion, Puntuacion) VALUES (3, 3, 3, 'Muy malo', 1);

INSERT INTO libreria.reseña (IDreseña, IDlibro, IDusuario, Opinion, Puntuacion) VALUES (4, 4, 3, 'Esperaba más', 3);

INSERT INTO libreria.reseña (IDreseña, IDlibro, IDusuario, Opinion, Puntuacion) VALUES (5, 4, 1, 'Brandon Sanderson es un ser de luz', 5);


CREATE TABLE libreria.movil (
    IDmovil INT NOT NULL AUTO_INCREMENT,
    IDusuario INT NOT NULL,
    Numero INT NOT NULL,
    PRIMARY KEY (IDmovil),
    FOREIGN KEY (IDusuario) references libreria.usuario(IDusuario)
);

INSERT INTO libreria.movil (IDmovil, IDusuario, Numero) VALUES (1, 1, 666666666);
INSERT INTO libreria.movil (IDmovil, IDusuario, Numero) VALUES (2, 2, 765432121);
INSERT INTO libreria.movil (IDmovil, IDusuario, Numero) VALUES (3, 1, 665432167);
INSERT INTO libreria.movil (IDmovil, IDusuario, Numero) VALUES (4, 1, 765432145);
INSERT INTO libreria.movil (IDmovil, IDusuario, Numero) VALUES (5, 3, 665432105);

CREATE TABLE libreria.stock (
    IDstock INT NOT NULL AUTO_INCREMENT,
    Cantidad INT NOT NULL,
    PRIMARY KEY (IDstock)
);

INSERT INTO libreria.stock (IDstock, Cantidad) VALUES (1,5);
INSERT INTO libreria.stock (IDstock, Cantidad) VALUES (2, 14);
INSERT INTO libreria.stock (IDstock, Cantidad) VALUES (3, 32);



CREATE TABLE libreria.direcciones (
    IDdireccion INT NOT NULL AUTO_INCREMENT,
    Calle VARCHAR(255) NOT NULL,
    Numero INT NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    CP TINYINT(5) NOT NULL,
    PRIMARY KEY (IDdireccion)
);

CREATE TABLE libreria.usuario_tiene_direcciones (
    IDusuario INT NOT NULL,
    IDdireccion INT NOT NULL,
    FOREIGN KEY (IDusuario) references libreria.usuario(IDusuario),
    FOREIGN KEY (IDdireccion) references libreria.direcciones(IDdireccion)
);

CREATE TABLE libreria.libro_suministra_proveedor (
    IDlibro INT NOT NULL,
    IDproveedor INT NOT NULL,
    FOREIGN KEY (IDlibro) references libreria.libro(IDlibro),
    FOREIGN KEY (IDproveedor) references libreria.proveedor(IDproveedor)
);

CREATE TABLE libreria.usuario_compra_libro (
    IDusuario INT NOT NULL,
    IDlibro INT NOT NULL,
    FOREIGN KEY (IDusuario) references libreria.usuario(IDusuario),
    FOREIGN KEY (IDlibro) references libreria.libro(IDlibro)
);

CREATE TABLE libreria.usuario_tiene_stock (
    IDusuario INT NOT NULL,
    IDstock INT NOT NULL,
    FOREIGN KEY (IDusuario) references libreria.usuario(IDusuario),
    FOREIGN KEY (IDstock) references libreria.stock(IDstock)
);