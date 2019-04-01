-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bdd_biomedicale
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblclient`
--

CREATE SCHEMA IF NOT EXISTS `bdd_biomedicale` DEFAULT CHARACTER SET utf8 ;
USE `bdd_biomedicale` ;

DROP TABLE IF EXISTS `tblclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclient` (
  `idClient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adresse` varchar(45) DEFAULT NULL,
  `identifiant` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `dateDeNaissance` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger logincreation before insert on tblclient
for each row
BEGIN
set
New.identifiant = CONCAT(LAST_INSERT_ID() + 1, NEW.nom),
New.passwd = NEW.dateDeNaissance;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbltest`
--

DROP TABLE IF EXISTS `tbltest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltest` (
  `idClient` int(10) unsigned NOT NULL,
  `dateDeTest` datetime DEFAULT NULL,
  `pressionSys` int(11) DEFAULT NULL,
  `pressionDia` int(11) DEFAULT NULL,
  `poulsCardiaque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- login trigger
drop trigger if exists logincreation;
	
	delimiter |
	create trigger logincreation before insert on tblclient
	for each row
	BEGIN
		set @ai = (SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'bdd_biomedicale' AND TABLE_NAME = 'tblclient');
		set
		New.identifiant = CONCAT(@ai, NEW.nom),
		New.passwd = DATE(NEW.dateDeNaissance);
	END;
	|
	delimiter ;
	
-- fonctions moyennes
USE `bdd_biomedicale`;
DROP function IF EXISTS `poulsCardiaqueMoyenne`;

DELIMITER $$
USE `bdd_biomedicale`$$
CREATE FUNCTION `poulsCardiaqueMoyenne` (age INT)
RETURNS INTEGER
BEGIN
	RETURN
	(SELECT AVG(poulsCardiaque)
    FROM tblTest t
    INNER JOIN tblClient c
    ON t.idClient = c.idClient
    WHERE age = CONVERT(t.dateDeTest - c.dateDeNaissance, UNSIGNED));
END$$

DELIMITER ;


USE `bdd_biomedicale`;
DROP function IF EXISTS `pressionSysMoyenne`;

DELIMITER $$
USE `bdd_biomedicale`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `pressionSysMoyenne`(age INT) RETURNS int(11)
BEGIN
	RETURN
	(SELECT AVG(pressionSys)
    FROM tblTest t
    INNER JOIN tblClient c
    ON t.idClient = c.idClient
    WHERE age = CONVERT(t.dateDeTest - c.dateDeNaissance, UNSIGNED));
END$$

DELIMITER ;


USE `bdd_biomedicale`;
DROP function IF EXISTS `pressionDiaMoyenne`;

DELIMITER $$
USE `bdd_biomedicale`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `pressionDiaMoyenne`(age INT) RETURNS int(11)
BEGIN
	RETURN
	(SELECT AVG(pressionDia)
    FROM tblTest t
    INNER JOIN tblClient c
    ON t.idClient = c.idClient
    WHERE age = CONVERT(t.dateDeTest - c.dateDeNaissance, UNSIGNED));
END$$

DELIMITER ;

-- Dump completed on 2019-03-14 13:42:02
