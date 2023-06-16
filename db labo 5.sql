CREATE DATABASE  IF NOT EXISTS `tpint_grupo_9_lab5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tpint_grupo_9_lab5`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tpint_grupo_9_lab4
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreA` varchar(45) DEFAULT NULL,
  `descripcionA` varchar(45) DEFAULT NULL,
  `tipoA` varchar(45) DEFAULT NULL,
  `marcaA` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA9B58FB101D33CC` (`marcaA`),
  CONSTRAINT `FKBA9B58FB101D33CC` FOREIGN KEY (`marcaA`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'Yerba','Sabor limon 500g','Comestibles',1),(2,'Vinagre','Extra virgen 1LT','Comestibles',1),(3,'Vinagre','Manzana 1LT','Comestibles',1),(4,'Pure de tomate','520gr','Comestibles',1),(5,'Mayonesa','500gr','Comestibles',1),(6,'Fideos','Mostachol 500gr','Comestibles',1),(7,'Fideos','Nido 500gr','Comestibles',1),(9,'a','a','a',1),(10,'a','a','a',1),(11,'a','a','a',1),(12,'a','a','a',1),(13,'a','a','a',1),(20,'producto nuevo','descripcion','tipo',1);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `legajoE` varchar(45) DEFAULT NULL,
  `dniE` varchar(45) DEFAULT NULL,
  `nombreE` varchar(45) DEFAULT NULL,
  `apellidoE` varchar(45) DEFAULT NULL,
  `sexoE` varchar(45) DEFAULT NULL,
  `fechaNacimientoE` date DEFAULT NULL,
  `direccionE` varchar(45) DEFAULT NULL,
  `localidadE` varchar(45) DEFAULT NULL,
  `mailE` varchar(45) DEFAULT NULL,
  `telefonoE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'123','42123123','Pepe','Necochea','Masculino','2000-10-10','Calle 123','San Julio','pepe@gmail.com','113212312312');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreM` varchar(45) DEFAULT NULL,
  `descripcionM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Marollio','Siempre a tu mesa xd');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocuenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcionT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocuenta`
--

LOCK TABLES `tipocuenta` WRITE;
/*!40000 ALTER TABLE `tipocuenta` DISABLE KEYS */;
INSERT INTO `tipocuenta` VALUES (1,'Vendedor');
/*!40000 ALTER TABLE `tipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarioU` varchar(45) DEFAULT NULL,
  `contraseniaU` varchar(45) DEFAULT NULL,
  `empleadoU` int DEFAULT NULL,
  `tipoCuentaU` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B4D8B0E229357C0` (`empleadoU`),
  KEY `FK5B4D8B0E4EEEDD82` (`tipoCuentaU`),
  CONSTRAINT `empleado` FOREIGN KEY (`id`) REFERENCES `empleado` (`id`),
  CONSTRAINT `FK5B4D8B0E229357C0` FOREIGN KEY (`empleadoU`) REFERENCES `empleado` (`id`),
  CONSTRAINT `FK5B4D8B0E4EEEDD82` FOREIGN KEY (`tipoCuentaU`) REFERENCES `tipocuenta` (`id`),
  CONSTRAINT `tipoCuenta` FOREIGN KEY (`id`) REFERENCES `tipocuenta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'pepe','123',1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15  2:44:32
