-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 27, 2021 at 12:18 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_pinoh`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `cartId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CartItem`
--

CREATE TABLE `CartItem` (
  `cartItemId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` blob NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CategoryMenu`
--

CREATE TABLE `CategoryMenu` (
  `categoryId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Menu`
--

CREATE TABLE `Menu` (
  `menuId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `menuName` varchar(50) NOT NULL,
  `menuDescription` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` varchar(25) NOT NULL,
  `total` int(11) NOT NULL,
  `subTotal` int(11) NOT NULL,
  `itemDiscount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `grandTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `OrderItem`
--

CREATE TABLE `OrderItem` (
  `orderItemId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Register`
--

CREATE TABLE `Register` (
  `registerId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passwordHash` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `transactionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `userId` int(11) NOT NULL,
  `registerId` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passwordHash` varchar(200) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `loginType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `Cart_fk0` (`userId`);

--
-- Indexes for table `CartItem`
--
ALTER TABLE `CartItem`
  ADD PRIMARY KEY (`cartItemId`),
  ADD KEY `CartItem_fk0` (`menuId`),
  ADD KEY `CartItem_fk1` (`cartId`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD KEY `Category_fk0` (`categoryId`);

--
-- Indexes for table `CategoryMenu`
--
ALTER TABLE `CategoryMenu`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `CategoryMenu_fk0` (`menuId`);

--
-- Indexes for table `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`menuId`),
  ADD KEY `Menu_fk0` (`userId`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `Order_fk0` (`userId`);

--
-- Indexes for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD PRIMARY KEY (`orderItemId`),
  ADD KEY `OrderItem_fk0` (`menuId`),
  ADD KEY `OrderItem_fk1` (`orderId`);

--
-- Indexes for table `Register`
--
ALTER TABLE `Register`
  ADD PRIMARY KEY (`registerId`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `Transaction_fk0` (`userId`),
  ADD KEY `Transaction_fk1` (`orderId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `User_fk0` (`registerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cart`
--
ALTER TABLE `Cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CartItem`
--
ALTER TABLE `CartItem`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CategoryMenu`
--
ALTER TABLE `CategoryMenu`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Menu`
--
ALTER TABLE `Menu`
  MODIFY `menuId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OrderItem`
--
ALTER TABLE `OrderItem`
  MODIFY `orderItemId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Register`
--
ALTER TABLE `Register`
  MODIFY `registerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cart`
--
ALTER TABLE `Cart`
  ADD CONSTRAINT `Cart_fk0` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`);

--
-- Constraints for table `CartItem`
--
ALTER TABLE `CartItem`
  ADD CONSTRAINT `CartItem_fk0` FOREIGN KEY (`menuId`) REFERENCES `Menu` (`menuId`),
  ADD CONSTRAINT `CartItem_fk1` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`);

--
-- Constraints for table `Category`
--
ALTER TABLE `Category`
  ADD CONSTRAINT `Category_fk0` FOREIGN KEY (`categoryId`) REFERENCES `CategoryMenu` (`categoryId`);

--
-- Constraints for table `CategoryMenu`
--
ALTER TABLE `CategoryMenu`
  ADD CONSTRAINT `CategoryMenu_fk0` FOREIGN KEY (`menuId`) REFERENCES `Menu` (`menuId`);

--
-- Constraints for table `Menu`
--
ALTER TABLE `Menu`
  ADD CONSTRAINT `Menu_fk0` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`);

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`);

--
-- Constraints for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD CONSTRAINT `OrderItem_fk0` FOREIGN KEY (`menuId`) REFERENCES `Menu` (`menuId`),
  ADD CONSTRAINT `OrderItem_fk1` FOREIGN KEY (`orderId`) REFERENCES `Order` (`orderId`);

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`),
  ADD CONSTRAINT `Transaction_fk1` FOREIGN KEY (`orderId`) REFERENCES `Order` (`orderId`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_fk0` FOREIGN KEY (`registerId`) REFERENCES `Register` (`registerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
