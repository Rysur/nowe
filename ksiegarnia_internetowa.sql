-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Lut 2023, 13:39
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
-- Baza danych: `ksiegarnia_internetowa`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `id_autora` int(11) NOT NULL,
  `imie` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `narodowsc` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `okres_tworzenia` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `jezyk` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `rodzaj_tworczosci` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `osiagniecia` char(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `autor`
--

INSERT INTO `autor` (`id_autora`, `imie`, `nazwisko`, `narodowsc`, `okres_tworzenia`, `jezyk`, `rodzaj_tworczosci`, `osiagniecia`) VALUES
(1, 'Adam', 'Mickiewicz', 'Polska', '1830-1900', 'Polski', 'Dramat', 'Nagroda Nobla'),
(2, 'Władysław', 'Reymont', 'Polska', '1890-1924', 'Polski', 'Powieści', 'Literacka Nagroda Nobla');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktura`
--

CREATE TABLE `faktura` (
  `nr_faktury` int(11) NOT NULL,
  `sposob_platnosci` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `data_wystawienia_faktury` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `faktura`
--

INSERT INTO `faktura` (`nr_faktury`, `sposob_platnosci`, `data_wystawienia_faktury`) VALUES
(1, 'przelew', '2022-12-02'),
(2, 'Gotówka', '2022-12-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `klient_id` int(10) UNSIGNED NOT NULL,
  `nazwisko` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `imie` text COLLATE utf8_unicode_ci NOT NULL,
  `kod_pocztowy` text COLLATE utf8_unicode_ci NOT NULL,
  `ulica` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `nr_domu` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `miejscowosc` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `pesel` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` int(9) NOT NULL,
  `adres_e_mail` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`klient_id`, `nazwisko`, `imie`, `kod_pocztowy`, `ulica`, `nr_domu`, `miejscowosc`, `pesel`, `telefon`, `adres_e_mail`) VALUES
(2, 'Kaczmarek', 'Oskar', '64-200', '-', '59', 'Adamowo', '2147483647', 999999999, 'oskar.kaczmarek.2019@zszwolsztyn.net'),
(3, 'Kaczmarek', 'Miłosz', '64-200', '-', '12', 'Adamowo', '2147483647', 999999999, 'njdanda@gmail.com'),
(4, 'Żok', 'Miłosz', '64-200', 'Zielona', '123', 'Wolsztyn', '2147483647', 999999999, 'Zok@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_autora` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cena` float(4,2) DEFAULT NULL,
  `wydawnictwo` text COLLATE utf8_unicode_ci NOT NULL,
  `temat` text COLLATE utf8_unicode_ci NOT NULL,
  `miejsce_wydania` text COLLATE utf8_unicode_ci NOT NULL,
  `jezyk_wydania` text COLLATE utf8_unicode_ci NOT NULL,
  `opis_ksiazki` text COLLATE utf8_unicode_ci NOT NULL,
  `rok_wydania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id_ksiazki`, `tytul`, `id_autora`, `cena`, `wydawnictwo`, `temat`, `miejsce_wydania`, `jezyk_wydania`, `opis_ksiazki`, `rok_wydania`) VALUES
(2, 'Chłopi', '2', 23.00, 'PWN', 'Wieś', 'Polska', 'POlski', 'o wsi', '2012-12-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_zamowienia`
--

CREATE TABLE `ksiazki_zamowienia` (
  `id_zamowienia` int(10) UNSIGNED NOT NULL,
  `id_ksiazki` int(13) NOT NULL,
  `liczba_egzemplarzy` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `ksiazki_zamowienia`
--

INSERT INTO `ksiazki_zamowienia` (`id_zamowienia`, `id_ksiazki`, `liczba_egzemplarzy`) VALUES
(1, 1, 1),
(2, 1, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(10) UNSIGNED NOT NULL,
  `data_zlozenia_zamowienia` date NOT NULL,
  `data_wyslania` date NOT NULL,
  `koszt_wysylki` float(6,2) NOT NULL,
  `id_klienta` int(10) UNSIGNED NOT NULL,
  `id_faktury` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `data_zlozenia_zamowienia`, `data_wyslania`, `koszt_wysylki`, `id_klienta`, `id_faktury`) VALUES
(1, '2022-12-01', '2022-12-04', 4.55, 2, '1'),
(2, '2022-12-02', '2022-12-15', 7.00, 3, '2');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autora`);

--
-- Indeksy dla tabeli `faktura`
--
ALTER TABLE `faktura`
  ADD PRIMARY KEY (`nr_faktury`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id_ksiazki`);

--
-- Indeksy dla tabeli `ksiazki_zamowienia`
--
ALTER TABLE `ksiazki_zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`,`id_ksiazki`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `faktura`
--
ALTER TABLE `faktura`
  MODIFY `nr_faktury` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `klient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
