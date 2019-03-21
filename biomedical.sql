-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2019 at 06:54 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biomedical`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `poulsCardiaqueMoyenne` (`age` INT) RETURNS INT(11) BEGIN
	RETURN
	(SELECT AVG(poulsCardiaque)
    FROM tblTest t
    INNER JOIN tblClient c
    ON t.idClient = c.idClient
    WHERE age = CONVERT(t.dateDeTest - c.dateDeNaissance, UNSIGNED));
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblclient`
--

CREATE TABLE `tblclient` (
  `idClient` int(10) UNSIGNED NOT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `identifiant` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `dateDeNaissance` datetime DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `types` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblclient`
--

INSERT INTO `tblclient` (`idClient`, `adresse`, `identifiant`, `prenom`, `nom`, `dateDeNaissance`, `passwd`, `types`) VALUES
(2, '50 stratus', '1jean', 'jean', 'jean', '2019-03-06 00:00:00', '2019-03-06 00:00:00', 'admin');

--
-- Triggers `tblclient`
--
DELIMITER $$
CREATE TRIGGER `logincreation` BEFORE INSERT ON `tblclient` FOR EACH ROW BEGIN
		set
		New.identifiant = CONCAT(LAST_INSERT_ID() + 1, NEW.nom),
		New.passwd = NEW.dateDeNaissance;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbltest`
--

CREATE TABLE `tbltest` (
  `idClient` int(10) UNSIGNED NOT NULL,
  `dateDeTest` datetime DEFAULT NULL,
  `pressionSys` int(11) DEFAULT NULL,
  `pressionDia` int(11) DEFAULT NULL,
  `poulsCardiaque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblclient`
--
ALTER TABLE `tblclient`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `idClient_UNIQUE` (`idClient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblclient`
--
ALTER TABLE `tblclient`
  MODIFY `idClient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
