CREATE DATABASE  IF NOT EXISTS `bd_tcc_gujo_20` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_tcc_gujo_20`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_tcc_gujo_20
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bairros`
--

DROP TABLE IF EXISTS `bairros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairros` (
  `idBairros` int NOT NULL AUTO_INCREMENT,
  `nome_bairros` varchar(45) NOT NULL,
  `Cidade_idCidade` int NOT NULL,
  PRIMARY KEY (`idBairros`),
  KEY `Cidade_idCidade` (`Cidade_idCidade`),
  CONSTRAINT `bairros_ibfk_1` FOREIGN KEY (`Cidade_idCidade`) REFERENCES `cidade` (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairros`
--

LOCK TABLES `bairros` WRITE;
/*!40000 ALTER TABLE `bairros` DISABLE KEYS */;
INSERT INTO `bairros` VALUES (1,'Itinga',2),(2,'Glória',2),(3,'Centro',2),(4,'Aventureiro',2),(5,'América',2),(6,'Nova Brasília',4),(7,'Rio Cerro',4),(8,'Vila Nova',4),(9,'João Pessoa',4),(10,'Tifa Martins',4),(11,'Atiradores',2),(12,'Aventureiro',2),(13,'Centro',2),(14,'Glória',2),(15,'Adhermar Garcia',2),(16,'Centro',3),(17,'Guamiranga',3),(18,'Colégio Agrícola',3),(19,'Itinga',3),(20,'Porto Grande',3),(21,'Centro',5),(22,'Itinga I',5),(23,'Itinga II',5),(24,'Itajuba',5),(25,'Itajubá',5),(26,'Centro',6),(27,'Balneario',6),(28,'Cacupé',6),(29,'Ingleses',6),(30,'Barra da Lagoa',6),(31,'Center',7),(32,'Barra Norte',7),(33,'Estaleirinho',7),(34,'Praia dos Amores',7),(35,'Taquaras',7),(36,'Vila Rica',8),(37,'Jardin América',8),(38,'Jardin Europa',8),(39,'Centro',8),(40,'Bela Visto',8),(41,'Cidade Nova',9),(42,'Cabecudas',9),(43,'Fazenda',9),(44,'Itaipava',9),(45,'Murta',9),(46,'Gravatá',10),(47,'Santa  Lídia',10),(48,'São Cristovão',10),(49,'Centro',10),(50,'São Nicolau',10),(51,'Centro',11),(52,'Brasília',11),(53,'Itapema',11),(54,'Verdes Mares',11),(55,'Figueira',11);
/*!40000 ALTER TABLE `bairros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(45) NOT NULL,
  `Uf_idUf` int NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `fk_Cidade_Uf_idx` (`Uf_idUf`),
  CONSTRAINT `fk_Cidade_Uf` FOREIGN KEY (`Uf_idUf`) REFERENCES `uf` (`idUf`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (2,'joinville',30),(3,'Araquari',30),(4,'Jaraguá do Sul',30),(5,'Barra Velha',30),(6,'Florianópolis',30),(7,'Balneário Camburiú',30),(8,'Chapecó',30),(9,'Itajai',30),(10,'Penha',30),(11,'Itapoá',30),(12,'São Paulo',29),(13,'Guarulhos',29),(14,'Sorocaba',29),(15,'Osasco',29),(16,'Campinas',29),(17,'Ribeirão Preto',29),(18,'Jundiaí',29),(19,'Mauá',29),(20,'Pindamonhangaba',29),(21,'Socorro',29),(22,'Porto Alegre',32),(23,'Pelotas',32),(24,'Caxias do Sul',32),(25,'Canoas',32),(26,'Santa Maria',32),(27,'Gramado',32),(28,'Alvorada',32),(29,'Gravatai',32),(30,'Erechim',32),(31,'Guaíba',32),(32,'Curitiba',31),(33,'Londrina',31),(34,'Maringá',31),(35,'Ponta Grossa',31),(36,'Cascavel',31),(37,'Colombo',31),(38,'Toledo',31),(39,'Apucarana',31),(40,'Sarandi',31),(41,'Pato Branco',31);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onibus`
--

DROP TABLE IF EXISTS `onibus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onibus` (
  `NumOnibus` int NOT NULL,
  `HorariosOnibus` varchar(45) NOT NULL,
  `Nome_Onibus` varchar(45) NOT NULL,
  `Tipo_Onibus` varchar(45) NOT NULL,
  PRIMARY KEY (`NumOnibus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onibus`
--

LOCK TABLES `onibus` WRITE;
/*!40000 ALTER TABLE `onibus` DISABLE KEYS */;
INSERT INTO `onibus` VALUES (0,'16:45-19:45','Panetone','1'),(1,'16:45-19:45','Panetone','1');
/*!40000 ALTER TABLE `onibus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percurso`
--

DROP TABLE IF EXISTS `percurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percurso` (
  `idPercurso` int NOT NULL AUTO_INCREMENT,
  `inicio_Percurso_X` varchar(45) NOT NULL,
  `inicio_Percurso_Y` varchar(45) NOT NULL,
  `rota_Percurso` varchar(45) NOT NULL,
  `destino_Percurso_X` varchar(45) NOT NULL,
  `destino_Percurso_Y` varchar(45) NOT NULL,
  `Linhas_NumLinha` int NOT NULL,
  `Ruas_idRuas` int NOT NULL,
  PRIMARY KEY (`idPercurso`),
  KEY `fk_Percurso_Linhas1_idx` (`Linhas_NumLinha`),
  KEY `fk_Percurso_Ruas1_idx` (`Ruas_idRuas`),
  CONSTRAINT `fk_Percurso_Linhas1` FOREIGN KEY (`Linhas_NumLinha`) REFERENCES `onibus` (`NumOnibus`),
  CONSTRAINT `fk_Percurso_Ruas1` FOREIGN KEY (`Ruas_idRuas`) REFERENCES `ruas` (`idRuas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percurso`
--

LOCK TABLES `percurso` WRITE;
/*!40000 ALTER TABLE `percurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `percurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruas`
--

DROP TABLE IF EXISTS `ruas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruas` (
  `idRuas` int NOT NULL AUTO_INCREMENT,
  `nome_rua` varchar(45) NOT NULL,
  `Bairros_idBairros` int NOT NULL,
  PRIMARY KEY (`idRuas`),
  KEY `fk_Ruas_Bairros1_idx` (`Bairros_idBairros`),
  CONSTRAINT `fk_Ruas_Bairros1` FOREIGN KEY (`Bairros_idBairros`) REFERENCES `bairros` (`idBairros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruas`
--

LOCK TABLES `ruas` WRITE;
/*!40000 ALTER TABLE `ruas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `idTipo_Usuario` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `Usuario_id_Usuario` int NOT NULL,
  `especialização_idespecialização` int NOT NULL,
  PRIMARY KEY (`idTipo_Usuario`),
  KEY `fk_Tipo_Usuario_Usuario1_idx` (`Usuario_id_Usuario`),
  CONSTRAINT `fk_Tipo_Usuario_Usuario1` FOREIGN KEY (`Usuario_id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Motorista',10,10),(7,'Motorista',37,37),(9,'Passageiro',11,11),(10,'Passageiro',12,12),(11,'Passageiro',13,13),(12,'Passageiro',14,14);
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uf` (
  `idUf` int NOT NULL AUTO_INCREMENT,
  `sigla_uf` varchar(45) NOT NULL,
  `nome_uf` varchar(45) NOT NULL,
  PRIMARY KEY (`idUf`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` VALUES (29,'SP','São Paulo'),(30,'SC','Santa Catarina'),(31,'PR','Parana'),(32,'RS','Rio Grande do Sul');
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usuario` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `CNH` varchar(45) DEFAULT NULL,
  `tipo_carteira` int DEFAULT NULL,
  `data_nasc` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10,'Picollo','picolo','Picolino.Freitas@email.com','aaa','Masculino','99 9999-9999',NULL,NULL,''),(11,'jubiscleusa de Fatima','Pcln','jubiscleusa.Fatima@email.com','Picolo','Feminino','99 9999-9998',NULL,NULL,'30/11/2004'),(12,'Otto Silva','OttSil','Otto.Silva@email.com','otto51lv4','Masculino','98 8888-8889',NULL,NULL,'01/01/2001'),(13,'Herdbert Bixards','HxHunter','Herbert.Bixards@email.com','Zépovin06123','Masculino','12 3456-7890',NULL,NULL,'23/03/2006'),(14,'Pedro Rocha','proca101010','pedraolokao@email.com','01010000 01010010 ','Masculino','78 9042-3132',NULL,NULL,'15/07/2012'),(37,'Session','Session','Session@gmail.com','session','Outro','00000-0000',NULL,NULL,'2020-10-21');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_tcc_gujo_20'
--

--
-- Dumping routines for database 'bd_tcc_gujo_20'
--
/*!50003 DROP FUNCTION IF EXISTS `qtd_cid_numa_uf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `qtd_cid_numa_uf`(val Varchar(30)) RETURNS int
BEGIN
Declare CidQt Int(6);
select count(idCidade) into CidQt from cidade, uf where
uf.idUf = cidade.Uf_idUf and
 nome_uf = val;

RETURN CidQt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `qtd_user_por_tipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `qtd_user_por_tipo`(val Varchar(30)) RETURNS int
BEGIN
Declare UserQtd Int(6);
select count(id_Usuario) into UserQtd from usuario, tipo_usuario where
Usuario.id_Usuario = tipo_usuario.Usuario_id_Usuario and
 Descricao = val;

RETURN UserQtd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 12:23:43
