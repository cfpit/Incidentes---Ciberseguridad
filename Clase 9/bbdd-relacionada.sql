

-- Primero, eliminamos las tablas existentes si existen
DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `group_authorities`;
DROP TABLE IF EXISTS `group_members`;
DROP TABLE IF EXISTS `groups`;
DROP TABLE IF EXISTS `users`;

-- Creamos la base de datos y seleccionamos el esquema
CREATE DATABASE bbdd;
USE bbdd;

-- Tabla users con clave primaria
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla groups con clave primaria
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla authorities con claves primarias compuestas
CREATE TABLE `authorities` (
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`username`, `authority`),
  KEY `FK_AUTHORITIES_USERS` (`username`),
  CONSTRAINT `FK_AUTHORITIES_USERS` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla group_members con claves foráneas
CREATE TABLE `group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_GROUP_MEMBERS_USERS` (`username`),
  KEY `FK_GROUP_MEMBERS_GROUPS` (`group_id`),
  CONSTRAINT `FK_GROUP_MEMBERS_USERS` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_GROUP_MEMBERS_GROUPS` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla group_authorities con claves foráneas
CREATE TABLE `group_authorities` (
  `group_id` int(11) NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`, `authority`),
  KEY `FK_GROUP_AUTHORITIES_GROUPS` (`group_id`),
  CONSTRAINT `FK_GROUP_AUTHORITIES_GROUPS` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertamos los datos
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('enrique','enrique',1),
('fer','fer',1),
('juan','juan',1),
('lucas','lucas',0),
('pepe','pepe',1),
('rosa','rosa',1),
('sergio','sergio',0);

INSERT INTO `groups` (`id`, `group_name`) VALUES
(1,'usuarios'),
(2,'administradores'),
(3,'invitados');

INSERT INTO `group_members` (`id`, `username`, `group_id`) VALUES
(2,'lucas',1),
(3,'juan',1),
(4,'rosa',3),
(5,'enrique',2),
(6,'pepe',1),
(8,'enrique',1),
(9,'fer',2);

INSERT INTO `group_authorities` (`group_id`, `authority`) VALUES
(1,'ROLE_USER'),
(2,'ROLE_ADMIN'),
(3,'ROLE_GUEST');