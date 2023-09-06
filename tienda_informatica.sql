DROP IF EXISTS tienda_informatica;
CREATE DATABASE tienda_informatica;
USE tienda_informatica;

CREATE TABLE fabricante(
codigo_fabricante INT(10); PRIMARY KEY auto_increment,
nombre VARCHAR(100); not null,
);

CREATE TABLE productos(
codigo INT(10)PRIMARY KEY auto_increment,
nombre VARCHAR(100) not null,
precio DECIMAL(7,2) not null,
cantidad NUMERIC(1) not null,
-- restriccion
CONSTRAINT productos_codigo_fabricante_codigo_productos
FOREIGN KEY productos(codigo_fabricante)
);
-- insertamos valores de la tabla fabricante
