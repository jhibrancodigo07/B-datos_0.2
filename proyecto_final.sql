DROP DATABASE IF EXISTS proveedor_piezas;
CREATE DATABASE proveedor_piezas;
USE proveedor_piezas;

CREATE TABLE  `proveedor_piezas`.`proveedores` (
  `codigo_prov` INT NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  `ciudad` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(20) NOT NULL,
  `provincia` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigo_prov`)
);

CREATE TABLE  `proveedor_piezas`.`piezas` (
  `codigo_piezas` INT NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  `precio` DECIMAL(7,2) NOT NULL,
  `piezas_cat` INT NOT NULL,
  PRIMARY KEY (`codigo_piezas`),
  CONSTRAINT `fk_piezas_cat`
    FOREIGN KEY (`piezas_cat`)
    REFERENCES `proveedor_piezas`.`categoria` (`piezas_cat`)
);

CREATE TABLE  `proveedor_piezas`.`categoria` (
  `codigo_cat` INT NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`codigo_cat`)
);