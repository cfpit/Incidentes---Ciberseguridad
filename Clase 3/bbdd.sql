CREATE DATABASE `bbdd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;


use bbdd;


CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `pw` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `bbdd`.`usuario` VALUES
(1,'Juan','a','a'),
(2,'Maria','b','b');

SELECT * FROM usuario;