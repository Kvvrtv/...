-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Jan 2023 um 23:21
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 8.0.9

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `IDEvent` int(11) NOT NULL COMMENT 'PK',
  `Datum` varchar(10) NOT NULL COMMENT 'dd/mm/yyyy',
  `Beruf` varchar(28) NOT NULL COMMENT 'Infomatiker EFZ Applikation/Mediamtiker EFZ',
  `freiePlaetze` int(11) NOT NULL,
  `MaxPlaetze` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`IDEvent`, `Datum`, `Beruf`, `freiePlaetze`, `MaxPlaetze`) VALUES
(12, '18.02.2020', 'Infomatiker EFZ Applikation', 1, 24),
(13, '20.02.2020', 'Mediamatiker EFZ', 0, 2),
(15, '11.04.2020', 'Infomatiker EFZ Applikation', 2, 24);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personen`
--

DROP TABLE IF EXISTS `personen`;
CREATE TABLE `personen` (
  `IDPerson` int(11) NOT NULL COMMENT 'PK',
  `Geschlecht` varchar(7) NOT NULL COMMENT 'Frau/Mann/anderes',
  `Nachname` varchar(80) NOT NULL,
  `Vorname` varchar(80) NOT NULL,
  `Geburtstag` varchar(10) NOT NULL COMMENT 'dd.mm.yyyy',
  `Schule` varchar(80) NOT NULL,
  `Klasse` varchar(21) NOT NULL,
  `Niveau` varchar(5) NOT NULL,
  `PLZ` int(11) NOT NULL COMMENT '4 stellig',
  `Ort` varchar(80) NOT NULL,
  `Strasse` varchar(80) NOT NULL,
  `Hausnummer` varchar(5) NOT NULL,
  `ZusatzStrasse` varchar(80) DEFAULT NULL,
  `Telefon` varchar(17) NOT NULL,
  `EMail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `personen`
--

INSERT INTO `personen` (`IDPerson`, `Geschlecht`, `Nachname`, `Vorname`, `Geburtstag`, `Schule`, `Klasse`, `Niveau`, `PLZ`, `Ort`, `Strasse`, `Hausnummer`, `ZusatzStrasse`, `Telefon`, `EMail`) VALUES
(194, 'Frau', 'Balenthiran', 'Keerthika', '12/02/2002', 'greg', 'yfb ', 'drh', 8952, 'Schlieren', 'Schulydefrew', '45', 'Schulstras', '+41 078404417', 'banukaash.balenthiran@gmail.com'),
(195, 'Mann', 'Brechbühler', 'Nicole', '15/12/2001', 'hnmkdgämn', 'syegr', 'yfdbg', 6353, 'Cham', 'Kleinweid', '3a', 'Schulstrasse', '+41 051541654', 'keerthika.balenthiran@hotmail.com'),
(196, 'anderes', 'Balenthiran', 'Shanuka', '08/05/2001', 'greg', 'hdxr', 'gtrt', 8952, 'hallo miteinander', 'Schulstrassea', '45', 'Schulstrasse 3a', '+41 784044174', 'banukaash.balenthiran@gmail.com'),
(197, 'Mann', 'Balenthiran', 'Keerthi', '11/11/1111', 'greg', 'syegr', 'arg', 8952, 'Schlieren', 'Schulstrasse', '45', 'Schulstras', '+41 541784174', 'banukaash.balenthiran@gmail.com'),
(198, 'Mann', 'Balenthiran', 'Keerthi', '11/11/1111', 'greg', 'syegr', 'arg', 8952, 'Schlieren', 'Schulstrasse', '45', 'Schulstras', '+41 541784174', 'banukaash.balenthiran@gmail.com'),
(199, 'Mann', 'Balenthiran', 'Keerthi', '11/11/1111', 'greg', 'syegr', 'ae', 8952, 'Schlieren', 'Schulstrass', '3', '', '+41 784044174', 'banukaash.balenthiran@gmail.com'),
(200, 'Frau', 'Balenthiran', 'Keerthika', '11/11/1111', 'hnmkdgämn', 'syegr', 'ae', 8952, 'Schlieren', 'Schulstrasse ', '3a', 'Schulst', '+41 781955959', 'keerthika.balenthiran@hotmail.com'),
(201, 'Frau', 'Balenthiran', 'Keerthika', '04/01/2001', 'TBZ', 'APC20', 'Sek A', 8952, 'Schlieren', 'Schulstrasse', '3a', 'Schulstrasse', '+41 791955854', 'keerthika.balenthiran@hotmail.com'),
(202, 'Frau', 'Balenthiran', 'Keerthika', '04/01/2001', 'TBZ', 'APC20', 'Sek A', 8952, 'Schlieren', 'Schulstrasse', '3a', 'Schulstrasse', '+41 791955854', 'keerthika.balenthiran@hotmail.com'),
(203, 'Frau', 'Balenthiran', 'Keerthika', '04/01/2001', 'TBZ', 'APC20', 'Sek A', 8952, 'Schlieren', 'Schulstrasse', '3a', 'Schulstrasse', '+41 791955854', 'keerthika.balenthiran@hotmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zusammenfassung`
--

DROP TABLE IF EXISTS `zusammenfassung`;
CREATE TABLE `zusammenfassung` (
  `IDevent_personen` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL COMMENT 'FK',
  `EventID` int(11) NOT NULL COMMENT 'FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `zusammenfassung`
--

INSERT INTO `zusammenfassung` (`IDevent_personen`, `PersonID`, `EventID`) VALUES
(11, 194, 12),
(12, 195, 12),
(13, 196, 15),
(14, 197, 15),
(15, 197, 15),
(16, 199, 12),
(17, 200, 12),
(18, 201, 12);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`IDEvent`);

--
-- Indizes für die Tabelle `personen`
--
ALTER TABLE `personen`
  ADD PRIMARY KEY (`IDPerson`);

--
-- Indizes für die Tabelle `zusammenfassung`
--
ALTER TABLE `zusammenfassung`
  ADD PRIMARY KEY (`IDevent_personen`),
  ADD KEY `EventID` (`EventID`),
  ADD KEY `PersonID` (`PersonID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `IDEvent` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `personen`
--
ALTER TABLE `personen`
  MODIFY `IDPerson` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK', AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT für Tabelle `zusammenfassung`
--
ALTER TABLE `zusammenfassung`
  MODIFY `IDevent_personen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `zusammenfassung`
--
ALTER TABLE `zusammenfassung`
  ADD CONSTRAINT `zusammenfassung_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`IDEvent`),
  ADD CONSTRAINT `zusammenfassung_ibfk_2` FOREIGN KEY (`PersonID`) REFERENCES `personen` (`IDPerson`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
