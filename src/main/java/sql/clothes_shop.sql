-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 05:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

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
DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `archive_product` (IN `product_id` VARCHAR(255))  BEGIN
    INSERT INTO `archived`
    SELECT * FROM `products` WHERE `ProductId` = product_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `unarchive_product` (IN `product_id` VARCHAR(255))  BEGIN
    INSERT INTO `products`
    SELECT * FROM `archived` WHERE `ProductId` = product_id;

    DELETE FROM `archived` WHERE `ProductId` = product_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Address1` varchar(500) NOT NULL,
  `Address2` varchar(500) NOT NULL,
  `Address3` varchar(500) DEFAULT NULL,
  `City` varchar(500) NOT NULL,
  `County` varchar(500) NOT NULL,
  `Country` varchar(500) NOT NULL,
  `Pincode` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressId`, `UserId`, `Address1`, `Address2`, `Address3`, `City`, `County`, `Country`, `Pincode`) VALUES
(1, 7, '18 CUL NA GREINE CO.CORK', 'Home', 'Home', 'CORK', 'Cork', 'Ireland', 'P47E438');

-- --------------------------------------------------------

--
-- Table structure for table `archived`
--

CREATE TABLE `archived` (
  `ProductId` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MRP` double NOT NULL,
  `CP` double NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Tags` varchar(255) NOT NULL,
  `Brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archived`
--

INSERT INTO `archived` (`ProductId`, `Name`, `MRP`, `CP`, `Description`, `Category`, `Tags`, `Brand`) VALUES
('PMAA001C99JER0050110', 'PARIS SPRAYED T-SHIRT', 195, 195, 'SHORT SLEEVES T-SHIRT IN WHITE WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN BLACK AT FRONT. STRAIGHT HEM. Fabric 100% Cotton', 'T-Shirt', 'PalmAngels, T-Shirt, White, Printed', 'Palm Angels'),
('PMAA066S23JER0021084', 'I LOVE PA CLASSIC TEE', 235, 235, '\"SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH MULTICOLOR I LOVE PA GRAPHIC PRINTED AT FRONT. REGULAR FIT.FABRIC 100% COTTON\"', 'T-Shirt', 'PalmAngels, T-Shirt, Black, Printed', 'Palm Angels');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ProductId` varchar(225) DEFAULT NULL,
  `Size` varchar(225) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `orderDate` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `message` int(11) NOT NULL,
  `status` varchar(225) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `size` varchar(225) NOT NULL,
  `productPrice` double(6,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderId`, `productName`, `size`, `productPrice`, `quantity`) VALUES
(5, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 1),
(6, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 2),
(6, 'STAR SPRAYED T-SHIRT', '', 195.00, 2),
(7, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 2),
(8, 'I LOVE PA CLASSIC TEE', '', 235.00, 1),
(9, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 3),
(10, 'Prada Triangle Cotton T-shirt', '', 760.00, 1),
(11, 'Prada Triangle Cotton T-shirt', '', 760.00, 2),
(11, 'PARIS SPRAYED T-SHIRT', '', 195.00, 1),
(12, 'Water-repellent two-way stretch technical nylon jacket', '', 525.00, 1),
(13, 'Heavy-jersey hooded sweatshirt with bold rubberised logo', '', 345.00, 3),
(14, 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK', '', 850.00, 1),
(15, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 1),
(16, 'Prada Triangle Cotton T-shirt', '', 760.00, 1),
(16, 'PARIS SPRAYED T-SHIRT', '', 195.00, 1),
(17, 'Water-repellent two-way stretch technical nylon jacket', '', 525.00, 1),
(17, 'Quilted water-repellent recycled nylon blazer with detachable inner panel', '', 675.00, 4),
(17, 'Prada Triangle Cotton T-shirt', '', 760.00, 4),
(17, 'PARIS SPRAYED T-SHIRT', '', 195.00, 2),
(20, 'PARIS SPRAYED T-SHIRT', '', 195.00, 2),
(21, 'Prada Triangle Cotton T-shirt', '', 760.00, 10),
(22, 'Heavy-jersey hooded sweatshirt with bold rubberised logo', '', 345.00, 1),
(23, 'PALMS&SKULL LONG SLEEVED OVER TEE', '', 495.00, 2),
(24, 'Prada Triangle Cotton T-shirt', '', 760.00, 1),
(25, 'PARIS SPRAYED T-SHIRT', '', 195.00, 1),
(32, 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK', 'XS', 850.00, 1),
(33, 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK', 'M', 850.00, 2),
(34, 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK', 'M', 850.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `AddressId` int(11) NOT NULL,
  `total` double(6,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `Status` varchar(225) NOT NULL DEFAULT 'Confirmed '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `UserId`, `AddressId`, `total`, `created_at`, `Status`) VALUES
(24, 7, 1, 760.00, '2023-04-19 17:54:21', 'In Transit'),
(25, 7, 1, 195.00, '2023-04-26 16:56:48', 'Processed'),
(26, 7, 1, 850.00, '2023-05-06 20:27:18', 'Confirmed '),
(27, 7, 1, 8950.00, '2023-05-06 20:35:56', 'Confirmed '),
(28, 7, 1, 1700.00, '2023-05-06 20:48:59', 'Confirmed '),
(29, 7, 1, 1350.00, '2023-05-06 20:59:51', 'Confirmed '),
(30, 7, 1, 345.00, '2023-05-06 21:05:09', 'Confirmed '),
(31, 7, 1, 1380.00, '2023-05-06 21:09:45', 'Confirmed '),
(32, 7, 1, 850.00, '2023-05-08 18:57:02', 'Confirmed '),
(33, 7, 1, 1700.00, '2023-05-08 19:16:35', 'Confirmed '),
(34, 7, 1, 1700.00, '2023-05-08 19:17:44', 'Confirmed ');

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
  `Brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `Name`, `MRP`, `CP`, `Description`, `Category`, `Tags`, `Brand`) VALUES
('3R1GC01NRIZ10999', 'Quilted water-repellent recycled nylon blazer with detachable inner panel', 675, 675, 'An outerwear garment made from a sustainable, unique and exclusive Korean fabric, in a deep colour, with good climatic resistance and exceptional durability, thanks to the very high-quality texture made from recycled nylon fibres, a reduced use of chemica', 'Jacket', 'EA, WaterRep, Nylon, Jacket, Black, Technical ', 'Emporio Armani'),
('3R1GC11NNIZ10999', 'Water-repellent two-way stretch technical nylon jacket', 525, 525, 'The perfect fusion of a flawless fit and a matte, stretchy, performance fabric creates a garment designed to naturally follow every movement. Jacket with zip fastening and side pockets. The garment also features several standout technical properties: it i', 'Jacket', 'EA, WaterRep, Nylon, Blazer, Quilted', 'Emporio Armani'),
('3R1MDN1JWPZ10920', 'Heavy-jersey hooded sweatshirt with bold rubberised logo', 345, 345, 'Heavyweight hooded sweatshirt in pure cotton jersey. Featuring a bold logo in matching-tone rubber print on the front and back, an affirmation that the Emporio Armani logo is still a constant of undeniable style. Brushed lining.', 'Hoodie', 'Armani, Hoodie, Black, Large, Printed', 'Armani'),
('620973TNVQ11059', 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK', 850, 850, '• Curly fleece• Large fit• Hood without drawstring• 1 kangaroo pocket on front• Gathered at cuffs and waistline• Hand Drawn BB Icon artwork printed at front and back• Worn-out effect• Made in Portugal• Dry cleaning', 'Hoodie', 'Armani, Hoodie, Black', 'Balenciaga'),
('727163TNVR31070', 'MIRROR BALENCIAGA HOODIE OVERSIZED IN BLACK', 895, 895, '\"• Medium fleece\n• This item is unisex\n• Oversize fit\n• Hood without drawstring\n• Dropped shoulder\n• 1 kangaroo pocket on front\n• Gathered at cuffs and waistline\n• Mirror Balenciaga artwork printed at front\n• Made in Portugal\n• Cold machine wash\"', 'Hoodie', 'Balenciaga, Hoodie, Black, Oversized, Printed', 'Balenciaga'),
('PMAA001C99JER0171010', 'PARIS SPRAYED T-SHIRT', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN WHITE AT FRONT. STRAIGHT HEM. Fabric 100% Cotton', 'T-Shirt', 'PalmAngels, T-Shirt, Black, Printed', 'Palm Angels'),
('PMAA001C99JER0241055', 'STAR SPRAYED T-SHIRT', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH \"PALM ANGELS\" LOGO AND A GREEN SPRAYED STAR GRAPHIC PRINTED AT FRONT. CREWNECK COLLAR AND DROP SHOULDERS.FABRIC 100% COTTON', 'T-Shirt', 'Palm Angels,, T-Shirt, Black, Printed\n\n', 'Palm Angels'),
('PMAB001S23JER0021055', 'PALMS&SKULL LONG SLEEVED OVER TEE', 495, 495, '\"LONG SLEEVES T-SHIRT IN BLACK COTTON FEATURING \"\"PALM ANGELS\"\" BURNING LOGO AT FRONT AND BACK. PALM TREE & SKULLS GRAPHIC AT HEM. CREWNECK COLLAR AND REGULAR FIT.FABRIC 100% COTTON\"', 'T-Shirt', 'PalmAngels, T-Shirt, Black, Printed, Long Sleeve', 'Palm Angels'),
('UJN847_12VV_F0002_S_231', 'Prada Triangle Cotton T-shirt', 760, 760, 'An oversized decorative trim evoking details of Tyrolean style is reinvented with a modern twist, creating the unusual, conceptual graphic designs that enrich this classic cotton T-shirt.\n', 'T-Shirt', 'Prada, T-Shirt, White, Printed\n\n', 'Prada');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL,
  `ProductId` varchar(255) NOT NULL,
  `UserId` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `review` text NOT NULL,
  `reviewDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewId`, `ProductId`, `UserId`, `rating`, `review`, `reviewDate`) VALUES
(1, '3R1GC01NRIZ10999', 1, 4, 'This product is exactly what I was looking for. It\'s easy to use and works great.', '2022-10-01'),
(2, '3R1GC01NRIZ10999', 2, 5, 'I am so impressed with this product! It exceeded my expectations in every way.', '2022-09-28'),
(3, '3R1GC01NRIZ10999', 3, 3, 'It\'s a decent product, but it has some flaws that could be improved.', '2022-09-23'),
(4, '3R1GC01NRIZ10999', 4, 2, 'I was really disappointed with this product. It didn\'t work as advertised and I had to return it.', '2022-09-18'),
(5, '3R1GC01NRIZ10999', 5, 4, 'This is a solid product that does what it says it will. I would recommend it to others.', '2022-09-12'),
(6, '3R1GC01NRIZ10999', 6, 5, 'I love this product! It\'s exactly what I needed and it arrived quickly.', '2022-09-10'),
(7, '620973TNVQ11059', 2, 5, 'I love this hoodie! The quality is amazing and it looks great on me.', '2022-02-20'),
(8, '620973TNVQ11059', 3, 3, 'The hoodie is okay, but nothing special. It fits well and is comfortable, but the design is a bit plain for my taste.', '2022-03-10'),
(9, '620973TNVQ11059', 4, 2, 'I was really disappointed with this hoodie. The quality is poor and the fit is not good. Would not recommend.', '2022-04-05'),
(10, '620973TNVQ11059', 5, 4, 'This hoodie is great for the price. Its comfortable and fits well. The only downside is that its a bit thin.', '2022-05-01'),
(11, '727163TNVR31070', 1, 3, 'The quality of this product is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-10'),
(12, '727163TNVR31070', 2, 5, 'I absolutely love this hoodie! Its so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-15'),
(13, '727163TNVR31070', 3, 4, 'Im really happy with this purchase. The hoodie is comfortable and fits well. The only downside is that its a bit pricey.', '2022-08-20'),
(14, '727163TNVR31070', 4, 2, 'I was really disappointed with this hoodie. Its not comfortable and the design is not good. Would not recommend.', '2022-09-05'),
(15, '727163TNVR31070', 5, 3, 'The hoodie is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(16, '620973TNVQ11059', 1, 4, 'Great product! The hoodie is comfortable and fits perfectly. Would definitely recommend.', '2022-01-15'),
(17, 'PMAA001C99JER0050110', 1, 4, 'I really like this t-shirt. It fits well and the material is soft and comfortable. The design is also cool.', '2022-01-01'),
(18, 'PMAA001C99JER0050110', 2, 5, 'This is an awesome t-shirt! The design is really unique and the quality is great. Highly recommend!', '2022-02-01'),
(19, 'PMAA001C99JER0050110', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and the material is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(20, 'PMAA001C99JER0050110', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-04-01'),
(21, 'PMAA001C99JER0050110', 5, 4, 'This is a nice t-shirt. It fits well and the material is comfortable. The design is not my favorite, but its still good.', '2022-05-01'),
(22, 'PMAA001C99JER0171010', 1, 3, 'The quality of this t-shirt is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-01'),
(23, 'PMAA001C99JER0171010', 2, 5, 'I absolutely love this t-shirt! Its so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-01'),
(24, 'PMAA001C99JER0171010', 3, 4, 'Im really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that its a bit pricey.', '2022-08-01'),
(25, 'PMAA001C99JER0171010', 4, 2, 'I was really disappointed with this t-shirt. Its not comfortable and the design is not good. Would not recommend.', '2022-09-01'),
(26, 'PMAA001C99JER0171010', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(27, 'PMAA001C99JER0241055', 2, 5, 'This is an awesome t-shirt! The design is really unique and the quality is great. Highly recommend!', '2022-02-01'),
(28, 'PMAA001C99JER0241055', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and the material is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(29, 'PMAA001C99JER0241055', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-04-01'),
(30, 'PMAA001C99JER0241055', 5, 4, 'This is a nice t-shirt. It fits well and the material is comfortable. The design is not my favorite, but it\'s still good.', '2022-05-01'),
(31, 'PMAA066S23JER0021084', 1, 3, 'The quality of this t-shirt is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-01'),
(32, 'PMAA066S23JER0021084', 2, 5, 'I absolutely love this t-shirt! It\'s so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-01'),
(33, 'PMAA066S23JER0021084', 3, 4, 'I\'m really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that it\'s a bit pricey.', '2022-08-01'),
(34, 'PMAA066S23JER0021084', 4, 2, 'I was really disappointed with this t-shirt. It\'s not comfortable and the design is not good. Would not recommend.', '2022-09-01'),
(35, 'PMAA066S23JER0021084', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(36, 'PMAA001C99JER0241055', 1, 4, 'I really like this t-shirt. It fits well and the material is soft and comfortable. The design is also cool.', '2022-01-01'),
(37, 'PMAB001S23JER0021055', 1, 4, 'I really like this t-shirt. It\'s comfortable and the design is unique. The only downside is that it shrinks a bit after washing.', '2022-01-01'),
(38, 'PMAB001S23JER0021055', 2, 5, 'This is an awesome t-shirt! The quality is great and the design is perfect. It fits well and is comfortable. Highly recommend!', '2022-02-01'),
(39, 'PMAB001S23JER0021055', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(40, 'PMAB001S23JER0021055', 4, 2, 'I was really disappointed with this t-shirt. The material is scratchy and the fit is not good. Would not recommend.', '2022-04-01'),
(41, 'PMAB001S23JER0021055', 5, 4, 'This is a nice t-shirt. It fits well and is comfortable. The design is not my favorite, but it\'s still good quality.', '2022-05-01'),
(42, 'UJN847_12VV_F0002_S_231', 1, 3, 'The quality of this t-shirt is average. It fits well and is comfortable, but the design is not really my style.', '2022-06-01'),
(43, 'UJN847_12VV_F0002_S_231', 2, 5, 'I absolutely love this t-shirt! It\'s so comfortable and the design is perfect for me. The quality is great too.', '2022-07-01'),
(44, 'UJN847_12VV_F0002_S_231', 3, 4, 'I\'m really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that it\'s a bit expensive.', '2022-08-01'),
(45, 'UJN847_12VV_F0002_S_231', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-09-01'),
(46, 'UJN847_12VV_F0002_S_231', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(50, 'PMAA001C99JER0241055', 21, 5, 'Comfy', '2023-03-20'),
(51, 'UJN847_12VV_F0002_S_231', 9, 5, 'menii sika biossu', '2023-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `salt`
--

CREATE TABLE `salt` (
  `username` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salt`
--

INSERT INTO `salt` (`username`, `salt`) VALUES
('kaka', 'IjVA/bKSY5NU7ljURBBVjw=='),
('Bhig', 'L45XZIUzFCUaBiqGYy5GXg=='),
('Khali', 'G4Ed7sBSZp5VODd1QaQw9g=='),
('Ruth', 'E6HOR3HJS900rFuh9BRXjw=='),
('Michelle', 'Tph5KGQ1hP3n5OGO3IDFOQ=='),
('Deji', 'x/KGnyjj7r2V5SvQ1wyjww=='),
('Kian', 'EoTHCnVjj3A1tC52C2UoFA=='),
('Harsh', 'ZDtSTjRxg6IkFkFmtnOMRQ==');

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

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`ProductId`, `XS`, `S`, `M`, `L`, `XL`) VALUES
('3R1GC01NRIZ10999', 13, 12, 10, 9, 2),
('3R1GC11NNIZ10999', 22, 32, 11, 4, 5),
('3R1MDN1JWPZ10920', 12, 10, 4, 7, 2),
('620973TNVQ11059', 2, 3, 0, 2, 3),
('727163TNVR31070', 22, 12, 12, 12, 12),
('PMAA001C99JER0171010', 22, 12, 41, 20, 10),
('PMAA001C99JER0241055', 11, 14, 13, 21, 32),
('UJN847_12VV_F0002_S_231', 12, 32, 44, 92, 19);

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
  `Question` varchar(255) DEFAULT NULL,
  `Answer` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `subscription` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `username`, `password`, `FirstName`, `Lastname`, `Email`, `Phone`, `Question`, `Answer`, `DOB`, `isAdmin`, `subscription`) VALUES
(1, 'Harsh', 'nqobMEeNziZTuYjDMhkblSDjGT0gyKfS7lsHOhfTra4=', 'Harsh', 'Khatri', 'hkhatri731@gmail.com', 871498876, 'To what city did you go on your honeymoon?', 'Khalis House', '2023-01-12', 1, 0),
(2, 'Kian', 'wTpfMLnCxMcqPcU6mSljoGctFEAI0UDU+CHwzGTcGYo=', 'Kian', 'Harding', 'kh@gmail.com', 830995017, 'Where were you when you first heard about 9/11?', 'Playground with stuffed animal', '2023-01-02', 1, 0),
(3, 'Khali', '2oD7MQpnMBDAJI6XcS+RHsKg2sl7oIMlDreF974pJkw=', 'Meshach', 'Atta-Nyarko', 'Mh@gmail.com', 830995017, 'Where were you when you first heard about 9/11?', 'At Osamas House', '2023-01-02', 1, 0),
(4, 'Deji', '9l8StQ5vovsD6Nf2RyFvc0O9LxslKengvg5doXkr9gA=', 'Destiny', 'Wassup', 'deji@gmail.com', 830995017, 'What was the name of your first stuffed animal?', 'Kakashi Hatake', '2023-01-02', 0, 1),
(5, 'Ruth', 'EpQxicMgAMaLTABx3AtQYKs8SADYMSghwtKOTvQ6HMQ=', 'Catherine', 'Mc Keever', 'ruth.mckeever@dkit.ie', 830995017, 'What was the name of your first stuffed animal?', 'Pingu', '2023-01-02', 0, 0),
(6, 'Michelle', 'pVpwhk2N3kWrAU++tcQhbFtBEJKjvswmhY81q+Flmvk=', 'Michelle', 'Graham', 'Michelle.Graham@dkit.ie', 830995017, 'What was the name of your first stuffed animal?', 'Mr Rhino', '2023-01-02', 0, 0),
(7, 'Bhig', '6yQG6xEhYxyadqFY7Z3qH2wBIIbbITE6M+Iljlr4ZW4=', 'biggaaaa', 'dhfhfs', 'attanyarkomeshach@gmail.com', 876352637, 'To what city did you go on your honeymoon?', 'Singapore', '2000-10-10', 0, 1),
(9, 'awwmee19', '172620255ee20252a50f83ad088a6f499750ae17dfe3a4e50b0c321f05e632fe', 'aww', 'mee', 'awwmee19@gmail.com', 876018205, 'What was the first concert you attended?', 'wo nana to jams', '1999-05-21', NULL, 0),
(16, 'kaka', 'Y1C6tvQtyES0KkajOhSFvWOhd3mfKZ4eqhbtCRaqM0Q=', 'sjghjgjhs', 'djhgjjhd', 'shghjgs@gmail.com', 876083627, 'what is your favorite fictional character', 'fdhdj', '2000-10-10', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`),
  ADD KEY `address_ibfk_1` (`UserId`);

--
-- Indexes for table `archived`
--
ALTER TABLE `archived`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_ibfk_1` (`UserId`),
  ADD KEY `cart_ibfk_2` (`ProductId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`username`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD KEY `OrderId` (`OrderId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `orders_ibfk_1` (`UserId`),
  ADD KEY `orders_ibfk_2` (`AddressId`);

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
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewId`);

--
-- Indexes for table `salt`
--
ALTER TABLE `salt`
  ADD KEY `salt_ibfk_1` (`username`);

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
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`);

--
-- Constraints for table `productfilter`
--
ALTER TABLE `productfilter`
  ADD CONSTRAINT `productfilter_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`);

--
-- Constraints for table `salt`
--
ALTER TABLE `salt`
  ADD CONSTRAINT `salt_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
