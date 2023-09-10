DROP DATABASE IF EXISTS proveedor_piezas;
CREATE DATABASE proveedor_piezas;
USE proveedor_piezas;
CREATE TABLE  proveedor_piezas.proveedores(
  codigo_prov INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  ciudad VARCHAR(10) NOT NULL,
  direccion VARCHAR(20) NOT NULL,
  provincia VARCHAR(30) NOT NULL,
  PRIMARY KEY (codigo_prov)
);

CREATE TABLE  proveedor_piezas.piezas(
  codigo_piezas INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  color VARCHAR(10) NOT NULL,
  precio DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (codigo_piezas)
);

CREATE TABLE  proveedor_piezas.categoria(
  codigo_cat INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  PRIMARY KEY (codigo_cat)
);

CREATE TABLE  proveedor_piezas.ticket(
  codigo_prov INT NOT NULL,
  codigo_piezas INT NOT NULL,
  codigo_cat INT NOT NULL,
  cantidad INT NOT NULL DEFAULT (1), 
  FECHA DATE NOT NULL,
  PRIMARY KEY (codigo_prov,codigo_piezas,codigo_cat),
  CONSTRAINT fk_ticket_proveedores
    FOREIGN KEY ticket(codigo_prov)
    REFERENCES  proveedor_piezas.proveedores(codigo_prov),
    CONSTRAINT fk_ticket_piezas
    FOREIGN KEY ticket(codigo_piezas)
    REFERENCES  proveedor_piezas.piezas(codigo_piezas),
    CONSTRAINT fk_ticket_categoria
    FOREIGN KEY ticket(codigo_cat)
    REFERENCES  proveedor_piezas.categoria(codigo_cat)
  );