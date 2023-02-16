-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2023 at 11:13 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `bottoms`
--

CREATE TABLE `bottoms` (
  `BottomsId` varchar(255) NOT NULL,
  `Name` varchar(55) NOT NULL,
  `Images` varchar(255) NOT NULL,
  `MRP` double NOT NULL,
  `Brand` varchar(55) NOT NULL,
  `CPrice` double NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Tags` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bottomsfilter`
--

CREATE TABLE `bottomsfilter` (
  `BottomsId` varchar(255) NOT NULL,
  `Fit` varchar(50) NOT NULL,
  `Colour` varchar(50) NOT NULL,
  `Style` varchar(50) NOT NULL,
  `Printed` varchar(50) NOT NULL,
  `Occasion` varchar(50) NOT NULL,
  `Length` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bottomsstock`
--

CREATE TABLE `bottomsstock` (
  `BottomsId` varchar(255) NOT NULL,
  `S` int(11) NOT NULL,
  `M` int(11) NOT NULL,
  `L` int(11) NOT NULL,
  `XL` int(11) NOT NULL
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
-- Table structure for table `tops`
--

CREATE TABLE `tops` (
  `TopsId` varchar(255) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Images` varchar(255) NOT NULL,
  `MRP` double NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `CPrice` double NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Tags` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `topsfilter`
--

CREATE TABLE `topsfilter` (
  `TopsId` varchar(255) NOT NULL,
  `Printed` varchar(50) NOT NULL,
  `Fit` varchar(50) NOT NULL,
  `NeckLine` varchar(50) NOT NULL,
  `Colour` varchar(50) NOT NULL,
  `Occasion` varchar(50) NOT NULL,
  `Material` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `topsstock`
--

CREATE TABLE `topsstock` (
  `TopsId` varchar(255) NOT NULL,
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
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` int(11) NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `username`, `password`, `FirstName`, `Lastname`, `Email`, `Phone`, `DOB`) VALUES
(1, 'seany', 'password', 'Sean', 'Dyche', 'sean1@gmail.com', 875234283, '1954-10-26'),
(2, 'deanSmt', 'password', 'Dean', 'Smith', 'deanSm@gmail.com', 84958266, '2000-04-08'),
(3, 'DanOb', 'password', 'Dani', 'Obrien', 'danObr@gmail.com', 879582432, '2001-07-20'),
(4, 'bigKhali', 'password', 'Meshach', 'Khali', 'meshKha@gmail.com', 84958266, '2002-10-08'),
(5, 'ferreter', 'password', 'Harsh', 'Kathri', 'katHarsh@student.dkit.ie', 84958266, '1965-01-11'),
(6, 'Kian', 'password', 'Kian', 'Harding', 'Kian123@gmail.com', 84958266, '2000-12-25'),
(7, 'kian2ki', 'Password1', 'Kian', 'Harding', 'kian2ki@hotmail.com', 83, '2023-02-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bottoms`
--
ALTER TABLE `bottoms`
  ADD PRIMARY KEY (`BottomsId`);

--
-- Indexes for table `bottomsfilter`
--
ALTER TABLE `bottomsfilter`
  ADD KEY `BottomsId` (`BottomsId`);

--
-- Indexes for table `bottomsstock`
--
ALTER TABLE `bottomsstock`
  ADD KEY `BottomsId` (`BottomsId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `tops`
--
ALTER TABLE `tops`
  ADD PRIMARY KEY (`TopsId`);

--
-- Indexes for table `topsfilter`
--
ALTER TABLE `topsfilter`
  ADD KEY `TopsId` (`TopsId`);

--
-- Indexes for table `topsstock`
--
ALTER TABLE `topsstock`
  ADD KEY `TopsId` (`TopsId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bottomsfilter`
--
ALTER TABLE `bottomsfilter`
  ADD CONSTRAINT `bottomsfilter_ibfk_1` FOREIGN KEY (`BottomsId`) REFERENCES `bottoms` (`BottomsId`);

--
-- Constraints for table `bottomsstock`
--
ALTER TABLE `bottomsstock`
  ADD CONSTRAINT `bottomsstock_ibfk_1` FOREIGN KEY (`BottomsId`) REFERENCES `bottoms` (`BottomsId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

--
-- Constraints for table `topsfilter`
--
ALTER TABLE `topsfilter`
  ADD CONSTRAINT `topsfilter_ibfk_1` FOREIGN KEY (`TopsId`) REFERENCES `tops` (`TopsId`);

--
-- Constraints for table `topsstock`
--
ALTER TABLE `topsstock`
  ADD CONSTRAINT `topsstock_ibfk_1` FOREIGN KEY (`TopsId`) REFERENCES `tops` (`TopsId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
