DROP DATABASE IF EXISTS alumnos;
CREATE DATABASE alumnos;
USE alumnos;
CREATE TABLE  alumnos.alumnos(
  id_alumno INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellido_p VARCHAR(10) NOT NULL,
   apellido_m VARCHAR(20) NOT NULL,
  nota int  NOT NULL,
  PRIMARY KEY (id_alumno)
);

--Una vez creada la tabla escriba dos triggers con las siguientes características:

--Trigger 1: trigger_check_nota_before_insert
--Se ejecuta sobre la tabla alumnos.

--Se ejecuta antes de una operación de inserción.

--Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.

--Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.

--Trigger2 : trigger_check_nota_before_update

--Se ejecuta sobre la tabla alumnos.

--Se ejecuta antes de una operación de actualización.

--Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.

--Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.


DROP TRIGGER IF EXISTS alumnos_verifica_alumnos_BI;
DELIMITER $$
CREATE TRIGGER alumnos_verifica_alumnos_BI 
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota<0 THEN
       SET NEW.sal = 0;
    END IF;
    
    IF NEW.nota>10 THEN
       SET NEW.nota = 10;
    END IF;
END$$

DROP TRIGGER IF EXISTS alumnos_verifica_alumnos_BU;
DELIMITER $$
CREATE TRIGGER alumnos_verifica_alumnos_BU 
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota<0 THEN
       SET NEW.nota = 0;
    END IF;
    
    IF NEW.nota>10 THEN
       SET NEW.nota = 10;
    END IF;
END$$