DROP DATABASE IF EXISTS FACSYS;
CREATE DATABASE facsys ;
 USE  facsys; 
 
-- Crear estructura de la tabla  'articulos’
CREATE TABLE articulos (
  codarticulo char(5) NOT NULL default '',
  nombre char(50) default NULL,
  precio float(6,2) default NULL,
  stock smallint(5) unsigned default NULL,
  idcategoria tinyint(3) unsigned default NULL,
  PRIMARY KEY  (codarticulo),
  KEY idcategoria (idcategoria)
);
-- Introducir datos en la tabla  'articulos'
INSERT INTO articulos VALUES ('PAN3', 'Pantalón corto', 17.50,NULL,NULL);
INSERT INTO articulos VALUES ('COR89', 'Corcho redondo', 43,NULL,NULL);
INSERT INTO articulos VALUES ('CAP01', 'caña de pescar', 80.40,NULL,NULL);
INSERT INTO articulos VALUES ('RAQ01', 'raqueta de squash', 62,NULL,NULL);
INSERT INTO articulos VALUES ('PEL45', 'Pelota de squash principiante', 5,NULL,NULL);

-- Crear estructura de la tabla  'categorias'
CREATE TABLE categorias (idcategoria tinyint(3) unsigned NOT NULL auto_increment,
nombre varchar(30) default NULL,
descripcion varchar(50) default NULL,
PRIMARY KEY  (idcategoria)
);
--
-- Introducir datos en la tabla  'categorias'
INSERT INTO categorias VALUES (1,'pesca','los articulos de pesca');
INSERT INTO categorias VALUES (2,'Squash','articulos de squash');
INSERT INTO categorias VALUES (3,'Ropa para niño','de 0 a 16 años');

-- Crear estructura de la tabla  'clientes'
CREATE TABLE clientes (
  idcliente char(6) NOT NULL default '',
  apellido char(30) default NULL,
  nombre char(30) default NULL,
  direccion char(50) default NULL,
  codpostal int(5) default NULL,
  poblacion char(30) default NULL,
  telefono int(10) default NULL,
  PRIMARY KEY  (idcliente)
);
-- Introducir datos en la tabla  'clientes'
INSERT INTO clientes VALUES ('PER001', 'Pérez', 'Pedro', 'Calle del menhir', 44500, 'Madrid', 913145683);
INSERT INTO clientes VALUES ('GAR034', 'García', 'Daniel', 'La mota', 85260, 'Sabadell', 932744756);
INSERT INTO clientes VALUES ('CAL23', 'Calero', 'Alejandro', 'Avda Madrid 1', 56546, 'Valencia', NULL);
INSERT INTO clientes VALUES ('PER004', 'Pérez', 'Alfredo', 'Plaza mayor', 75000, 'Madrid', 0109457698);
--
-- Crear estructura de la tabla  'pedidos'
CREATE TABLE pedidos (
  numpedido int(10) unsigned NOT NULL auto_increment,
  idcliente char(6) default NULL,
  fecha timestamp NOT NULL,
  PRIMARY KEY  (numpedido)
);
-- Introducir datos en la tabla  'pedidos'
INSERT INTO pedidos VALUES (NULL,'PER001',20030119154135);
INSERT INTO pedidos VALUES (NULL,'GAR034',20030119154239);
--
-- Crear estructura de la tabla  'detalles'
CREATE TABLE detalles (
  numpedido int(10) unsigned NOT NULL default '0',
  numorden tinyint(3) unsigned NOT NULL default '0',
  codarticulo char(5) default NULL,
  cantidad smallint(5) unsigned default NULL,
  precio float(7,2) NOT NULL default '0.00',
  PRIMARY KEY  (numpedido,numorden)
);
-- Introducir datos en la tabla  'detalles'
INSERT INTO detalles VALUES (1,1,'CAP01',2,80.40);
INSERT INTO detalles VALUES (1,2,'PEL45',3,5.00);
INSERT INTO detalles VALUES (1,3,'RAQ01',1,62.00);
INSERT INTO detalles VALUES (2,4,'PAN3',1,17.50);