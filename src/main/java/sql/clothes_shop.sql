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
