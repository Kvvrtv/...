-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Jan 2023 um 10:15
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `m151`
--
CREATE DATABASE IF NOT EXISTS `m151` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `m151`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_benutzer`
--

DROP TABLE IF EXISTS `tbl_benutzer`;
CREATE TABLE `tbl_benutzer` (
  `PK_Benutzer` int(11) NOT NULL,
  `Vorname` varchar(80) NOT NULL,
  `Nachname` varchar(80) NOT NULL,
  `EMail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_farbe`
--

DROP TABLE IF EXISTS `tbl_farbe`;
CREATE TABLE `tbl_farbe` (
  `PK_Farbe` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorie`
--

DROP TABLE IF EXISTS `tbl_kategorie`;
CREATE TABLE `tbl_kategorie` (
  `PK_Kategorie` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produkt`
--

DROP TABLE IF EXISTS `tbl_produkt`;
CREATE TABLE `tbl_produkt` (
  `PK_Produkt` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Preis` float NOT NULL,
  `Anzahl` int(11) NOT NULL COMMENT 'Anzahl im Lager ',
  `FK_Kategorie` int(11) DEFAULT NULL,
  `FK_Farbe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_produktinwarenkorb`
--

DROP TABLE IF EXISTS `tbl_produktinwarenkorb`;
CREATE TABLE `tbl_produktinwarenkorb` (
  `FK_Warenkorb` int(11) NOT NULL,
  `FK_Produkt` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_warenkorb`
--

DROP TABLE IF EXISTS `tbl_warenkorb`;
CREATE TABLE `tbl_warenkorb` (
  `PK_Warenkorb` int(11) NOT NULL,
  `FK_Benutzer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_benutzer`
--
ALTER TABLE `tbl_benutzer`
  ADD PRIMARY KEY (`PK_Benutzer`);

--
-- Indizes für die Tabelle `tbl_farbe`
--
ALTER TABLE `tbl_farbe`
  ADD PRIMARY KEY (`PK_Farbe`);

--
-- Indizes für die Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  ADD PRIMARY KEY (`PK_Kategorie`);

--
-- Indizes für die Tabelle `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
  ADD PRIMARY KEY (`PK_Produkt`),
  ADD KEY `FK_Farbe` (`FK_Farbe`),
  ADD KEY `FK_Kategorie` (`FK_Kategorie`);

--
-- Indizes für die Tabelle `tbl_produktinwarenkorb`
--
ALTER TABLE `tbl_produktinwarenkorb`
  ADD KEY `FK_Produkt` (`FK_Produkt`),
  ADD KEY `FK_Warenkorb` (`FK_Warenkorb`);

--
-- Indizes für die Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
  ADD PRIMARY KEY (`PK_Warenkorb`),
  ADD KEY `FK_Benutzer` (`FK_Benutzer`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_benutzer`
--
ALTER TABLE `tbl_benutzer`
  MODIFY `PK_Benutzer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_farbe`
--
ALTER TABLE `tbl_farbe`
  MODIFY `PK_Farbe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_kategorie`
--
ALTER TABLE `tbl_kategorie`
  MODIFY `PK_Kategorie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
  MODIFY `PK_Produkt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
  MODIFY `PK_Warenkorb` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
  ADD CONSTRAINT `tbl_produkt_ibfk_1` FOREIGN KEY (`FK_Farbe`) REFERENCES `tbl_farbe` (`PK_Farbe`),
  ADD CONSTRAINT `tbl_produkt_ibfk_2` FOREIGN KEY (`FK_Kategorie`) REFERENCES `tbl_farbe` (`PK_Farbe`);

--
-- Constraints der Tabelle `tbl_produktinwarenkorb`
--
ALTER TABLE `tbl_produktinwarenkorb`
  ADD CONSTRAINT `tbl_produktinwarenkorb_ibfk_1` FOREIGN KEY (`FK_Produkt`) REFERENCES `tbl_produkt` (`PK_Produkt`),
  ADD CONSTRAINT `tbl_produktinwarenkorb_ibfk_2` FOREIGN KEY (`FK_Warenkorb`) REFERENCES `tbl_warenkorb` (`PK_Warenkorb`);

--
-- Constraints der Tabelle `tbl_warenkorb`
--
ALTER TABLE `tbl_warenkorb`
  ADD CONSTRAINT `tbl_warenkorb_ibfk_1` FOREIGN KEY (`FK_Benutzer`) REFERENCES `tbl_benutzer` (`PK_Benutzer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
