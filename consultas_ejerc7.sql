DROP DATABASE IF EXISTS tienda_informatica;
CREATE DATABASE tienda_informatica;
USE tienda_informatica;
CREATE TABLE  tienda_informatica.fabricante (
  codigo INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE tienda_informatica.producto(
  codigo INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  fabricante_codigo INT NOT NULL,
  PRIMARY KEY (codigo, fabricante_codigo),
  CONSTRAINT fk_producto_fabricante
    FOREIGN KEY (fabricante_codigo)
    REFERENCES tienda_informatica.fabricante (codigo)
);
-- insertamos valores en la tabla de fabricante
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (1, 'Asus');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (2, 'Lenovo');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (3, 'Hewlett-Packard');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (4, 'Samsung');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (5, 'Seagate');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (6, 'Crucial');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (7, 'Gigabyte');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (8, 'Huawei');
INSERT INTO tienda_informatica.fabricante (codigo, nombre) VALUES (9, 'Xiaomi');
SELECT * FROM tienda_informatica.fabricante;

-- insertamos valores en la tabla producto
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (3, 'Disco SSD 1TB', 150.99, 4);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (4, 'GeForce GTX 1050 TI', 185, 7);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (8, 'Portatil Yoga 520', 559, 2);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (9, 'Portatil ideapad 320', 444, 2);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO tienda_informatica.producto (codigo, nombre, precio, fabricante_codigo) VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
SELECT * FROM tienda_informatica.producto;
SELECT count(*) as total_productos FROM producto;

SELECT fabricante.nombre as nombre_fabricante,
	count(producto.codigo) as total_producto
FROM producto left join fabricante
ON producto.codigo = fabricante.codigo
GROUP BY producto.codigo
ORDER BY 2 DESC;

SELECT fabricante.nombre as nombrefabricante,
	max(precio) as preciomaximo,
	min(precio) as preciominimo,
    avg(precio) as preciopromedio
FROM fabricante join producto
ON producto.codigo = fabricante.codigo
GROUP BY producto.codigo;

SELECT fabricante.nombre as nombre_fabricante,
max(precio) as preciomaximo,
	min(precio) as preciominimo,
    avg(precio) as preciopromedio,
	count(producto.codigo) as total_producto
FROM producto left join fabricante
ON producto.codigo = fabricante.codigo
GROUP BY producto.codigo
HAVING preciopromedio>200;

