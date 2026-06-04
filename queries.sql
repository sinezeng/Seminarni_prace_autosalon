vypíše všechny zákazníky registrované po 1. lednu 2024.
-- WHERE
SELECT * FROM zakaznici WHERE datum_registrace > '2024-01-01';

vypíše jména všech zaměstnanců a názvy jejich poboček.
-- JOIN ON
SELECT z.jmeno, z.prijmeni, p.nazev_pobocky FROM zamestnanci z JOIN pobocky p ON z.id_pobocky = p.id_pobocky;

vypíše modely vozidel, které obsahují písmeno 'a'.
-- LIKE, WHERE
SELECT model FROM vozidla WHERE model LIKE '%a%';

vypíše 3 nejdražší prodaná vozidla od nejvyšší ceny.
-- JOIN ON, ORDER BY, LIMIT
SELECT model, finalni_cena FROM prodeje JOIN vozidla ON prodeje.id_vozidla = vozidla.id_vozidla ORDER BY finalni_cena DESC LIMIT 3;

vypíše modely vozidel a jejich značky.
-- JOIN ON
SELECT vozidla.model, znacky.nazev FROM vozidla JOIN znacky ON vozidla.id_znacky = znacky.id_znacky;

vypíše prodeje s platbou převodem.
-- WHERE
SELECT * FROM prodeje WHERE zpusob_platby = 'prevod';

vypíše počet všech servisních záznamů.
-- Agregační
SELECT COUNT(*) FROM servisni_zaznamy;

vypíše modely obsahující "Turbo".
-- LIKE, WHERE
SELECT model FROM vozidla WHERE model LIKE '%Turbo%';

vypíše ID prodeje a jména zákazníků.
-- JOIN ON
SELECT p.id_prodeje, z.jmeno, z.prijmeni FROM prodeje p JOIN zakaznici z ON p.id_zakaznika = z.id_zakaznika;

vypíše pobočky z Prahy nebo Brna.
-- WHERE
SELECT * FROM pobocky WHERE mesto IN ('Praha', 'Brno');

vypíše zaměstnance s příjmením začínajícím na 'S'.
-- LIKE, WHERE
SELECT * FROM zamestnanci WHERE prijmeni LIKE 'S%';

vypíše všechny zaměstnance a jejich prodeje.
-- LEFT JOIN
SELECT z.jmeno, p.id_prodeje FROM zamestnanci z LEFT JOIN prodeje p ON z.id_zamestnance = p.id_zamestnance;

vypíše všechny značky a jejich vozidla.
-- RIGHT JOIN
SELECT z.nazev, v.model FROM vozidla v RIGHT JOIN znacky z ON v.id_znacky = z.id_znacky;

vypíše pobočky s více než 2 zaměstnanci.
-- JOIN ON, GROUP BY, HAVING
SELECT p.nazev_pobocky, COUNT(z.id_zamestnance) FROM pobocky p JOIN zamestnanci z ON p.id_pobocky = z.id_pobocky GROUP BY p.nazev_pobocky HAVING COUNT(z.id_zamestnance) > 2;

vypíše cenu vozidel po slevě 10 % pro auta nad 1 milion.
-- WHERE, Výpočet
SELECT model, cena * 0.9 AS cena_po_sleve FROM vozidla WHERE cena > 1000000;