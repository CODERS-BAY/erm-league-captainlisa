-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:32
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `soccer_league`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `club`
--

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL,
  `clublist_id` int(11) DEFAULT NULL,
  `match_schedule_id` int(11) DEFAULT NULL,
  `league_list_id` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `members` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clublist`
--

CREATE TABLE `clublist` (
  `clublist_id` int(11) NOT NULL,
  `personal_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clubmember`
--

CREATE TABLE `clubmember` (
  `personal_id` int(11) NOT NULL,
  `clublist_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `is_trainer` tinyint(1) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `league`
--

CREATE TABLE `league` (
  `league_id` int(11) NOT NULL,
  `league_list_id` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `league_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `league_list`
--

CREATE TABLE `league_list` (
  `league_list_id` int(11) NOT NULL,
  `league_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `match_schedule`
--

CREATE TABLE `match_schedule` (
  `match_schedule_id` int(11) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `challenger_id` int(11) DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL,
  `starting_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referee`
--

CREATE TABLE `referee` (
  `ref_id` int(11) NOT NULL,
  `ref_schedule_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `referee_schedule`
--

CREATE TABLE `referee_schedule` (
  `ref_schedule_id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `soccer_match`
--

CREATE TABLE `soccer_match` (
  `match_id` int(11) NOT NULL,
  `ref_schedule_id` int(11) DEFAULT NULL,
  `match_schedule_id` int(11) DEFAULT NULL,
  `result` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `match_schedule_id` int(11) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`),
  ADD KEY `clublist_id` (`clublist_id`),
  ADD KEY `match_schedule_id` (`match_schedule_id`),
  ADD KEY `league_list_id` (`league_list_id`);

--
-- Indizes für die Tabelle `clublist`
--
ALTER TABLE `clublist`
  ADD PRIMARY KEY (`clublist_id`);

--
-- Indizes für die Tabelle `clubmember`
--
ALTER TABLE `clubmember`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `clublist_id` (`clublist_id`);

--
-- Indizes für die Tabelle `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`league_id`),
  ADD KEY `league_list_id` (`league_list_id`);

--
-- Indizes für die Tabelle `league_list`
--
ALTER TABLE `league_list`
  ADD PRIMARY KEY (`league_list_id`);

--
-- Indizes für die Tabelle `match_schedule`
--
ALTER TABLE `match_schedule`
  ADD PRIMARY KEY (`match_schedule_id`);

--
-- Indizes für die Tabelle `referee`
--
ALTER TABLE `referee`
  ADD PRIMARY KEY (`ref_id`),
  ADD KEY `ref_schedule_id` (`ref_schedule_id`);

--
-- Indizes für die Tabelle `referee_schedule`
--
ALTER TABLE `referee_schedule`
  ADD PRIMARY KEY (`ref_schedule_id`);

--
-- Indizes für die Tabelle `soccer_match`
--
ALTER TABLE `soccer_match`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `ref_schedule_id` (`ref_schedule_id`),
  ADD KEY `match_schedule_id` (`match_schedule_id`);

--
-- Indizes für die Tabelle `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`),
  ADD KEY `match_schedule_id` (`match_schedule_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`clublist_id`) REFERENCES `clublist` (`clublist_id`),
  ADD CONSTRAINT `club_ibfk_2` FOREIGN KEY (`match_schedule_id`) REFERENCES `match_schedule` (`match_schedule_id`),
  ADD CONSTRAINT `club_ibfk_3` FOREIGN KEY (`league_list_id`) REFERENCES `league_list` (`league_list_id`);

--
-- Constraints der Tabelle `clubmember`
--
ALTER TABLE `clubmember`
  ADD CONSTRAINT `clubmember_ibfk_1` FOREIGN KEY (`clublist_id`) REFERENCES `clublist` (`clublist_id`);

--
-- Constraints der Tabelle `league`
--
ALTER TABLE `league`
  ADD CONSTRAINT `league_ibfk_1` FOREIGN KEY (`league_list_id`) REFERENCES `league_list` (`league_list_id`);

--
-- Constraints der Tabelle `referee`
--
ALTER TABLE `referee`
  ADD CONSTRAINT `referee_ibfk_1` FOREIGN KEY (`ref_schedule_id`) REFERENCES `referee_schedule` (`ref_schedule_id`);

--
-- Constraints der Tabelle `soccer_match`
--
ALTER TABLE `soccer_match`
  ADD CONSTRAINT `soccer_match_ibfk_1` FOREIGN KEY (`ref_schedule_id`) REFERENCES `referee_schedule` (`ref_schedule_id`),
  ADD CONSTRAINT `soccer_match_ibfk_2` FOREIGN KEY (`match_schedule_id`) REFERENCES `match_schedule` (`match_schedule_id`);

--
-- Constraints der Tabelle `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`match_schedule_id`) REFERENCES `match_schedule` (`match_schedule_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
