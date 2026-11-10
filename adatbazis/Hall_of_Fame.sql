-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2026 at 04:39 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hall_of_fame`
--

-- --------------------------------------------------------

--
-- Table structure for table `beallitasok`
--

CREATE TABLE `beallitasok` (
  `id` int NOT NULL,
  `fejlec_szoveg` varchar(60) NOT NULL,
  `logo_url` text NOT NULL,
  `iskola_neve` varchar(60) NOT NULL,
  `helyszin` varchar(60) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `cikk`
--

CREATE TABLE `cikk` (
  `cikk_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cim` varchar(200) NOT NULL,
  `cikk_tartalom` text NOT NULL,
  `letrehozas_ideje` time NOT NULL,
  `versenyfotok` text
) ;

-- --------------------------------------------------------

--
-- Table structure for table `diakok`
--

CREATE TABLE `diakok` (
  `diak_id` int NOT NULL,
  `diak_vezeteknev` varchar(60) NOT NULL,
  `diak_keresztnev` varchar(60) NOT NULL,
  `foto_url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `eredmeny_id` int NOT NULL,
  `diak_id` int NOT NULL,
  `verseny_id` int NOT NULL,
  `tanev_id` int NOT NULL,
  `cikk_id` int NOT NULL,
  `konkret_eredmeny` varchar(200) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `tanarok`
--

CREATE TABLE `tanarok` (
  `tanar_id` int NOT NULL,
  `tanar_vezeteknev` varchar(60) NOT NULL,
  `tanar_keresztnev` varchar(60) NOT NULL,
  `profilkep` text
) ;

-- --------------------------------------------------------

--
-- Table structure for table `tanar_felkeszit_eredmeny`
--

CREATE TABLE `tanar_felkeszit_eredmeny` (
  `tanar_id` int NOT NULL,
  `eredmeny_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tanev`
--

CREATE TABLE `tanev` (
  `tanev_id` int NOT NULL,
  `megnevezes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `felhasznalonev` varchar(60) NOT NULL,
  `jelszo` varchar(60) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `user_kezeli_eredmeny`
--

CREATE TABLE `user_kezeli_eredmeny` (
  `user_id` int NOT NULL,
  `eredmeny_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `versenyek`
--

CREATE TABLE `versenyek` (
  `verseny_id` int NOT NULL,
  `verseny_neve` varchar(100) NOT NULL,
  `lokalis` tinyint(1) NOT NULL,
  `regionalis` tinyint(1) NOT NULL,
  `orszagos` tinyint(1) NOT NULL,
  `nemzetkozi` tinyint(1) NOT NULL
) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beallitasok`
--
ALTER TABLE `beallitasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cikk`
--
ALTER TABLE `cikk`
  ADD PRIMARY KEY (`cikk_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `diakok`
--
ALTER TABLE `diakok`
  ADD PRIMARY KEY (`diak_id`);

--
-- Indexes for table `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD PRIMARY KEY (`eredmeny_id`),
  ADD KEY `diak_id` (`diak_id`),
  ADD KEY `verseny_id` (`verseny_id`),
  ADD KEY `tanev_id` (`tanev_id`),
  ADD KEY `cikk_id` (`cikk_id`);

--
-- Indexes for table `tanarok`
--
ALTER TABLE `tanarok`
  ADD PRIMARY KEY (`tanar_id`);

--
-- Indexes for table `tanar_felkeszit_eredmeny`
--
ALTER TABLE `tanar_felkeszit_eredmeny`
  ADD PRIMARY KEY (`tanar_id`,`eredmeny_id`),
  ADD KEY `eredmeny_id` (`eredmeny_id`);

--
-- Indexes for table `tanev`
--
ALTER TABLE `tanev`
  ADD PRIMARY KEY (`tanev_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `felhasznalonev` (`felhasznalonev`);

--
-- Indexes for table `user_kezeli_eredmeny`
--
ALTER TABLE `user_kezeli_eredmeny`
  ADD PRIMARY KEY (`user_id`,`eredmeny_id`),
  ADD KEY `eredmeny_id` (`eredmeny_id`);

--
-- Indexes for table `versenyek`
--
ALTER TABLE `versenyek`
  ADD PRIMARY KEY (`verseny_id`),
  ADD UNIQUE KEY `verseny_neve` (`verseny_neve`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beallitasok`
--
ALTER TABLE `beallitasok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cikk`
--
ALTER TABLE `cikk`
  MODIFY `cikk_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diakok`
--
ALTER TABLE `diakok`
  MODIFY `diak_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eredmenyek`
--
ALTER TABLE `eredmenyek`
  MODIFY `eredmeny_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tanarok`
--
ALTER TABLE `tanarok`
  MODIFY `tanar_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tanev`
--
ALTER TABLE `tanev`
  MODIFY `tanev_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `versenyek`
--
ALTER TABLE `versenyek`
  MODIFY `verseny_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cikk`
--
ALTER TABLE `cikk`
  ADD CONSTRAINT `cikk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `eredmenyek`
--
ALTER TABLE `eredmenyek`
  ADD CONSTRAINT `eredmenyek_ibfk_1` FOREIGN KEY (`diak_id`) REFERENCES `diakok` (`diak_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eredmenyek_ibfk_2` FOREIGN KEY (`verseny_id`) REFERENCES `versenyek` (`verseny_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eredmenyek_ibfk_3` FOREIGN KEY (`tanev_id`) REFERENCES `tanev` (`tanev_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eredmenyek_ibfk_4` FOREIGN KEY (`cikk_id`) REFERENCES `cikk` (`cikk_id`) ON DELETE CASCADE;

--
-- Constraints for table `tanar_felkeszit_eredmeny`
--
ALTER TABLE `tanar_felkeszit_eredmeny`
  ADD CONSTRAINT `tanar_felkeszit_eredmeny_ibfk_1` FOREIGN KEY (`tanar_id`) REFERENCES `tanarok` (`tanar_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tanar_felkeszit_eredmeny_ibfk_2` FOREIGN KEY (`eredmeny_id`) REFERENCES `eredmenyek` (`eredmeny_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_kezeli_eredmeny`
--
ALTER TABLE `user_kezeli_eredmeny`
  ADD CONSTRAINT `user_kezeli_eredmeny_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_kezeli_eredmeny_ibfk_2` FOREIGN KEY (`eredmeny_id`) REFERENCES `eredmenyek` (`eredmeny_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
