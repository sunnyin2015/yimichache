-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.50-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema yimi
--

CREATE DATABASE IF NOT EXISTS yimi;
USE yimi;

--
-- Definition of table `daily_card`
--

DROP TABLE IF EXISTS `daily_card`;
CREATE TABLE `daily_card` (
  `daycid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `time` datetime DEFAULT NULL,
  `finished` int(10) unsigned NOT NULL,
  PRIMARY KEY (`daycid`,`cid`),
  KEY `FK_daily_card_1` (`cid`),
  CONSTRAINT `FK_daily_card_1` FOREIGN KEY (`cid`) REFERENCES `habits` (`cid`),
  CONSTRAINT `FK_daily_card_2` FOREIGN KEY (`daycid`) REFERENCES `main_card` (`daycid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `daily_card`
--

/*!40000 ALTER TABLE `daily_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_card` ENABLE KEYS */;


--
-- Definition of table `habits`
--

DROP TABLE IF EXISTS `habits`;
CREATE TABLE `habits` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `habits`
--

/*!40000 ALTER TABLE `habits` DISABLE KEYS */;
/*!40000 ALTER TABLE `habits` ENABLE KEYS */;


--
-- Definition of table `main_card`
--

DROP TABLE IF EXISTS `main_card`;
CREATE TABLE `main_card` (
  `daycid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `finished` int(10) unsigned NOT NULL,
  `fin_time` datetime DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL,
  `remind` int(10) unsigned NOT NULL,
  PRIMARY KEY (`daycid`,`uid`) USING BTREE,
  KEY `FK_main_card_1` (`uid`),
  CONSTRAINT `FK_main_card_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_card`
--

/*!40000 ALTER TABLE `main_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_card` ENABLE KEYS */;


--
-- Definition of table `tips`
--

DROP TABLE IF EXISTS `tips`;
CREATE TABLE `tips` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `txt` text NOT NULL,
  `titile` varchar(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tips`
--

/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `regtime` datetime DEFAULT NULL,
  `gender` int(10) unsigned DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `rank` int(10) unsigned DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
