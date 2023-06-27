CREATE DATABASE  IF NOT EXISTS `tpint_grupo_9_lab5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tpint_grupo_9_lab5`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tpint_grupo_9_lab5
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
  `descripcionA` varchar(255) DEFAULT NULL,
  `nombreA` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `marcaA` int DEFAULT NULL,
  `TipoA` int DEFAULT NULL,
  `PrecioUnitario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA9B58FB1539CB7C` (`marcaA`),
  KEY `FKBA9B58FBD7CE83E6` (`TipoA`),
  CONSTRAINT `FKBA9B58FB1539CB7C` FOREIGN KEY (`marcaA`) REFERENCES `marca` (`id`),
  CONSTRAINT `FKBA9B58FBD7CE83E6` FOREIGN KEY (`TipoA`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_C` int NOT NULL AUTO_INCREMENT,
  `Apellido_C` varchar(255) DEFAULT NULL,
  `DNI_C` varchar(255) DEFAULT NULL,
  `Direccion_C` varchar(255) DEFAULT NULL,
  `EstadoC` tinyint(1) NOT NULL,
  `Fecha_Nacimiento_C` datetime DEFAULT NULL,
  `Localidad_C` varchar(255) DEFAULT NULL,
  `Mail_C` varchar(255) DEFAULT NULL,
  `Nombre_C` varchar(255) DEFAULT NULL,
  `Sexo_C` varchar(255) DEFAULT NULL,
  `Telefono_C` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EstadoE` tinyint(1) NOT NULL,
  `apellidoE` varchar(255) DEFAULT NULL,
  `direccionE` varchar(255) DEFAULT NULL,
  `dniE` varchar(255) DEFAULT NULL,
  `fechaNacimientoE` datetime DEFAULT NULL,
  `legajoE` varchar(255) DEFAULT NULL,
  `localidadE` varchar(255) DEFAULT NULL,
  `mailE` varchar(255) DEFAULT NULL,
  `nombreE` varchar(255) DEFAULT NULL,
  `sexoE` varchar(255) DEFAULT NULL,
  `telefonoE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EstadoM` tinyint(1) NOT NULL,
  `descripcionM` varchar(255) DEFAULT NULL,
  `nombreM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EstadoS` tinyint(1) NOT NULL,
  `FechaVencimientoS` datetime DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  `precioCompra` double DEFAULT NULL,
  `articulo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4C806F63F44925F` (`articulo_id`),
  CONSTRAINT `FK4C806F63F44925F` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocuenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EstadoT` tinyint(1) NOT NULL,
  `descripcionT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EstadoU` tinyint(1) NOT NULL,
  `contraseniaU` varchar(255) DEFAULT NULL,
  `usuarioU` varchar(255) DEFAULT NULL,
  `empleadoU` int DEFAULT NULL,
  `tipoCuentaU` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B4D8B0E2BB42C5A` (`empleadoU`),
  KEY `FK5B4D8B0E4CA5015A` (`tipoCuentaU`),
  CONSTRAINT `FK5B4D8B0E2BB42C5A` FOREIGN KEY (`empleadoU`) REFERENCES `empleado` (`id`),
  CONSTRAINT `FK5B4D8B0E4CA5015A` FOREIGN KEY (`tipoCuentaU`) REFERENCES `tipocuenta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `ID_V` int NOT NULL AUTO_INCREMENT,
  `EstadoV` tinyint(1) NOT NULL,
  `Fecha_V` datetime DEFAULT NULL,
  `Total_V` float NOT NULL,
  `ID_Cliente_V` int DEFAULT NULL,
  `ID_Usuario_V` int DEFAULT NULL,
  `StockDescontadoV` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_V`),
  KEY `FK4EB7A2C27EE2C22` (`ID_Cliente_V`),
  KEY `FK4EB7A2CA4DA898A` (`ID_Usuario_V`),
  CONSTRAINT `FK4EB7A2C27EE2C22` FOREIGN KEY (`ID_Cliente_V`) REFERENCES `cliente` (`ID_C`),
  CONSTRAINT `FK4EB7A2CA4DA898A` FOREIGN KEY (`ID_Usuario_V`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventaarticulo`
--

DROP TABLE IF EXISTS `ventaarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventaarticulo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidadVA` int NOT NULL,
  `subtotalVA` float NOT NULL,
  `articuloVA` int DEFAULT NULL,
  `ventaVA` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK89B6532790C4026` (`articuloVA`),
  KEY `FK89B653276AEB03DE` (`ventaVA`),
  CONSTRAINT `FK89B653276AEB03DE` FOREIGN KEY (`ventaVA`) REFERENCES `venta` (`ID_V`),
  CONSTRAINT `FK89B6532790C4026` FOREIGN KEY (`articuloVA`) REFERENCES `articulo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 20:53:30
