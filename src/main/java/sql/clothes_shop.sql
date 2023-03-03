-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 11:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothes_shop`
--
drop database if exists clothes_shop;
create database if not exists clothes_shop;

use clothes_shop;
-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `UserId` int(11) NOT NULL,
  `ProductId` varchar(255) NOT NULL,
  `Quantity` int(255) NOT NULL,
  `TotalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `UserId` int(11) NOT NULL,
  `ProductId` varchar(255) NOT NULL,
  `TrackingId` varchar(255) NOT NULL,
  `Paid` int(11) NOT NULL,
  `Price` double NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productfilter`
--

CREATE TABLE `productfilter` (
  `ProductId` varchar(255) NOT NULL,
  `Colour` varchar(255) NOT NULL,
  `Style` varchar(255) NOT NULL,
  `Printed` varchar(255) NOT NULL,
  `Length` varchar(255) NOT NULL,
  `Occasion` varchar(255) NOT NULL,
  `Fit` varchar(255) NOT NULL,
  `NeckLine` varchar(255) NOT NULL,
  `Material` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductId` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MRP` double NOT NULL,
  `CP` double NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Tags` varchar(255) NOT NULL,
  `Images` varchar(255) NOT NULL,
  `Brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `Name`, `MRP`, `CP`, `Description`, `Category`, `Tags`, `Images`, `Brand`) VALUES
(' PMAA001C99JER0171010\r\n', 'PARIS SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN WHITE AT FRONT. STRAIGHT HEM. Fabric 100% Cotton\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed\r\n', '', 'Palm Angels\r\n'),
('3R1GC01NRIZ10999\r\n', 'Quilted water-repellent recycled nylon blazer with detachable inner panel\r\n', 675, 675, 'An outerwear garment made from a sustainable, unique and exclusive Korean fabric, in a deep colour, with good climatic resistance and exceptional durability, thanks to the very high-quality texture made from recycled nylon fibres, a reduced use of chemica', 'Jacket\r\n', 'EA, WaterRep, Nylon, Jacket, Black, Technical \r\n', '', 'Emporio Armani\r\n'),
('3R1GC11NNIZ10999\r\n', 'Water-repellent two-way stretch technical nylon jacket\r\n', 525, 525, 'The perfect fusion of a flawless fit and a matte, stretchy, performance fabric creates a garment designed to naturally follow every movement. Jacket with zip fastening and side pockets. The garment also features several standout technical properties: it i', 'Jacket\r\n', 'EA, WaterRep, Nylon, Blazer, Quilted\r\n', '', 'Emporio Armani\r\n'),
('3R1MDN1JWPZ10920\r\n', 'Heavy-jersey hooded sweatshirt with bold rubberised logo\r\n', 345, 345, 'Heavyweight hooded sweatshirt in pure cotton jersey. Featuring a bold logo in matching-tone rubber print on the front and back, an affirmation that the Emporio Armani logo is still a constant of undeniable style. Brushed lining.\r\n', 'Hoodie\r\n', 'Armani, Hoodie, Black, Large, Printed\r\n', '', 'Armani\r\n'),
('620973TNVQ11059\r\n', 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK\r\n', 850, 850, '• Curly fleece\r\n• Large fit\r\n• Hood without drawstring\r\n• 1 kangaroo pocket on front\r\n• Gathered at cuffs and waistline\r\n• Hand Drawn BB Icon artwork printed at front and back\r\n• Worn-out effect\r\n• Made in Portugal\r\n• Dry cleaning\r\n', 'Hoodie\r\n', 'Armani, Hoodie, Black\r\n', '', 'Balenciaga\r\n'),
('727163TNVR31070\r\n', 'MIRROR BALENCIAGA HOODIE OVERSIZED IN BLACK\r\n', 895, 895, '\"• Medium fleece\n• This item is unisex\n• Oversize fit\n• Hood without drawstring\n• Dropped shoulder\n• 1 kangaroo pocket on front\n• Gathered at cuffs and waistline\n• Mirror Balenciaga artwork printed at front\n• Made in Portugal\n• Cold machine wash\"', 'Hoodie\r\n', 'Balenciaga, Hoodie, Black, Oversized, Printed\r\n', '', 'Balenciaga\r\n'),
('80582761\r\n', 'Soho Heritage Harrington Jacket\r\n', 1550, 1550, 'A casual style suited to milder climes, made in Yorkshire from shower-resistant gabardine.\r\n', 'Jacket\r\n', 'Burberry,Checkered, Cotton, Black\r\n', '', 'Burberry\r\n'),
('PMAA001C99JER0050110\r\n', 'PARIS SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN WHITE WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN BLACK AT FRONT. STRAIGHT HEM. Fabric 100% Cotton\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, White, Printed\r\n', '', 'Palm Angels\r\n'),
('PMAA001C99JER0241055\r\n', 'STAR SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH \"PALM ANGELS\" LOGO AND A GREEN SPRAYED STAR GRAPHIC PRINTED AT FRONT. CREWNECK COLLAR AND DROP SHOULDERS.FABRIC 100% COTTON\r\n', 'T-Shirt\r\n', 'Palm Angels\r\n', '', 'PalmAngels, T-Shirt, Black, Printed\r\n'),
('PMAA066S23JER0021084\r\n', 'I LOVE PA CLASSIC TEE\r\n', 235, 235, '\"SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH MULTICOLOR I LOVE PA GRAPHIC PRINTED AT FRONT. REGULAR FIT.\r\nFABRIC 100% COTTON\"\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed\r\n', '', 'Palm Angels\r\n'),
('PMAB001S23JER0021055\r\n', 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495, 495, '\"LONG SLEEVES T-SHIRT IN BLACK COTTON FEATURING \"\"PALM ANGELS\"\" BURNING LOGO AT FRONT AND BACK. PALM TREE & SKULLS GRAPHIC AT HEM. CREWNECK COLLAR AND REGULAR FIT.\r\nFABRIC 100% COTTON\"\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed, Long Sleeve\r\n', '', 'Palm Angels\r\n'),
('UJN847_12VV_F0002_S_231\r\n', 'Prada Triangle Cotton T-shirt\r\n', 760, 760, 'An oversized decorative trim evoking details of Tyrolean style is reinvented with a modern twist, creating the unusual, conceptual graphic designs that enrich this classic cotton T-shirt.\n', 'T-Shirt\r\n', 'Prada\r\n', '', 'Prada, T-Shirt, White, Printed\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `ProductId` varchar(255) NOT NULL,
  `XS` int(11) NOT NULL,
  `S` int(11) NOT NULL,
  `M` int(11) NOT NULL,
  `L` int(11) NOT NULL,
  `XL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `FirstName` varchar(55) DEFAULT NULL,
  `Lastname` varchar(55) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `isAdmin` Boolean DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `username`, `password`, `FirstName`, `Lastname`, `Email`, `Phone`, `DOB`, `isAdmin`) VALUES
(1, 'Harsh', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Harsh', 'Khatri', 'hkhatri731@gmail.com', 871498876, '2023-01-12', 1),
(2, 'Kian', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Kian', 'Harding', 'kh@gmail.com', 830995017, '2023-01-02', 1);
(3, 'Khali', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Meshach', 'Atta-Nyarko', 'Mh@gmail.com', 830995017, '2023-01-02', 1);
(4, 'Deji', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Destiny', 'Wassup', 'deji@gmail.com', 830995017, '2023-01-02', 0);
(5, 'Ruth', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Catherine', 'Mc Keever', 'ruth.mckeever@dkit.ie', 830995017, '2023-01-02', 0);
(5, 'Michelle', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Michelle', 'Graham', 'Michelle.Graham@dkit.ie', 830995017, '2023-01-02', 0);
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `orders_ibfk_1` (`UserId`);

--
-- Indexes for table `productfilter`
--
ALTER TABLE `productfilter`
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UsernameIndex` (`username`),
  ADD UNIQUE KEY `Email Index` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `productfilter`
--
ALTER TABLE `productfilter`
  ADD CONSTRAINT `productfilter_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
