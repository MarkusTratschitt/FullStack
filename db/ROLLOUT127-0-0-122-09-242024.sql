# ************************************************************
# Sequel Ace SQL dump
# Version 20073
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.39)
# Datenbank: ROLLOUT
# Verarbeitungszeit: 2024-09-21 23:37:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Tabellen-Dump AUFTRAG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUFTRAG`;

CREATE TABLE `AUFTRAG` (
  `Auftrag_ID` int NOT NULL AUTO_INCREMENT,
  `Kunde_ID` int DEFAULT NULL,
  `Mitarbeiter_ID` int DEFAULT NULL,
  `Status` varchar(100) NOT NULL,
  `KW` varchar(10) NOT NULL,
  `Installation_geplant` date DEFAULT NULL,
  `Installation_Tag` date DEFAULT NULL,
  `Abbruchdatum` date DEFAULT NULL,
  `Kabeltausch_erledigt` tinyint(1) DEFAULT '0',
  `Problemfall` tinyint(1) DEFAULT '0',
  `Abschluss_Techniker` tinyint(1) DEFAULT '0',
  `Abschluss_Buero` tinyint(1) DEFAULT '0',
  `Unterschrift_Kunde` varchar(255) DEFAULT NULL,
  `Unterschrift_Techniker` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Auftrag_ID`),
  KEY `Kunde_ID` (`Kunde_ID`),
  KEY `Mitarbeiter_ID` (`Mitarbeiter_ID`),
  CONSTRAINT `AUFTRAG_ibfk_1` FOREIGN KEY (`Kunde_ID`) REFERENCES `KUNDE` (`Kunde_ID`) ON DELETE SET NULL,
  CONSTRAINT `AUFTRAG_ibfk_2` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `MITARBEITER` (`Mitarbeiter_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `AUFTRAG` WRITE;
/*!40000 ALTER TABLE `AUFTRAG` DISABLE KEYS */;

INSERT INTO `AUFTRAG` (`Auftrag_ID`, `Kunde_ID`, `Mitarbeiter_ID`, `Status`, `KW`, `Installation_geplant`, `Installation_Tag`, `Abbruchdatum`, `Kabeltausch_erledigt`, `Problemfall`, `Abschluss_Techniker`, `Abschluss_Buero`, `Unterschrift_Kunde`, `Unterschrift_Techniker`)
VALUES
	(31,1,1,'Offen','KW40','2023-10-01','2023-10-02',NULL,0,0,0,0,'Kunde1_Sig.png','Techniker1_Sig.png'),
	(32,2,4,'Abgeschlossen','KW41','2023-10-03','2023-10-04',NULL,1,0,1,1,'Kunde2_Sig.png','Techniker2_Sig.png'),
	(33,3,6,'Offen','KW42','2023-10-05','2023-10-06',NULL,0,1,0,0,'Kunde3_Sig.png','Techniker3_Sig.png'),
	(34,4,8,'In Bearbeitung','KW43','2023-10-07','2023-10-08',NULL,1,1,0,0,'Kunde4_Sig.png','Techniker4_Sig.png'),
	(35,5,10,'Abgebrochen','KW44','2023-10-09',NULL,'2023-10-10',0,1,0,0,'Kunde5_Sig.png',NULL),
	(36,6,12,'Abgeschlossen','KW45','2023-10-11','2023-10-12',NULL,1,0,1,1,'Kunde6_Sig.png','Techniker6_Sig.png'),
	(37,7,14,'In Bearbeitung','KW46','2023-10-13','2023-10-14',NULL,0,1,0,0,'Kunde7_Sig.png','Techniker7_Sig.png'),
	(38,8,16,'Abgeschlossen','KW47','2023-10-15','2023-10-16',NULL,1,0,1,1,'Kunde8_Sig.png','Techniker8_Sig.png'),
	(39,9,18,'Offen','KW48','2023-10-17','2023-10-18',NULL,0,1,0,0,'Kunde9_Sig.png','Techniker9_Sig.png'),
	(40,10,20,'Abgeschlossen','KW49','2023-10-19','2023-10-20',NULL,1,0,1,1,'Kunde10_Sig.png','Techniker10_Sig.png'),
	(41,11,1,'Abgebrochen','KW50','2023-10-21',NULL,'2023-10-22',0,1,0,0,'Kunde11_Sig.png',NULL),
	(42,12,4,'Offen','KW51','2023-10-23','2023-10-24',NULL,0,1,0,0,'Kunde12_Sig.png','Techniker12_Sig.png'),
	(43,13,6,'Abgeschlossen','KW52','2023-10-25','2023-10-26',NULL,1,0,1,1,'Kunde13_Sig.png','Techniker13_Sig.png'),
	(44,14,8,'In Bearbeitung','KW01','2023-10-27','2023-10-28',NULL,1,1,0,0,'Kunde14_Sig.png','Techniker14_Sig.png'),
	(45,15,10,'Abgebrochen','KW02','2023-10-29',NULL,'2023-10-30',0,1,0,0,'Kunde15_Sig.png',NULL),
	(46,16,12,'Offen','KW03','2023-11-01','2023-11-02',NULL,0,0,0,0,'Kunde16_Sig.png','Techniker16_Sig.png'),
	(47,17,14,'Abgeschlossen','KW04','2023-11-03','2023-11-04',NULL,1,0,1,1,'Kunde17_Sig.png','Techniker17_Sig.png'),
	(48,18,16,'In Bearbeitung','KW05','2023-11-05','2023-11-06',NULL,1,1,0,0,'Kunde18_Sig.png','Techniker18_Sig.png'),
	(49,19,18,'Offen','KW06','2023-11-07','2023-11-08',NULL,0,1,0,0,'Kunde19_Sig.png','Techniker19_Sig.png'),
	(50,20,20,'Abgeschlossen','KW07','2023-11-09','2023-11-10',NULL,1,0,1,1,'Kunde20_Sig.png','Techniker20_Sig.png'),
	(51,21,1,'In Bearbeitung','KW08','2023-11-11','2023-11-12',NULL,0,1,0,0,'Kunde21_Sig.png','Techniker21_Sig.png'),
	(52,22,4,'Abgeschlossen','KW09','2023-11-13','2023-11-14',NULL,1,0,1,1,'Kunde22_Sig.png','Techniker22_Sig.png'),
	(53,23,6,'Offen','KW10','2023-11-15','2023-11-16',NULL,0,1,0,0,'Kunde23_Sig.png','Techniker23_Sig.png'),
	(54,24,8,'Abgeschlossen','KW11','2023-11-17','2023-11-18',NULL,1,0,1,1,'Kunde24_Sig.png','Techniker24_Sig.png'),
	(55,25,10,'Abgebrochen','KW12','2023-11-19',NULL,'2023-11-20',0,1,0,0,'Kunde25_Sig.png',NULL),
	(56,26,12,'Offen','KW13','2023-11-21','2023-11-22',NULL,0,1,0,0,'Kunde26_Sig.png','Techniker26_Sig.png'),
	(57,27,14,'Abgeschlossen','KW14','2023-11-23','2023-11-24',NULL,1,0,1,1,'Kunde27_Sig.png','Techniker27_Sig.png'),
	(58,28,16,'In Bearbeitung','KW15','2023-11-25','2023-11-26',NULL,1,1,0,0,'Kunde28_Sig.png','Techniker28_Sig.png'),
	(59,29,18,'Offen','KW16','2023-11-27','2023-11-28',NULL,0,1,0,0,'Kunde29_Sig.png','Techniker29_Sig.png'),
	(60,30,20,'Abgeschlossen','KW17','2023-11-29','2023-11-30',NULL,1,0,1,1,'Kunde30_Sig.png','Techniker30_Sig.png');

/*!40000 ALTER TABLE `AUFTRAG` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump GERAET
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GERAET`;

CREATE TABLE `GERAET` (
  `Geraet_ID` int NOT NULL AUTO_INCREMENT,
  `Kunde_ID` int DEFAULT NULL,
  `Typ` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`Geraet_ID`),
  KEY `Kunde_ID` (`Kunde_ID`),
  CONSTRAINT `GERAET_ibfk_1` FOREIGN KEY (`Kunde_ID`) REFERENCES `KUNDE` (`Kunde_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `GERAET` WRITE;
/*!40000 ALTER TABLE `GERAET` DISABLE KEYS */;

INSERT INTO `GERAET` (`Geraet_ID`, `Kunde_ID`, `Typ`, `Status`)
VALUES
	(1,1,'Router','Aktiv'),
	(2,2,'Modem','Defekt'),
	(3,3,'Router','Aktiv'),
	(4,4,'Switch','Inaktiv'),
	(5,5,'Modem','Aktiv'),
	(6,6,'Router','Defekt'),
	(7,7,'Switch','Aktiv'),
	(8,8,'Modem','Inaktiv'),
	(9,9,'Router','Aktiv'),
	(10,10,'Switch','Defekt'),
	(11,11,'Modem','Aktiv'),
	(12,12,'Router','Inaktiv'),
	(13,13,'Switch','Aktiv'),
	(14,14,'Modem','Defekt'),
	(15,15,'Router','Aktiv'),
	(16,16,'Switch','Aktiv'),
	(17,17,'Modem','Inaktiv'),
	(18,18,'Router','Aktiv'),
	(19,19,'Switch','Defekt'),
	(20,20,'Modem','Aktiv'),
	(21,21,'Router','Inaktiv'),
	(22,22,'Switch','Aktiv'),
	(23,23,'Modem','Defekt'),
	(24,24,'Router','Aktiv'),
	(25,25,'Switch','Inaktiv'),
	(26,26,'Modem','Defekt'),
	(27,27,'Router','Aktiv'),
	(28,28,'Switch','Aktiv'),
	(29,29,'Modem','Defekt'),
	(30,30,'Router','Aktiv');

/*!40000 ALTER TABLE `GERAET` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump KOMMENTAR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `KOMMENTAR`;

CREATE TABLE `KOMMENTAR` (
  `Kommentar_ID` int NOT NULL AUTO_INCREMENT,
  `Auftrag_ID` int DEFAULT NULL,
  `Problemfall_Kommentar` text NOT NULL,
  `Kommentar_Datum` date NOT NULL,
  PRIMARY KEY (`Kommentar_ID`),
  KEY `Auftrag_ID` (`Auftrag_ID`),
  CONSTRAINT `KOMMENTAR_ibfk_1` FOREIGN KEY (`Auftrag_ID`) REFERENCES `AUFTRAG` (`Auftrag_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `KOMMENTAR` WRITE;
/*!40000 ALTER TABLE `KOMMENTAR` DISABLE KEYS */;

INSERT INTO `KOMMENTAR` (`Kommentar_ID`, `Auftrag_ID`, `Problemfall_Kommentar`, `Kommentar_Datum`)
VALUES
	(56,31,'Problem mit der Internetverbindung.','2023-10-01'),
	(57,32,'Verzgerung aufgrund fehlender Ersatzteile.','2023-10-02'),
	(58,33,'Kunde nicht anwesend bei der Installation.','2023-10-03'),
	(59,34,'Kabeltausch war erforderlich.','2023-10-04'),
	(60,35,'Installation erfolgreich abgeschlossen.','2023-10-05'),
	(61,36,'Technische Probleme bei der Einrichtung.','2023-10-06'),
	(62,37,'Installation abgebrochen wegen fehlender Genehmigungen.','2023-10-07'),
	(63,38,'Kunde wnscht nderung des Installationsdatums.','2023-10-08'),
	(64,39,'Problem mit der Signalstrke festgestellt.','2023-10-09'),
	(65,40,'Techniker konnte das Gert nicht finden.','2023-10-10'),
	(66,41,'Gert wurde ausgetauscht wegen eines Defekts.','2023-10-11'),
	(67,42,'Installation konnte nicht abgeschlossen werden.','2023-10-12'),
	(68,43,'Kunde hat einen neuen Termin vereinbart.','2023-10-13'),
	(69,44,'Gert wurde erfolgreich installiert.','2023-10-14'),
	(70,45,'Problem bei der Netzwerkkonfiguration.','2023-10-15'),
	(71,46,'Installation abgebrochen, Kunde nicht zu Hause.','2023-10-16'),
	(72,47,'Techniker musste die Arbeiten wegen eines Notfalls unterbrechen.','2023-10-17'),
	(73,48,'Installation abgeschlossen, aber Kunde unzufrieden.','2023-10-18'),
	(74,49,'Probleme mit der Stromversorgung des Gerts.','2023-10-19'),
	(75,50,'Kunde hat die Installation storniert.','2023-10-20'),
	(76,51,'Kabel musste nachtrglich ersetzt werden.','2023-10-21'),
	(77,52,'Installation wegen eines Sturms verschoben.','2023-10-22'),
	(78,53,'Kunde hat ein falsches Gert erhalten.','2023-10-23'),
	(79,54,'Verbindungsprobleme whrend der Installation.','2023-10-24'),
	(80,55,'Installation erfolgreich, Kunde zufrieden.','2023-10-25'),
	(81,56,'Gert war fehlerhaft und musste ausgetauscht werden.','2023-10-26'),
	(82,57,'Probleme mit der Internetverbindung nach der Installation.','2023-10-27'),
	(83,58,'Installation wurde aufgrund von Zeitmangel verschoben.','2023-10-28'),
	(84,59,'Kunde hat die Installation als erfolgreich gemeldet.','2023-10-29'),
	(85,60,'Probleme bei der Konfiguration des Gerts.','2023-10-30');

/*!40000 ALTER TABLE `KOMMENTAR` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump KUNDE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `KUNDE`;

CREATE TABLE `KUNDE` (
  `Kunde_ID` int NOT NULL AUTO_INCREMENT,
  `Kunde_Marktnummer` varchar(50) NOT NULL,
  `Kunde_Strasse` varchar(100) NOT NULL,
  `Kunde_Hausnummer` varchar(10) NOT NULL,
  `Kunde_PLZ` varchar(10) NOT NULL,
  `Kunde_Ort` varchar(100) NOT NULL,
  PRIMARY KEY (`Kunde_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `KUNDE` WRITE;
/*!40000 ALTER TABLE `KUNDE` DISABLE KEYS */;

INSERT INTO `KUNDE` (`Kunde_ID`, `Kunde_Marktnummer`, `Kunde_Strasse`, `Kunde_Hausnummer`, `Kunde_PLZ`, `Kunde_Ort`)
VALUES
	(1,'MN123','Hauptstrasse','1','12345','Berlin'),
	(2,'MN124','Nebenstrasse','12','54321','Hamburg'),
	(3,'MN125','Marktplatz','45','98765','Mnchen'),
	(4,'MN126','Ringstrasse','9','65432','Stuttgart'),
	(5,'MN127','Schlossallee','99','11111','Kln'),
	(6,'MN128','Bahnhofstrasse','10','33333','Frankfurt'),
	(7,'MN129','Waldweg','3','22222','Leipzig'),
	(8,'MN130','Wiesenweg','8','44444','Dresden'),
	(9,'MN131','Bergstrasse','19','55555','Dsseldorf'),
	(10,'MN132','Blumenstrasse','4','66666','Bremen'),
	(11,'MN133','Musterstrasse','5','77777','Hannover'),
	(12,'MN134','Lindenallee','2','88888','Essen'),
	(13,'MN135','Rosenweg','7','99999','Dortmund'),
	(14,'MN136','Friedensplatz','11','10101','Mannheim'),
	(15,'MN137','Kaiserstrasse','13','20202','Karlsruhe'),
	(16,'MN138','Hafenstrasse','14','30303','Mainz'),
	(17,'MN139','Gartenstrasse','15','40404','Aachen'),
	(18,'MN140','Waldstrasse','16','50505','Kassel'),
	(19,'MN141','Parkstrasse','17','60606','Bonn'),
	(20,'MN142','Mhlweg','18','70707','Freiburg'),
	(21,'MN143','Burgstrasse','20','80808','Heidelberg'),
	(22,'MN144','Kirchstrasse','21','90909','Koblenz'),
	(23,'MN145','Schillerstrasse','22','11112','Wuppertal'),
	(24,'MN146','Schulstrasse','23','12121','Potsdam'),
	(25,'MN147','Goethestrasse','24','13131','Erfurt'),
	(26,'MN148','Mozartstrasse','25','14141','Wiesbaden'),
	(27,'MN149','Kleiner Weg','26','15151','Bielefeld'),
	(28,'MN150','Marktstrasse','27','16161','Magdeburg'),
	(29,'MN151','Alte Gasse','28','17171','Rostock'),
	(30,'MN152','Neue Gasse','29','18181','Saarbrcken');

/*!40000 ALTER TABLE `KUNDE` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump MITARBEITER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MITARBEITER`;

CREATE TABLE `MITARBEITER` (
  `Mitarbeiter_ID` int NOT NULL AUTO_INCREMENT,
  `Mitarbeiter_Vorname` varchar(50) NOT NULL,
  `Mitarbeiter_Name` varchar(50) NOT NULL,
  `Mitarbeiter_Rolle` varchar(50) NOT NULL,
  PRIMARY KEY (`Mitarbeiter_ID`),
  UNIQUE KEY `Mitarbeiter_ID` (`Mitarbeiter_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `MITARBEITER` WRITE;
/*!40000 ALTER TABLE `MITARBEITER` DISABLE KEYS */;

INSERT INTO `MITARBEITER` (`Mitarbeiter_ID`, `Mitarbeiter_Vorname`, `Mitarbeiter_Name`, `Mitarbeiter_Rolle`)
VALUES
	(1,'Laura','Becker','Techniker'),
	(2,'Markus','Schneider','Teamleiter'),
	(3,'Julia','Fischer','Bromitarbeiter'),
	(4,'Thomas','Weber','Techniker'),
	(5,'Sophie','Meyer','Bromitarbeiter'),
	(6,'Lukas','Wagner','Techniker'),
	(7,'Emma','Beck','Teamleiter'),
	(8,'Felix','Hoffmann','Techniker'),
	(9,'Mia','Richter','Bromitarbeiter'),
	(10,'Leon','Klein','Techniker'),
	(11,'Lena','Wolf','Bromitarbeiter'),
	(12,'Nico','Schrder','Techniker'),
	(13,'Hannah','Neumann','Teamleiter'),
	(14,'Jan','Schulz','Techniker'),
	(15,'Lisa','Hartmann','Bromitarbeiter'),
	(16,'Kevin','Zimmermann','Techniker'),
	(17,'Marie','Braun','Bromitarbeiter'),
	(18,'Tim','Koch','Techniker'),
	(19,'Nina','Richter','Teamleiter'),
	(20,'Paul','Kaiser','Techniker'),
	(21,'Clara','Walter','Bromitarbeiter');

/*!40000 ALTER TABLE `MITARBEITER` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump PAKET
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PAKET`;

CREATE TABLE `PAKET` (
  `Paket_ID` int NOT NULL AUTO_INCREMENT,
  `Kunde_ID` int DEFAULT NULL,
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`Paket_ID`),
  KEY `Kunde_ID` (`Kunde_ID`),
  CONSTRAINT `PAKET_ibfk_1` FOREIGN KEY (`Kunde_ID`) REFERENCES `KUNDE` (`Kunde_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `PAKET` WRITE;
/*!40000 ALTER TABLE `PAKET` DISABLE KEYS */;

INSERT INTO `PAKET` (`Paket_ID`, `Kunde_ID`, `Status`)
VALUES
	(1,1,'Ausgeliefert'),
	(2,2,'Unterwegs'),
	(3,3,'Zustellung fehlgeschlagen'),
	(4,4,'Ausgeliefert'),
	(5,5,'Unterwegs'),
	(6,6,'Ausgeliefert'),
	(7,7,'Unterwegs'),
	(8,8,'Ausgeliefert'),
	(9,9,'Zustellung fehlgeschlagen'),
	(10,10,'Unterwegs'),
	(11,11,'Ausgeliefert'),
	(12,12,'Unterwegs'),
	(13,13,'Zustellung fehlgeschlagen'),
	(14,14,'Ausgeliefert'),
	(15,15,'Unterwegs'),
	(16,16,'Ausgeliefert'),
	(17,17,'Unterwegs'),
	(18,18,'Zustellung fehlgeschlagen'),
	(19,19,'Ausgeliefert'),
	(20,20,'Unterwegs'),
	(21,21,'Ausgeliefert'),
	(22,22,'Zustellung fehlgeschlagen'),
	(23,23,'Unterwegs'),
	(24,24,'Ausgeliefert'),
	(25,25,'Zustellung fehlgeschlagen'),
	(26,26,'Unterwegs'),
	(27,27,'Ausgeliefert'),
	(28,28,'Unterwegs'),
	(29,29,'Zustellung fehlgeschlagen'),
	(30,30,'Ausgeliefert');

/*!40000 ALTER TABLE `PAKET` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump ROUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ROUTE`;

CREATE TABLE `ROUTE` (
  `Route_ID` int NOT NULL AUTO_INCREMENT,
  `Mitarbeiter_ID` int DEFAULT NULL,
  `Auftrag_ID` int DEFAULT NULL,
  `Installation_Tag` date NOT NULL,
  PRIMARY KEY (`Route_ID`),
  KEY `Mitarbeiter_ID` (`Mitarbeiter_ID`),
  KEY `Auftrag_ID` (`Auftrag_ID`),
  CONSTRAINT `ROUTE_ibfk_1` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `MITARBEITER` (`Mitarbeiter_ID`) ON DELETE SET NULL,
  CONSTRAINT `ROUTE_ibfk_2` FOREIGN KEY (`Auftrag_ID`) REFERENCES `AUFTRAG` (`Auftrag_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `ROUTE` WRITE;
/*!40000 ALTER TABLE `ROUTE` DISABLE KEYS */;

INSERT INTO `ROUTE` (`Route_ID`, `Mitarbeiter_ID`, `Auftrag_ID`, `Installation_Tag`)
VALUES
	(31,1,31,'2023-10-02'),
	(32,4,32,'2023-10-04'),
	(33,6,33,'2023-10-06'),
	(34,8,34,'2023-10-08'),
	(35,10,35,'2023-10-10'),
	(36,12,36,'2023-10-12'),
	(37,14,37,'2023-10-14'),
	(38,16,38,'2023-10-16'),
	(39,18,39,'2023-10-18'),
	(40,20,40,'2023-10-20'),
	(41,1,41,'2023-10-22'),
	(42,4,42,'2023-10-24'),
	(43,6,43,'2023-10-26'),
	(44,8,44,'2023-10-28'),
	(45,10,45,'2023-10-30'),
	(46,12,46,'2023-11-02'),
	(47,14,47,'2023-11-04'),
	(48,16,48,'2023-11-06'),
	(49,18,49,'2023-11-08'),
	(50,20,50,'2023-11-10'),
	(51,1,51,'2023-11-12'),
	(52,4,52,'2023-11-14'),
	(53,6,53,'2023-11-16'),
	(54,8,54,'2023-11-18'),
	(55,10,55,'2023-11-20'),
	(56,12,56,'2023-11-22'),
	(57,14,57,'2023-11-24'),
	(58,16,58,'2023-11-26'),
	(59,18,59,'2023-11-28'),
	(60,20,60,'2023-11-30');

/*!40000 ALTER TABLE `ROUTE` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'USER',
  `Mitarbeiter_ID` int DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_ID` (`user_ID`),
  UNIQUE KEY `username` (`username`),
  KEY `Mitarbeiter_ID` (`Mitarbeiter_ID`),
  CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `MITARBEITER` (`Mitarbeiter_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;

INSERT INTO `USER` (`user_ID`, `username`, `password`, `role`, `Mitarbeiter_ID`)
VALUES
	(47,'laura.becker','passwort123','Techniker',1),
	(48,'markus.schneider','passwort123','Teamleiter',2),
	(49,'julia.fischer','passwort123','Bromitarbeiter',3),
	(50,'thomas.weber','passwort123','Techniker',4),
	(51,'sophie.meyer','passwort123','Bromitarbeiter',5),
	(52,'lukas.wagner','passwort123','Techniker',6),
	(53,'emma.beck','passwort123','Teamleiter',7),
	(54,'felix.hoffmann','passwort123','Techniker',8),
	(55,'mia.richter','passwort123','Bromitarbeiter',9),
	(56,'leon.klein','passwort123','Techniker',10),
	(57,'lena.wolf','passwort123','Bromitarbeiter',11),
	(58,'nico.schroeder','passwort123','Techniker',12),
	(59,'hannah.neumann','passwort123','Teamleiter',13),
	(60,'jan.schulz','passwort123','Techniker',14),
	(61,'lisa.hartmann','passwort123','Bromitarbeiter',15),
	(62,'kevin.zimmermann','passwort123','Techniker',16),
	(63,'marie.braun','passwort123','Bromitarbeiter',17),
	(64,'tim.koch','passwort123','Techniker',18),
	(65,'nina.richter','passwort123','Teamleiter',19),
	(66,'paul.kaiser','passwort123','Techniker',20),
	(67,'clara.walter','passwort123','Bromitarbeiter',21);

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;


# Tabellen-Dump _prisma_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_prisma_migrations`;

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`)
VALUES
	('17e9af6a-3088-4da4-a138-c47a0df4d490','ee1417f60bb05d9ba55fb3ea6fb6b094aeaba8bba9ee2bedcea5483282c88b69','2024-09-19 20:28:55.816','20240919202854_add_user_mitarbeiter_relation',NULL,NULL,'2024-09-19 20:28:54.840',1);

/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
