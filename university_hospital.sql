-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 08, 2025 at 05:08 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `geographical location`
--

DROP TABLE IF EXISTS `geographical location`;
CREATE TABLE IF NOT EXISTS `geographical location` (
  `location ID` int NOT NULL,
  `village` int NOT NULL,
  `parish` int NOT NULL,
  `sub county` int NOT NULL,
  `county` int NOT NULL,
  `region` int NOT NULL,
  `population` int NOT NULL,
  `coordinates` int NOT NULL,
  `malaria risk level` int NOT NULL,
  `heal facility count` int NOT NULL,
  `ITN coverage` int NOT NULL,
  `reported cases` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria cases`
--

DROP TABLE IF EXISTS `malaria cases`;
CREATE TABLE IF NOT EXISTS `malaria cases` (
  `case ID` int NOT NULL,
  `patient id` int NOT NULL,
  `facility ID` int NOT NULL,
  `date of diagnosis` date NOT NULL,
  `type of malaria` varchar(50) NOT NULL,
  `treatment ID` int NOT NULL,
  `outcome ID` int NOT NULL,
  PRIMARY KEY (`case ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria type`
--

DROP TABLE IF EXISTS `malaria type`;
CREATE TABLE IF NOT EXISTS `malaria type` (
  `type ID` int NOT NULL,
  `type Name` varchar(50) NOT NULL,
  `description text` text NOT NULL,
  `date _added` date NOT NULL,
  `added by` int NOT NULL,
  `updated date` date NOT NULL,
  PRIMARY KEY (`type ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient data`
--

DROP TABLE IF EXISTS `patient data`;
CREATE TABLE IF NOT EXISTS `patient data` (
  `patient ID` int NOT NULL,
  `first name` varchar(50) NOT NULL,
  `last name` varchar(50) NOT NULL,
  `date of birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone number` varchar(10) NOT NULL,
  `next of kin` varchar(50) NOT NULL,
  `location ID` int NOT NULL,
  `date added` datetime(6) NOT NULL,
  `update date` datetime(6) NOT NULL,
  PRIMARY KEY (`patient ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `Resource ID` int NOT NULL,
  `facility ID` int NOT NULL,
  `resource type` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `last updated` date NOT NULL,
  `description Text` varchar(100) NOT NULL,
  `date added` date NOT NULL,
  PRIMARY KEY (`Resource ID`),
  KEY `facility ID` (`facility ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply chain`
--

DROP TABLE IF EXISTS `supply chain`;
CREATE TABLE IF NOT EXISTS `supply chain` (
  `supply ID` int NOT NULL,
  `resource ID` int NOT NULL,
  `facility ID` int NOT NULL,
  `quantity shipped` int NOT NULL,
  `shipment date` date NOT NULL,
  `expected arivall` date NOT NULL,
  `shipped by` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `update date` date NOT NULL,
  PRIMARY KEY (`supply ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatment ID` int NOT NULL,
  `treatment name` varchar(50) NOT NULL,
  `treatment Description` text NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `side effects` text NOT NULL,
  `date added` date NOT NULL,
  `update date` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`treatment ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user ID` int NOT NULL,
  `first name` varchar(50) NOT NULL,
  `last name` varchar(50) NOT NULL,
  `preferred name` varchar(50) NOT NULL,
  `role ID` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `facility ID` int NOT NULL,
  PRIMARY KEY (`user ID`),
  UNIQUE KEY `lwigs` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user role`
--

DROP TABLE IF EXISTS `user role`;
CREATE TABLE IF NOT EXISTS `user role` (
  `role ID` int NOT NULL,
  `role name` varchar(50) NOT NULL,
  `role description` text NOT NULL,
  `date _added` date NOT NULL,
  `update date` date NOT NULL,
  PRIMARY KEY (`role ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit records`
--

DROP TABLE IF EXISTS `visit records`;
CREATE TABLE IF NOT EXISTS `visit records` (
  `visit ID` int NOT NULL,
  `patient id` int NOT NULL,
  `visit number` int NOT NULL,
  `visit date` date NOT NULL,
  `date added` date NOT NULL,
  `updated date` date NOT NULL,
  `facility ID` int NOT NULL,
  PRIMARY KEY (`visit ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
