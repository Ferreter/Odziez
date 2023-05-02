-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 05:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ProductId` varchar(225) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `orderDate` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double(6,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderId`, `productName`, `productPrice`, `quantity`) VALUES
(5, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 1),
(6, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 2),
(6, 'STAR SPRAYED T-SHIRT\r\n', 195.00, 2),
(7, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 2),
(8, 'I LOVE PA CLASSIC TEE\r\n', 235.00, 1),
(9, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 3),
(10, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 1),
(11, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 2),
(11, 'PARIS SPRAYED T-SHIRT\r\n', 195.00, 1),
(12, 'Water-repellent two-way stretch technical nylon jacket\r\n', 525.00, 1),
(13, 'Heavy-jersey hooded sweatshirt with bold rubberised logo\r\n', 345.00, 3),
(14, 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK\r\n', 850.00, 1),
(15, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 1),
(16, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 1),
(16, 'PARIS SPRAYED T-SHIRT\r\n', 195.00, 1),
(17, 'Water-repellent two-way stretch technical nylon jacket\r\n', 525.00, 1),
(17, 'Quilted water-repellent recycled nylon blazer with detachable inner panel\r\n', 675.00, 4),
(17, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 4),
(17, 'PARIS SPRAYED T-SHIRT\r\n', 195.00, 2),
(20, 'PARIS SPRAYED T-SHIRT\r\n', 195.00, 2),
(21, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 10),
(22, 'Heavy-jersey hooded sweatshirt with bold rubberised logo\r\n', 345.00, 1),
(23, 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495.00, 2),
(24, 'Prada Triangle Cotton T-shirt\r\n', 760.00, 1),
(25, 'PARIS SPRAYED T-SHIRT\r\n', 195.00, 1);

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
(25, 7, 1, 195.00, '2023-04-26 16:56:48', 'Processed');

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
('3R1GC01NRIZ10999\r\n', 'Quilted water-repellent recycled nylon blazer with detachable inner panel\r\n', 675, 675, 'An outerwear garment made from a sustainable, unique and exclusive Korean fabric, in a deep colour, with good climatic resistance and exceptional durability, thanks to the very high-quality texture made from recycled nylon fibres, a reduced use of chemica', 'Jacket\r\n', 'EA, WaterRep, Nylon, Jacket, Black, Technical \r\n', '', 'Emporio Armani\r\n'),
('3R1GC11NNIZ10999\r\n', 'Water-repellent two-way stretch technical nylon jacket\r\n', 525, 525, 'The perfect fusion of a flawless fit and a matte, stretchy, performance fabric creates a garment designed to naturally follow every movement. Jacket with zip fastening and side pockets. The garment also features several standout technical properties: it i', 'Jacket\r\n', 'EA, WaterRep, Nylon, Blazer, Quilted\r\n', '', 'Emporio Armani\r\n'),
('3R1MDN1JWPZ10920\r\n', 'Heavy-jersey hooded sweatshirt with bold rubberised logo\r\n', 345, 345, 'Heavyweight hooded sweatshirt in pure cotton jersey. Featuring a bold logo in matching-tone rubber print on the front and back, an affirmation that the Emporio Armani logo is still a constant of undeniable style. Brushed lining.\r\n', 'Hoodie\r\n', 'Armani, Hoodie, Black, Large, Printed\r\n', '', 'Armani\r\n'),
('620973TNVQ11059\r\n', 'HAND DRAWN BB ICON HOODIE LARGE FIT IN BLACK\r\n', 850, 850, '• Curly fleece\r\n• Large fit\r\n• Hood without drawstring\r\n• 1 kangaroo pocket on front\r\n• Gathered at cuffs and waistline\r\n• Hand Drawn BB Icon artwork printed at front and back\r\n• Worn-out effect\r\n• Made in Portugal\r\n• Dry cleaning\r\n', 'Hoodie\r\n', 'Armani, Hoodie, Black\r\n', '', 'Balenciaga\r\n'),
('727163TNVR31070\r\n', 'MIRROR BALENCIAGA HOODIE OVERSIZED IN BLACK\r\n', 895, 895, '\"• Medium fleece\n• This item is unisex\n• Oversize fit\n• Hood without drawstring\n• Dropped shoulder\n• 1 kangaroo pocket on front\n• Gathered at cuffs and waistline\n• Mirror Balenciaga artwork printed at front\n• Made in Portugal\n• Cold machine wash\"', 'Hoodie\r\n', 'Balenciaga, Hoodie, Black, Oversized, Printed\r\n', '', 'Balenciaga\r\n'),
('PMAA001C99JER0050110\r\n', 'PARIS SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN WHITE WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN BLACK AT FRONT. STRAIGHT HEM. Fabric 100% Cotton\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, White, Printed\r\n', '', 'Palm Angels\r\n'),
('PMAA001C99JER0171010\r\n', 'PARIS SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK WITH BLACK SPRAYED PRINT AT FRONT. CREW NECK. LOGO AND \"PARIS\" PRINTED IN WHITE AT FRONT. STRAIGHT HEM. Fabric 100% Cotton\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed\r\n', '', 'Palm Angels\r\n'),
('PMAA001C99JER0241055\r\n', 'STAR SPRAYED T-SHIRT\r\n', 195, 195, 'SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH \"PALM ANGELS\" LOGO AND A GREEN SPRAYED STAR GRAPHIC PRINTED AT FRONT. CREWNECK COLLAR AND DROP SHOULDERS.FABRIC 100% COTTON\r\n', 'T-Shirt\r\n', 'Palm Angels,, T-Shirt, Black, Printed\n\n', '', 'Palm Angels\r\n'),
('PMAA066S23JER0021084\r\n', 'I LOVE PA CLASSIC TEE\r\n', 235, 235, '\"SHORT SLEEVES T-SHIRT IN BLACK COTTON WITH MULTICOLOR I LOVE PA GRAPHIC PRINTED AT FRONT. REGULAR FIT.\r\nFABRIC 100% COTTON\"\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed\r\n', '', 'Palm Angels\r\n'),
('PMAB001S23JER0021055\r\n', 'PALMS&SKULL LONG SLEEVED OVER TEE\r\n', 495, 495, '\"LONG SLEEVES T-SHIRT IN BLACK COTTON FEATURING \"\"PALM ANGELS\"\" BURNING LOGO AT FRONT AND BACK. PALM TREE & SKULLS GRAPHIC AT HEM. CREWNECK COLLAR AND REGULAR FIT.\r\nFABRIC 100% COTTON\"\r\n', 'T-Shirt\r\n', 'PalmAngels, T-Shirt, Black, Printed, Long Sleeve\r\n', '', 'Palm Angels\r\n'),
('UJN847_12VV_F0002_S_231\r\n', 'Prada Triangle Cotton T-shirt\r\n', 760, 760, 'An oversized decorative trim evoking details of Tyrolean style is reinvented with a modern twist, creating the unusual, conceptual graphic designs that enrich this classic cotton T-shirt.\n', 'T-Shirt\r\n', 'Prada, T-Shirt, White, Printed\n\n', '', 'Prada\r\n');

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
(1, '3R1GC01NRIZ10999\r\n', 1, 4, 'This product is exactly what I was looking for. It\'s easy to use and works great.', '2022-10-01'),
(2, '3R1GC01NRIZ10999\r\n', 2, 5, 'I am so impressed with this product! It exceeded my expectations in every way.', '2022-09-28'),
(3, '3R1GC01NRIZ10999\r\n', 3, 3, 'It\'s a decent product, but it has some flaws that could be improved.', '2022-09-23'),
(4, '3R1GC01NRIZ10999\r\n', 4, 2, 'I was really disappointed with this product. It didn\'t work as advertised and I had to return it.', '2022-09-18'),
(5, '3R1GC01NRIZ10999\r\n', 5, 4, 'This is a solid product that does what it says it will. I would recommend it to others.', '2022-09-12'),
(6, '3R1GC01NRIZ10999\r\n', 6, 5, 'I love this product! It\'s exactly what I needed and it arrived quickly.', '2022-09-10'),
(7, '620973TNVQ11059\r\n', 2, 5, 'I love this hoodie! The quality is amazing and it looks great on me.', '2022-02-20'),
(8, '620973TNVQ11059\r\n', 3, 3, 'The hoodie is okay, but nothing special. It fits well and is comfortable, but the design is a bit plain for my taste.', '2022-03-10'),
(9, '620973TNVQ11059\r\n', 4, 2, 'I was really disappointed with this hoodie. The quality is poor and the fit is not good. Would not recommend.', '2022-04-05'),
(10, '620973TNVQ11059\r\n', 5, 4, 'This hoodie is great for the price. Its comfortable and fits well. The only downside is that its a bit thin.', '2022-05-01'),
(11, '727163TNVR31070\r\n', 1, 3, 'The quality of this product is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-10'),
(12, '727163TNVR31070\r\n', 2, 5, 'I absolutely love this hoodie! Its so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-15'),
(13, '727163TNVR31070\r\n', 3, 4, 'Im really happy with this purchase. The hoodie is comfortable and fits well. The only downside is that its a bit pricey.', '2022-08-20'),
(14, '727163TNVR31070\r\n', 4, 2, 'I was really disappointed with this hoodie. Its not comfortable and the design is not good. Would not recommend.', '2022-09-05'),
(15, '727163TNVR31070\r\n', 5, 3, 'The hoodie is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(16, '620973TNVQ11059\r\n', 1, 4, 'Great product! The hoodie is comfortable and fits perfectly. Would definitely recommend.', '2022-01-15'),
(17, 'PMAA001C99JER0050110\r\n', 1, 4, 'I really like this t-shirt. It fits well and the material is soft and comfortable. The design is also cool.', '2022-01-01'),
(18, 'PMAA001C99JER0050110\r\n', 2, 5, 'This is an awesome t-shirt! The design is really unique and the quality is great. Highly recommend!', '2022-02-01'),
(19, 'PMAA001C99JER0050110\r\n', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and the material is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(20, 'PMAA001C99JER0050110\r\n', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-04-01'),
(21, 'PMAA001C99JER0050110\r\n', 5, 4, 'This is a nice t-shirt. It fits well and the material is comfortable. The design is not my favorite, but its still good.', '2022-05-01'),
(22, 'PMAA001C99JER0171010\r\n', 1, 3, 'The quality of this t-shirt is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-01'),
(23, 'PMAA001C99JER0171010\r\n', 2, 5, 'I absolutely love this t-shirt! Its so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-01'),
(24, 'PMAA001C99JER0171010\r\n', 3, 4, 'Im really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that its a bit pricey.', '2022-08-01'),
(25, 'PMAA001C99JER0171010\r\n', 4, 2, 'I was really disappointed with this t-shirt. Its not comfortable and the design is not good. Would not recommend.', '2022-09-01'),
(26, 'PMAA001C99JER0171010\r\n', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(27, 'PMAA001C99JER0241055\r\n', 2, 5, 'This is an awesome t-shirt! The design is really unique and the quality is great. Highly recommend!', '2022-02-01'),
(28, 'PMAA001C99JER0241055\r\n', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and the material is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(29, 'PMAA001C99JER0241055\r\n', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-04-01'),
(30, 'PMAA001C99JER0241055\r\n', 5, 4, 'This is a nice t-shirt. It fits well and the material is comfortable. The design is not my favorite, but it\'s still good.', '2022-05-01'),
(31, 'PMAA066S23JER0021084\r\n', 1, 3, 'The quality of this t-shirt is okay, but the design is not really my style. It fits well and is comfortable, though.', '2022-06-01'),
(32, 'PMAA066S23JER0021084\r\n', 2, 5, 'I absolutely love this t-shirt! It\'s so comfortable and the design is perfect for me. Would highly recommend!', '2022-07-01'),
(33, 'PMAA066S23JER0021084\r\n', 3, 4, 'I\'m really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that it\'s a bit pricey.', '2022-08-01'),
(34, 'PMAA066S23JER0021084\r\n', 4, 2, 'I was really disappointed with this t-shirt. It\'s not comfortable and the design is not good. Would not recommend.', '2022-09-01'),
(35, 'PMAA066S23JER0021084\r\n', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(36, 'PMAA001C99JER0241055\r\n', 1, 4, 'I really like this t-shirt. It fits well and the material is soft and comfortable. The design is also cool.', '2022-01-01'),
(37, 'PMAB001S23JER0021055\r\n', 1, 4, 'I really like this t-shirt. It\'s comfortable and the design is unique. The only downside is that it shrinks a bit after washing.', '2022-01-01'),
(38, 'PMAB001S23JER0021055\r\n', 2, 5, 'This is an awesome t-shirt! The quality is great and the design is perfect. It fits well and is comfortable. Highly recommend!', '2022-02-01'),
(39, 'PMAB001S23JER0021055\r\n', 3, 3, 'The t-shirt is okay, but nothing special. It fits well and is comfortable, but the design is a bit plain for my taste.', '2022-03-01'),
(40, 'PMAB001S23JER0021055\r\n', 4, 2, 'I was really disappointed with this t-shirt. The material is scratchy and the fit is not good. Would not recommend.', '2022-04-01'),
(41, 'PMAB001S23JER0021055\r\n', 5, 4, 'This is a nice t-shirt. It fits well and is comfortable. The design is not my favorite, but it\'s still good quality.', '2022-05-01'),
(42, 'UJN847_12VV_F0002_S_231\r\n', 1, 3, 'The quality of this t-shirt is average. It fits well and is comfortable, but the design is not really my style.', '2022-06-01'),
(43, 'UJN847_12VV_F0002_S_231\r\n', 2, 5, 'I absolutely love this t-shirt! It\'s so comfortable and the design is perfect for me. The quality is great too.', '2022-07-01'),
(44, 'UJN847_12VV_F0002_S_231\r\n', 3, 4, 'I\'m really happy with this purchase. The t-shirt is comfortable and fits well. The only downside is that it\'s a bit expensive.', '2022-08-01'),
(45, 'UJN847_12VV_F0002_S_231\r\n', 4, 2, 'I was really disappointed with this t-shirt. The quality is poor and the fit is not good. Would not recommend.', '2022-09-01'),
(46, 'UJN847_12VV_F0002_S_231\r\n', 5, 3, 'The t-shirt is okay, but nothing special. The quality is average and the design is a bit boring.', '2022-10-01'),
(50, 'PMAA001C99JER0241055\r\n', 21, 5, 'Comfy', '2023-03-20'),
(51, 'UJN847_12VV_F0002_S_231\r\n', 9, 5, 'menii sika biossu', '2023-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `salt`
--

CREATE TABLE `salt` (
  `username` varchar(255) NOT NULL,
  `salt` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('3R1GC01NRIZ10999\r\n', 13, 12, 10, 9, 2),
('3R1GC11NNIZ10999\r\n', 22, 32, 11, 4, 5),
('3R1MDN1JWPZ10920\r\n', 12, 10, 4, 7, 2),
('620973TNVQ11059\r\n', 2, 3, 4, 2, 3),
('727163TNVR31070\r\n', 22, 12, 12, 12, 12),
('PMAA001C99JER0050110\r\n', 22, 32, 32, 21, 42),
('PMAA001C99JER0171010\r\n', 22, 12, 41, 20, 10),
('PMAA001C99JER0241055\r\n', 11, 14, 13, 21, 32),
('PMAA066S23JER0021084\r\n', 11, 23, 21, 44, 10),
('PMAB001S23JER0021055\r\n', 10, 4, 9, 8, 7),
('UJN847_12VV_F0002_S_231\r\n', 12, 32, 44, 92, 19);

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
(1, 'Harsh', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Harsh', 'Khatri', 'hkhatri731@gmail.com', 871498876, 'To what city did you go on your honeymoon?', 'Khalis House', '2023-01-12', 1, 0),
(2, 'Kian', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Kian', 'Harding', 'kh@gmail.com', 830995017, 'Where were you when you first heard about 9/11?', 'Playground with stuffed animal', '2023-01-02', 1, 0),
(3, 'Khali', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Meshach', 'Atta-Nyarko', 'Mh@gmail.com', 830995017, 'Where were you when you first heard about 9/11?', 'At Osamas House', '2023-01-02', 1, 0),
(4, 'Deji', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Destiny', 'Wassup', 'deji@gmail.com', 830995017, 'What was the name of your first stuffed animal?', 'Kakashi Hatake', '2023-01-02', 0, 1),
(5, 'Ruth', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Catherine', 'Mc Keever', 'ruth.mckeever@dkit.ie', 830995017, 'What was the name of your first stuffed animal?', 'Pingu', '2023-01-02', 0, 0),
(6, 'Michelle', '08548b0b83d604190ddcf71f67f686f507a20c0a9b82c44f91f8c99c9fef3af7', 'Michelle', 'Graham', 'Michelle.Graham@dkit.ie', 830995017, 'What was the name of your first stuffed animal?', 'Mr Rhino', '2023-01-02', 0, 0),
(7, 'Bhig', '214c8377ffb724150205789f4a593a6182b66f56eca714a53bb7493a7391e0d8', 'biggaaaa', 'dhfhfs', 'attanyarkomeshach@gmail.com', 876352637, 'To what city did you go on your honeymoon?', 'Singapore', '2000-10-10', 1, 1),
(9, 'awwmee19', '172620255ee20252a50f83ad088a6f499750ae17dfe3a4e50b0c321f05e632fe', 'aww', 'mee', 'awwmee19@gmail.com', 876018205, 'What was the first concert you attended?', 'wo nana to jams', '1999-05-21', NULL, 0),
(13, 'kaka', 'GTHk9Xuo8PsoMeQZFncWnVbL/d48KirW6dfrBSqpjCE=', 'kjahjka', 'khkhjh', 'ajgjkga@gmail.com', 876263784, 'What was a thing you did as a child which was unique?', 'jggj', '2000-10-10', NULL, 1),
(14, 'sad', 'qGzFYKnXHSJnqmQZT6sL4wfGu5fFIe1eFqGyr3ZqczI=', 'sgjgdh', 'djghjghjd', 'shjghjghj@gmail.com', 876527364, 'What was the first concert you attended?', 'fjhjhf', '2000-08-09', NULL, 0);

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_ibfk_1` (`UserId`),
  ADD KEY `cart_ibfk_2` (`ProductId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

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
