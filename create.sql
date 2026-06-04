-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vytvořeno: Pon 11. kvě 2026, 12:08
-- Verze serveru: 5.7.11
-- Verze PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `autosalon`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `pobocky`
--

CREATE TABLE `pobocky` (
  `id_pobocky` int(11) NOT NULL,
  `nazev_pobocky` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `mesto` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `adresa` varchar(150) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `pobocky`
--

INSERT INTO `pobocky` (`id_pobocky`, `nazev_pobocky`, `mesto`, `adresa`, `telefon`) VALUES
(1, 'Centrála Praha', 'Praha', 'V Olšinách 15', '+420 222 333 444'),
(2, 'Pobočka Brno', 'Brno', 'Vídeňská 100', '+420 541 222 333'),
(3, 'Ostrava - Jih', 'Ostrava', 'Ruská 5', '+420 596 111 222'),
(4, 'Plzeň - Showroom', 'Plzeň', 'Domažlická 12', '+420 377 444 555'),
(5, 'Liberec Auto', 'Liberec', 'Tanvaldská 40', '+420 485 111 222'),
(6, 'České Budějovice', 'České Budějovice', 'Lidická 20', '+420 387 333 444'),
(7, 'Hradec Králové', 'Hradec Králové', 'Rašínova 1', '+420 495 555 666');

-- --------------------------------------------------------

--
-- Struktura tabulky `prodeje`
--

CREATE TABLE `prodeje` (
  `id_prodeje` int(11) NOT NULL,
  `datum_prodeje` datetime DEFAULT NULL,
  `finalni_cena` decimal(12,2) NOT NULL,
  `zpusob_platby` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL,
  `id_vozidla` int(11) DEFAULT NULL,
  `id_zakaznika` int(11) DEFAULT NULL,
  `id_zamestnance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `prodeje`
--

INSERT INTO `prodeje` (`id_prodeje`, `datum_prodeje`, `finalni_cena`, `zpusob_platby`, `id_vozidla`, `id_zakaznika`, `id_zamestnance`) VALUES
(1, '2024-02-01 10:30:00', '3150000.00', 'prevod', 1, 1, 1),
(2, '2024-02-20 14:00:00', '6450000.00', 'hotove', 2, 2, 2),
(3, '2024-03-05 11:15:00', '2750000.00', 'leasing', 3, 3, 3),
(4, '2024-03-15 09:45:00', '4850000.00', 'prevod', 4, 4, 6),
(5, '2024-04-10 16:20:00', '2600000.00', 'leasing', 5, 5, 1),
(6, '2024-04-25 13:10:00', '820000.00', 'hotove', 6, 6, 6),
(7, '2024-05-05 10:00:00', '7100000.00', 'prevod', 7, 7, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `servisni_zaznamy`
--

CREATE TABLE `servisni_zaznamy` (
  `id_vozidla` int(11) NOT NULL,
  `cislo_zaznamu` int(11) NOT NULL,
  `datum_servisu` date NOT NULL,
  `popis_prace` text COLLATE utf8mb4_czech_ci,
  `cena_opravy` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `servisni_zaznamy`
--

INSERT INTO `servisni_zaznamy` (`id_vozidla`, `cislo_zaznamu`, `datum_servisu`, `popis_prace`, `cena_opravy`) VALUES
(1, 1, '2024-05-01', 'Výměna oleje a filtrů', '12000.00'),
(1, 2, '2024-08-10', 'Kontrola brzdové kapaliny', '2500.00'),
(3, 1, '2024-04-15', 'Pravidelná servisní prohlídka', '18000.00'),
(4, 1, '2024-01-20', 'Instalace GPS lokátoru', '15000.00'),
(6, 1, '2023-11-20', 'Výměna zimních pneumatik', '4500.00'),
(6, 2, '2024-05-15', 'Oprava klimatizace', '8000.00'),
(7, 1, '2024-06-01', 'Garanční prohlídka', '0.00');

-- --------------------------------------------------------

--
-- Struktura tabulky `vozidla`
--

CREATE TABLE `vozidla` (
  `id_vozidla` int(11) NOT NULL,
  `vin` varchar(17) COLLATE utf8mb4_czech_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `rok_vyroby` int(11) DEFAULT NULL,
  `cena` decimal(12,2) NOT NULL,
  `najezd_km` int(11) DEFAULT '0',
  `id_znacky` int(11) NOT NULL,
  `id_pobocky` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vozidla`
--

INSERT INTO `vozidla` (`id_vozidla`, `vin`, `model`, `rok_vyroby`, `cena`, `najezd_km`, `id_znacky`, `id_pobocky`) VALUES
(1, 'VIN12345678901234', 'M5 Competition', 2023, '3200000.00', 1500, 1, 1),
(2, 'VIN98765432109876', '911 Turbo S', 2024, '6500000.00', 100, 2, 1),
(3, 'VIN11122233344455', 'RS6 Avant', 2022, '2800000.00', 25000, 3, 2),
(4, 'VIN44455566677788', 'G-Wagon G63', 2023, '4900000.00', 500, 4, 3),
(5, 'VIN99988877766655', 'Model S Plaid', 2024, '2600000.00', 50, 5, 1),
(6, 'VIN66655544433322', 'Superb L&K', 2021, '850000.00', 65000, 6, 4),
(7, 'VIN00011122233344', 'F8 Tributo', 2022, '7200000.00', 1200, 7, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `vozidla_vybava`
--

CREATE TABLE `vozidla_vybava` (
  `id_vozidla` int(11) NOT NULL,
  `id_vybavy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vozidla_vybava`
--

INSERT INTO `vozidla_vybava` (`id_vozidla`, `id_vybavy`) VALUES
(1, 1),
(2, 1),
(4, 1),
(3, 3),
(1, 4),
(7, 4),
(2, 7);

-- --------------------------------------------------------

--
-- Struktura tabulky `vybava`
--

CREATE TABLE `vybava` (
  `id_vybavy` int(11) NOT NULL,
  `nazev_balicku` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `popis` text COLLATE utf8mb4_czech_ci,
  `cena_vybavy` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vybava`
--

INSERT INTO `vybava` (`id_vybavy`, `nazev_balicku`, `popis`, `cena_vybavy`) VALUES
(1, 'Carbon Pack', 'Karbonové doplňky v interiéru i exteriéru', '150000.00'),
(2, 'Winter Edition', 'Vyhřívaný volant, sedačky a nezávislé topení', '45000.00'),
(3, 'Premium Sound', 'Audiosystém Bang & Olufsen 21 reproduktorů', '80000.00'),
(4, 'Sport Plus', 'Adaptivní podvozek a sportovní výfuk', '120000.00'),
(5, 'City Assist', '360 kamera, parkovací asistent a mrtvý úhel', '35000.00'),
(6, 'Night Vision', 'Termokamera pro noční vidění', '60000.00'),
(7, 'Extended Leather', 'Celokožený interiér z kůže Nappa', '110000.00');

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznici`
--

CREATE TABLE `zakaznici` (
  `id_zakaznika` int(11) NOT NULL,
  `jmeno` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `prijmeni` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `datum_registrace` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zakaznici`
--

INSERT INTO `zakaznici` (`id_zakaznika`, `jmeno`, `prijmeni`, `email`, `telefon`, `datum_registrace`) VALUES
(1, 'Jan', 'Novák', 'novak@email.cz', '777111222', '2024-01-10'),
(2, 'Petr', 'Svoboda', 'svoboda@seznam.cz', '777333444', '2024-02-15'),
(3, 'Jana', 'Dvořáková', 'jana.d@gmail.com', '602111555', '2024-03-01'),
(4, 'Martin', 'Černý', 'cerny@volny.cz', '721888999', '2024-03-10'),
(5, 'Lucie', 'Kučerová', 'lucie.k@atlas.cz', '730555444', '2024-04-05'),
(6, 'Tomáš', 'Marek', 'marek.t@email.cz', '775222333', '2024-04-20'),
(7, 'Eva', 'Králová', 'kralova@seznam.cz', '608999000', '2024-05-01');

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanci`
--

CREATE TABLE `zamestnanci` (
  `id_zamestnance` int(11) NOT NULL,
  `jmeno` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `prijmeni` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `pozice` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `plat` decimal(10,2) DEFAULT NULL,
  `id_pobocky` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zamestnanci`
--

INSERT INTO `zamestnanci` (`id_zamestnance`, `jmeno`, `prijmeni`, `pozice`, `plat`, `id_pobocky`) VALUES
(1, 'Jiří', 'Krátký', 'Prodejce', '45000.00', 1),
(2, 'Anna', 'Veselá', 'Prodejce', '45000.00', 1),
(3, 'Karel', 'Dlouhý', 'Manažer prodeje', '65000.00', 2),
(4, 'Michal', 'Rychlý', 'Servisní technik', '40000.00', 1),
(5, 'Pavla', 'Modrá', 'Administrativa', '35000.00', 3),
(6, 'Roman', 'Červený', 'Prodejce', '42000.00', 4),
(7, 'Sára', 'Bílá', 'Marketing', '38000.00', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `znacky`
--

CREATE TABLE `znacky` (
  `id_znacky` int(11) NOT NULL,
  `nazev` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `zeme_puvodu` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `webova_stranka` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `znacky`
--

INSERT INTO `znacky` (`id_znacky`, `nazev`, `zeme_puvodu`, `webova_stranka`) VALUES
(1, 'BMW', 'Německo', 'www.bmw.cz'),
(2, 'Porsche', 'Německo', 'www.porsche.cz'),
(3, 'Audi', 'Německo', 'www.audi.cz'),
(4, 'Mercedes-Benz', 'Německo', 'www.mercedes-benz.cz'),
(5, 'Tesla', 'USA', 'www.tesla.com'),
(6, 'Škoda', 'Česko', 'www.skoda-auto.cz'),
(7, 'Ferrari', 'Itálie', 'www.ferrari.com');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `pobocky`
--
ALTER TABLE `pobocky`
  ADD PRIMARY KEY (`id_pobocky`);

--
-- Klíče pro tabulku `prodeje`
--
ALTER TABLE `prodeje`
  ADD PRIMARY KEY (`id_prodeje`),
  ADD UNIQUE KEY `id_vozidla` (`id_vozidla`),
  ADD KEY `id_zakaznika` (`id_zakaznika`),
  ADD KEY `id_zamestnance` (`id_zamestnance`);

--
-- Klíče pro tabulku `servisni_zaznamy`
--
ALTER TABLE `servisni_zaznamy`
  ADD PRIMARY KEY (`id_vozidla`,`cislo_zaznamu`);

--
-- Klíče pro tabulku `vozidla`
--
ALTER TABLE `vozidla`
  ADD PRIMARY KEY (`id_vozidla`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD KEY `id_znacky` (`id_znacky`),
  ADD KEY `id_pobocky` (`id_pobocky`);

--
-- Klíče pro tabulku `vozidla_vybava`
--
ALTER TABLE `vozidla_vybava`
  ADD PRIMARY KEY (`id_vozidla`,`id_vybavy`),
  ADD KEY `id_vybavy` (`id_vybavy`);

--
-- Klíče pro tabulku `vybava`
--
ALTER TABLE `vybava`
  ADD PRIMARY KEY (`id_vybavy`);

--
-- Klíče pro tabulku `zakaznici`
--
ALTER TABLE `zakaznici`
  ADD PRIMARY KEY (`id_zakaznika`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Klíče pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD PRIMARY KEY (`id_zamestnance`),
  ADD KEY `id_pobocky` (`id_pobocky`);

--
-- Klíče pro tabulku `znacky`
--
ALTER TABLE `znacky`
  ADD PRIMARY KEY (`id_znacky`),
  ADD UNIQUE KEY `nazev` (`nazev`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `pobocky`
--
ALTER TABLE `pobocky`
  MODIFY `id_pobocky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `prodeje`
--
ALTER TABLE `prodeje`
  MODIFY `id_prodeje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `vozidla`
--
ALTER TABLE `vozidla`
  MODIFY `id_vozidla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `vybava`
--
ALTER TABLE `vybava`
  MODIFY `id_vybavy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `zakaznici`
--
ALTER TABLE `zakaznici`
  MODIFY `id_zakaznika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  MODIFY `id_zamestnance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pro tabulku `znacky`
--
ALTER TABLE `znacky`
  MODIFY `id_znacky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `prodeje`
--
ALTER TABLE `prodeje`
  ADD CONSTRAINT `prodeje_ibfk_1` FOREIGN KEY (`id_vozidla`) REFERENCES `vozidla` (`id_vozidla`),
  ADD CONSTRAINT `prodeje_ibfk_2` FOREIGN KEY (`id_zakaznika`) REFERENCES `zakaznici` (`id_zakaznika`),
  ADD CONSTRAINT `prodeje_ibfk_3` FOREIGN KEY (`id_zamestnance`) REFERENCES `zamestnanci` (`id_zamestnance`);

--
-- Omezení pro tabulku `servisni_zaznamy`
--
ALTER TABLE `servisni_zaznamy`
  ADD CONSTRAINT `servisni_zaznamy_ibfk_1` FOREIGN KEY (`id_vozidla`) REFERENCES `vozidla` (`id_vozidla`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `vozidla`
--
ALTER TABLE `vozidla`
  ADD CONSTRAINT `vozidla_ibfk_1` FOREIGN KEY (`id_znacky`) REFERENCES `znacky` (`id_znacky`),
  ADD CONSTRAINT `vozidla_ibfk_2` FOREIGN KEY (`id_pobocky`) REFERENCES `pobocky` (`id_pobocky`);

--
-- Omezení pro tabulku `vozidla_vybava`
--
ALTER TABLE `vozidla_vybava`
  ADD CONSTRAINT `vozidla_vybava_ibfk_1` FOREIGN KEY (`id_vozidla`) REFERENCES `vozidla` (`id_vozidla`) ON DELETE CASCADE,
  ADD CONSTRAINT `vozidla_vybava_ibfk_2` FOREIGN KEY (`id_vybavy`) REFERENCES `vybava` (`id_vybavy`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD CONSTRAINT `zamestnanci_ibfk_1` FOREIGN KEY (`id_pobocky`) REFERENCES `pobocky` (`id_pobocky`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
