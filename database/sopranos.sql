-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 28 mrt 2023 om 12:20
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sopranos`
--
CREATE DATABASE IF NOT EXISTS `sopranos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sopranos`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categoriees`
--

DROP TABLE IF EXISTS `categoriees`;
CREATE TABLE `categoriees` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `categoriees`
--

INSERT INTO `categoriees` (`id`, `type`, `description`, `img`) VALUES
(1, 'Meat Pizzas', 'Attention meat lovers! You won\'t be able to resist our mouthwatering selection of meat pizzas, perfectly cooked and seasoned to perfection.', 'img/probeer23.png'),
(2, 'Fish Pizzas', 'Looking for something different? Try our delicious fish pizzas! Made with fresh, flaky fish and a variety of flavorful toppings.', 'img/probeer.png'),
(3, 'Vegan Pizzas', 'Plant-based and delicious? Yes, please! Our vegan pizzas are the perfect choice for anyone looking for a meat-free and dairy-free option.', 'img/pizza-11.png'),
(4, 'Drinks', 'Pair your delicious pizza with our selection of refreshing drinks! We offer a variety of sodas, juices, and bottled water to quench your thirst.', 'img/drink-2.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'Dhiradj', 'dhiradj@mail.com', 'Missing pizza', 'I didn\'t recieve one of my pizzas'),
(2, 'Peter Parker', 'Peter@parker.com', 'Missing Sauce', 'I ordered a pizza with extra garlic sauce, but ended up getting no sauce at all. \r\nORDERNUMBER : 0097877\r\n\r\nCan I get the sauce asap or my money back. \r\n\r\nGreetings, \r\nParker'),
(3, 'mark', 'mark@mail.com', 'good service', 'I just wanted to thank you guys for the amazing pizza'),
(4, 'wdad', 'adw@mail.com', 'doijw', 'adad'),
(5, 'Dhiradj Tangali', 'dhiradj@mail.com', 'Missing items', '3 items missing');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230309114731', '2023-03-09 12:47:43', 572),
('DoctrineMigrations\\Version20230309115256', '2023-03-09 12:53:06', 32),
('DoctrineMigrations\\Version20230310091024', '2023-03-10 10:10:44', 43),
('DoctrineMigrations\\Version20230322085338', '2023-03-22 09:53:47', 198),
('DoctrineMigrations\\Version20230322102528', '2023-03-22 11:25:49', 594),
('DoctrineMigrations\\Version20230322103216', '2023-03-22 11:32:24', 159),
('DoctrineMigrations\\Version20230325033153', '2023-03-25 04:32:01', 481),
('DoctrineMigrations\\Version20230326144704', '2023-03-26 16:47:22', 82);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
CREATE TABLE `pizzas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizzas`
--

INSERT INTO `pizzas` (`id`, `name`, `ingredients`, `price`, `product_id`, `img`) VALUES
(1, 'Pizza Vegan Veggi', 'Tomato sauce, vegan cheese, mushrooms, fresh tomato, bell pepper, spinach and onion.', '10.00', 3, 'img/pizzaveggi.png'),
(2, 'Pizza Vegan Funghi', 'Tomato sauce, vegan cheese, mushrooms & pizza herbs.', '10.00', 3, 'img/pizzafunghi.png'),
(3, 'Pizza Vegan Margaritha', 'Tomato sauce, vegan cheese, extra vegan cheese & pizza herbs.', '10.00', 3, 'img/pizzaveganmargherita.png'),
(4, 'Pizza Shoarma', 'Tomato sauce, mozzarella, shoarma & a swirl of garlic sauce.', '9.00', 1, 'img/pizzashoarma.png'),
(5, 'Pizza Kebab', 'Tomato sauce, mozzarella, shoarma and a touch of garlic sauce.', '9.00', 1, 'img/pizzakebab.png'),
(6, 'Pizza BBQ Chicken & Bacon', 'BBQ sauce, mozzarella, grilled chicken & bacon and a touch of garlic sauce.', '9.00', 1, 'img/pizzabbqchicken.png'),
(7, 'Pizza Tuna ', 'Tomato sauce, mozzarella, pole & line tuna, green olives, red onion and garlic oil on the rim.', '11.00', 2, 'img/pizzatuna.png'),
(8, 'Pizza Smoked Salmon', 'Salmon, Tomato sauce, creamy cheese, green peas, red onion.', '11.00', 2, 'img/pizzasmokedsalmon.png'),
(9, 'Pizza Shrimp', 'Shrimp, butter, garlic, red onion and garlic oil on the rim.', '11.00', 2, 'img/pizzashrimp.png'),
(10, 'Coca Cola Zero (can)', 'This newest variant looks and tastes more like Coca-Cola, but without sugar and calories.', '2.00', 4, 'img/cocacolazero.png'),
(11, 'Coca Cola (can)', 'This original, iconic, delicious soft drink refreshes people anytime and anywhere.', '2.00', 4, 'img/cocacola.png'),
(12, 'Fanta Orange (can)', 'Fanta orange is a delicious combination of orange flavor with sparkling water.', '2.00', 4, 'img/fanta.png');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `categoriees`
--
ALTER TABLE `categoriees`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398DE18E50B` (`product_id_id`);

--
-- Indexen voor tabel `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C6CC6E404584665A` (`product_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `categoriees`
--
ALTER TABLE `categoriees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398DE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `pizzas` (`id`);

--
-- Beperkingen voor tabel `pizzas`
--
ALTER TABLE `pizzas`
  ADD CONSTRAINT `FK_C6CC6E404584665A` FOREIGN KEY (`product_id`) REFERENCES `categoriees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
