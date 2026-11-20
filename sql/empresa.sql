CREATE DATABASE  IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `empresa`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empresa
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('ENTRADA','SAIDA') NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `datetime_movimentacao` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `fk_movimentacao_produto` (`id_produto`),
  KEY `fk_movimentacao_user` (`id_user`),
  CONSTRAINT `fk_movimentacao_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_movimentacao_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
INSERT INTO `movimentacao` VALUES (1,'ENTRADA',50,1,'2026-11-19 20:10:20',1),(2,'SAIDA',10,1,'2026-11-19 20:10:20',1),(3,'SAIDA',5,2,'2026-11-19 20:10:20',1),(4,'SAIDA',12,4,'2026-11-19 21:05:21',1),(5,'ENTRADA',15,4,'2026-11-19 21:05:50',1);
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `data_cadastro` date NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Amaciante de roupas',100,0.50,'2026-11-19'),(2,'Detergente',25,18.90,'2026-11-19'),(3,'Sabão em pó',40,22.50,'2026-11-19'),(4,'Doritos',15,9.99,'2026-07-06');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo` enum('administrador','operador') NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ADM','$2y$10$S6OvVC9Zz/cPZAAN35XuVuqTwnv5IzHfI0u4Yyqr2znNdMVse2IHu','admin@gmail.com','administrador'),(5,'Operador','$2y$10$hdJI6OgUtJQ7OoXV60h.W.z7r/jnr3lEurOuDR9VYmPo5u9IXT3Na','operador@gmail.com','operador');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19 21:09:19
