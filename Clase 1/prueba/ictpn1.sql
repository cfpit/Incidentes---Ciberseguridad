-- Crear la base de datos
CREATE DATABASE ictpn1;

-- Usar la base de datos
USE ictpn1;

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    login VARCHAR(50),
    pw VARCHAR(50)
);

-- Insertar el usuario de prueba
INSERT INTO usuarios VALUES ('Juan', '1234');