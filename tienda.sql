CREATE TABLE IF NOT EXISTS clientes (
  codCli int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(30) NOT NULL,
  correo varchar(30) NOT NULL,
  pas varchar(30) NOT NULL,
  PRIMARY KEY (codCli)
);

INSERT INTO clientes (codCli, nombre, correo, pas) VALUES
(3, 'Jose Perez', 'jose@gmail.com', 'abc123'),
(4, 'Ana Diaz', 'ana@gmail.com', '111111');

CREATE TABLE IF NOT EXISTS detallepedido (
  numPedido int(11) NOT NULL,
  codpro int(11) NOT NULL,
  can int(11) NOT NULL,
  KEY numPedido (numPedido),
  KEY codpro (codpro)
);

INSERT INTO detallepedido (numPedido, codpro, can) VALUES
(1, 21, 2),
(1, 20, 2);

CREATE TABLE IF NOT EXISTS pedido (
  numPedido int(11) NOT NULL AUTO_INCREMENT,
  codCli varchar(100) NOT NULL,
  fecha date NOT NULL,
  PRIMARY KEY (numPedido)
);

INSERT INTO pedido (numPedido, codCli, fecha) VALUES
(1, '3', '2019-01-28');

CREATE TABLE IF NOT EXISTS productos (
  codpro int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(100) NOT NULL,
  precio decimal(8,2) NOT NULL,
  stock int(11) NOT NULL,
  estado varchar(30) NOT NULL,
  detalle varchar(1000) NOT NULL,
  imagen varchar(50) NOT NULL,
  PRIMARY KEY (codpro)
);

INSERT INTO productos (codpro, descripcion, precio, stock, estado, detalle, imagen) VALUES
(20, 'Televisor', '1800.00', 15, 'Normal', 'Televisor de 19 pulgadas especial con modo futbol, patalla cursa full HD', 'Televisor.jpg'),
(21, 'Radio', '1200.00', 20, 'Oferta', 'Radio de 300 watts de salida el cual incluye puertos USB y conexión Blue Too', 'Radio.jpg'),
(22, 'Cocina', '800.00', 30, 'Normal', 'Cocina de 6 hornillas con horno exra grande para cocinar sus comidas con un cocido especial', 'Cocina.jpg'),
(23, 'Licuadora', '400.00', 27, 'Normal', 'Licuadora de 10 velocidades con turbo para preparar todo tipo de jugos y comidas', 'Licuadora.jpg'),
(24, 'Plancha', '300.00', 42, 'Oferta', 'Plancha a vapor con aplicaciones de agua para plachar ternos y ropa pesada', 'Plancha.jpg'),
(25, 'Dvd', '500.00', 16, 'Normal', 'Dvd el cual permite ver todas sus peliculas con formato HD, ademas cuenta con puertos USB y conexión inalambrica', 'Dvd.jpg'),
(26, 'BluRay', '350.00', 26, 'Normal', 'Blue ray el cual permite ver todas las peliculas en formato HD, ademas cuenta con WiFi y conexion inalambrica', 'BluRay.jpg'),
(27, 'Batidora', '180.00', 22, 'Normal', 'Batidora especial para preparar todo tipo de kekes y tortas además preparado especial para las galletas', 'Batidora.jpg');



CREATE TABLE IF NOT EXISTS usuarios (
  codUsu int(11) NOT NULL AUTO_INCREMENT,
  nomUsu varchar(30) NOT NULL,
  correo varchar(30) NOT NULL,
  pasUsu varchar(30) NOT NULL,
  PRIMARY KEY (codUsu)
);

INSERT INTO usuarios (codUsu, nomUsu, correo, pasUsu) VALUES
(1, 'Anita Diaz', 'Admin@gmail.com', 'abc123');

ALTER TABLE detallepedido
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`numPedido`) REFERENCES `pedido` (`numPedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`codpro`) REFERENCES `productos` (`codpro`);
