CREATE DATABASE `bbdd`;

use bbdd;

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pw` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;


INSERT INTO `bbdd`.`usuario` VALUES
(1,'Juan','a','a'),
(2,'Maria','b','b');

SELECT * FROM usuario;