-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lut 2023, 09:50
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zoo`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klatka`
--

CREATE TABLE `klatka` (
  `nr_klatki` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `powierzchnia` float DEFAULT NULL,
  `wysokosc` float DEFAULT 2.5,
  `typ` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekun`
--

CREATE TABLE `opiekun` (
  `nazwisko` text NOT NULL,
  `imie` text NOT NULL,
  `placa` decimal(7,2) DEFAULT NULL CHECK (`placa` <= 99999.99),
  `data_zatrudnienia` date NOT NULL,
  `na_zwolnieniu` tinyint(1) DEFAULT NULL,
  `id_opiekuna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwierze`
--

CREATE TABLE `zwierze` (
  `nazwa` text NOT NULL,
  `gatunek` text NOT NULL,
  `zdjecie` blob DEFAULT NULL,
  `rok_rejestracji` year(4) DEFAULT NULL,
  `id_opiekuna` int(11) DEFAULT NULL,
  `nr_klatki` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klatka`
--
ALTER TABLE `klatka`
  ADD PRIMARY KEY (`nr_klatki`);

--
-- Indeksy dla tabeli `opiekun`
--
ALTER TABLE `opiekun`
  ADD PRIMARY KEY (`id_opiekuna`);

--
-- Indeksy dla tabeli `zwierze`
--
ALTER TABLE `zwierze`
  ADD UNIQUE KEY `nazwa` (`nazwa`) USING HASH,
  ADD KEY `zwierze_opiekun_fk` (`id_opiekuna`),
  ADD KEY `nr_klatki` (`nr_klatki`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `zwierze`
--
ALTER TABLE `zwierze`
  ADD CONSTRAINT `zwierze_ibfk_1` FOREIGN KEY (`nr_klatki`) REFERENCES `klatka` (`nr_klatki`),
  ADD CONSTRAINT `zwierze_opiekun_fk` FOREIGN KEY (`id_opiekuna`) REFERENCES `opiekun` (`id_opiekuna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
