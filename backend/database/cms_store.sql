-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2025 at 07:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `task` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `task`, `img`, `token`, `role`) VALUES
(1, 'Peter', 'Griffin', 'admin', '$2b$10$GF.1sXuUyP42bJMWmXAhmOWyyIyQoHO5NbzDlURqetFlFQzE8K/Gm', 'Front-end DeveloperDigital Marketer', 'img/peter.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9', 'admin'),
(2, 'Lois', 'Griffin', 'shahokhan', '$2b$10$YbA/GoMKhfhRRLUEv6lRQeZqb8V0hzOmF/gY0C9R3AZ0Esn8z7bkK', 'Python Developer', 'img/lois.jpg', 'G4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ', 'demo'),
(3, 'Stewie', 'Griffin', 'stewie_griffin', 'sa_ds12', 'Developer', 'img/stewie.jpg', 'SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Mobile Phones'),
(2, 'Laptops'),
(3, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(100) NOT NULL,
  `body` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `hour` varchar(100) NOT NULL,
  `userID` int(100) NOT NULL,
  `productID` int(100) NOT NULL,
  `is-reply` int(10) NOT NULL,
  `reply-id` int(100) NOT NULL,
  `isAccept` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `date`, `hour`, `userID`, `productID`, `is-reply`, `reply-id`, `isAccept`) VALUES
(1, 'This iPhone 15 Pro has an amazing camera and super fast performance!  ', '2025-06-15', '14:30', 4, 1, 0, 0, 0),
(2, 'Totally agree, the camera is next-level!', '2025-06-15', '15:45', 5, 1, 1, 1, 1),
(3, 'MacBook Air M2 is lightweight but the price is a bit high.', '2025-06-20', '09:15', 6, 7, 0, 0, 0),
(4, 'I found it worth the price for the performance.rtrt', '2025-06-20', '10:00', 7, 7, 1, 3, 1),
(5, 'Adidas Ultraboost 22 is super comfy for running, highly recommend!', '2025-07-01', '17:20', 8, 11, 0, 0, 0),
(6, 'Same here, best running shoes I’ve tried!', '2025-07-01', '18:05', 9, 11, 1, 5, 0),
(7, 'iPhone SE is great for the price, but battery life could improve.', '2025-06-25', '12:10', 10, 4, 0, 0, 1),
(8, 'Battery is decent for me, maybe update the software?', '2025-06-25', '13:30', 11, 4, 1, 7, 0),
(9, 'Adidas Track Pants are perfect for workouts, love the fit!', '2025-07-02', '08:45', 12, 15, 0, 0, 1),
(10, 'Glad you liked them, I’m getting a pair too!', '2025-07-02', '09:15', 13, 15, 1, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_sales`
--

CREATE TABLE `monthly_sales` (
  `id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `total_sales` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthly_sales`
--

INSERT INTO `monthly_sales` (`id`, `month`, `total_sales`) VALUES
(1, 'January', 1200.00),
(2, 'February', 980.00),
(3, 'March', 1430.00),
(4, 'April', 1110.00),
(5, 'May', 970.00),
(6, 'June', 1600.00),
(7, 'July', 1750.00),
(8, 'August', 1320.00),
(9, 'September', 1580.00),
(10, 'October', 1900.00),
(11, 'November', 2100.00),
(12, 'December', 2400.00);

-- --------------------------------------------------------

--
-- Table structure for table `offs`
--

CREATE TABLE `offs` (
  `id` int(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `percent` int(100) NOT NULL,
  `adminID` int(100) NOT NULL,
  `productID` int(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `isActive` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `offs`
--

INSERT INTO `offs` (`id`, `code`, `percent`, `adminID`, `productID`, `date`, `isActive`) VALUES
(1, 'SPRING20', 20, 1, 1, '2025-07-01 10:00:00', 0),
(2, 'SUMMER15', 15, 2, 2, '2025-07-02 11:30:00', 0),
(3, 'VIP30', 30, 3, 3, '2025-07-03 14:00:00', 1),
(4, 'FLASH10', 10, 1, 4, '2025-07-04 08:45:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `productID` int(100) NOT NULL,
  `userID` int(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `hour` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `off` int(100) NOT NULL,
  `sale` bigint(20) NOT NULL,
  `popularity` int(100) NOT NULL,
  `count` bigint(20) NOT NULL,
  `sale_count` bigint(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `productID`, `userID`, `date`, `hour`, `price`, `off`, `sale`, `popularity`, `count`, `sale_count`, `isActive`) VALUES
(15, 1, 4, '2025-07-01', '10:00', 190, 0, 190, 7, 3, 3, 1),
(16, 2, 5, '2025-07-02', '12:45', 100, 5, 95, 6, 3, 3, 0),
(17, 3, 2, '2025-07-03', '13:15', 95, 5, 90, 10, 1, 1, 1),
(18, 4, 5, '2025-07-04', '14:45', 140, 5, 133, 8, 3, 3, 1),
(19, 5, 4, '2025-07-05', '11:15', 250, 10, 225, 9, 3, 3, 1),
(20, 6, 6, '2025-07-06', '10:30', 130, 15, 111, 9, 1, 1, 0),
(21, 7, 6, '2025-07-07', '12:45', 220, 5, 209, 7, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `count` int(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `popularity` int(100) NOT NULL,
  `sale` int(100) NOT NULL,
  `colors` int(100) NOT NULL,
  `productDesc` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `categoryID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `count`, `img`, `popularity`, `sale`, `colors`, `productDesc`, `url`, `categoryID`) VALUES
(1, 'Apple iPhone 15 Pro', 1099, 45, '/src/img/iphone15pro.jpg', 95, 8792, 4, 'Premium iPhone with A17 chip, triple camera, and titanium frame for ultimate durability.', 'apple-iphone-15-pro', 1),
(2, 'Apple iPhone 14', 799, 60, '/src/img/iphone14.jpg', 99, 4794, 5, 'Sleek iPhone with A15 chip, dual camera, and vibrant display for everyday use.', 'apple-iphone-14', 1),
(3, 'Apple iPhone 13 Mini', 699, 31, '/src/img/iphone13mini.jpg', 85, 6291, 3, 'Compact iPhone with powerful A15 chip, great camera, and long battery life.', 'apple-iphone-13-mini', 1),
(4, 'Apple iPhone SE', 429, 80, '/src/img/iphonese.jpg', 80, 3432, 3, 'Affordable iPhone with A15 chip, classic design, and reliable performance for all.', 'apple-iphone-se', 1),
(5, 'Apple iPhone 15', 999, 50, '/src/img/iphone15.jpg', 92, 9990, 4, 'Latest iPhone with advanced camera, A16 chip, and sleek design for ultimate performance.', 'apple-iphone-15', 1),
(6, 'Apple MacBook Pro 14', 1999, 25, '/src/img/macbookpro14.jpg', 93, 15992, 2, 'Powerful MacBook with M2 Pro chip, Retina display, and exceptional battery life.', 'apple-macbook-pro-14', 2),
(7, 'Apple MacBook Air M2', 1199, 35, '/src/img/macbookairm2.jpg', 88, 8393, 3, 'Ultra-thin MacBook with M2 chip, stunning display, and all-day battery for professionals.', 'apple-macbook-air-m2', 2),
(8, 'Apple MacBook Pro 16', 2499, 20, '/src/img/macbookpro16.jpg', 96, 22491, 2, 'High-performance MacBook with M2 Max chip, ideal for creators and developers.', 'apple-macbook-pro-16', 2),
(9, 'Apple MacBook Air M1', 999, 45, '/src/img/macbookairm1.jpg', 85, 4995, 3, 'Lightweight MacBook with M1 chip, fast performance, and vibrant Retina display.', 'apple-macbook-air-m1', 2),
(10, 'Apple MacBook Pro 13', 1299, 30, '/src/img/macbookpro13.jpg', 90, 11691, 2, 'Compact MacBook with M2 chip, perfect for multitasking and creative projects.', 'apple-macbook-pro-13', 2),
(11, 'Adidas Ultraboost 22', 190, 100, '/src/img/ultraboost22.jpg', 85, 1710, 4, 'High-performance running shoes with responsive cushioning and stylish design for athletes.', 'adidas-ultraboost-22', 3),
(12, 'Adidas Originals Hoodie', 70, 150, '/src/img/hoodie.jpg', 75, 910, 5, 'Comfortable cotton hoodie with iconic Adidas logo, perfect for casual wear.', 'adidas-originals-hoodie', 3),
(13, 'Adidas NMD Sneakers', 140, 120, '/src/img/nmd.jpg', 80, 1680, 3, 'Trendy sneakers with Boost technology, offering comfort and style for daily use.', 'adidas-nmd-sneakers', 3),
(14, 'Adidas Sports Backpack', 50, 350, '/src/img/backpack.jpg', 72, 350, 4, 'Durable backpack with multiple compartments, ideal for gym and outdoor activities.', 'adidas-sports-backpack', 3),
(15, 'Adidas Track Pants', 60, 184, '/src/img/trackpants.jpg', 72, 540, 3, 'Lightweight track pants with breathable fabric, perfect for workouts or casual wear.', 'adidas-track-pants', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `firsname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `score` int(100) NOT NULL,
  `buy` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firsname`, `lastname`, `img`, `username`, `password`, `phone`, `city`, `email`, `address`, `score`, `buy`) VALUES
(1, 'Peter', 'Griffin', '/src/img/Peter.jpg', 'peter_griffin', '19901434', 5551234567, 'Quahog', 'peter@example.com', '31 Spooner Street, Quahog, RI', 98, 2143),
(2, 'Lois', 'Griffin', '/src/img/Lois.PNG', 'lois_griffin', '198585', 555525814, 'lois@gmail.com', 'Quahog', '31 Spooner Street, Quahog, RI', 45, 2857),
(3, 'Brian', 'Griffin', '/src/img/Brian.jpg', 'brian_griffin', 'ali190012', 5554567890, 'brian@gmail.com', 'Quahog', '31 Spooner Street, Quahog, RI', 89, 2034),
(4, 'Chris', 'Griffin', '/src/img/chris.jpg', 'chris_griffin', 'chris123', 5551112222, 'Quahog', 'chris@gmail.com', '31 Spooner Street, Quahog, RI', 85, 1500),
(5, 'Meg', 'Griffin', '/src/img/Meg.PNG', 'meg_griffin', 'meg456', 5552223333, 'Quahog', 'meg@gmail.com', '31 Spooner Street, Quahog, RI', 60, 800),
(6, 'Brian', 'Griffin', '/src/img/Brian.jpg', 'brian_griffin', 'brian789', 5553334444, 'Quahog', 'brian@gmail.com', '31 Spooner Street, Quahog, RI', 90, 2200),
(7, 'Glenn', 'Quagmire', '/src/img/Glenn.PNG', 'glenn_quagmire', 'giggity01', 5554445555, 'Quahog', 'glenn@gmail.com', '15 Elm Street, Quahog, RI', 75, 1800),
(8, 'Cleveland', 'Brown', '/src/img/Cleveland.PNG', 'cleveland_brown', 'clev123', 5555556666, 'Quahog', 'cleveland@gmail.com', '20 Maple Street, Quahog, RI', 70, 1200),
(9, 'Joe', 'Swanson', '/src/img/Joe.PNG', 'joe_swanson', 'joe456', 5556667777, 'Quahog', 'joe@gmail.com', '25 Oak Street, Quahog, RI', 82, 2000),
(10, 'Bonnie', 'Swanson', '/src/img/Bonnie.jpg', 'bonnie_swanson', 'bonnie789', 5557778888, 'Quahog', 'bonnie@gmail.com', '25 Oak Street, Quahog, RI', 65, 950),
(11, 'Mort', 'Goldman', '/src/img/Mort.jpg', 'mort_goldman', 'mort123', 5558889999, 'Quahog', 'mort@gmail.com', '30 Pine Street, Quahog, RI', 55, 600),
(12, 'Herbert', 'Family', '/src/img/Herbert.jpg', 'herbert_family', 'herb456', 5559990000, 'Quahog', 'herbert@gmail.com', '35 Cedar Street, Quahog, RI', 50, 700),
(13, 'Connie', 'D\'Amico', '/src/img/Connie.jpg', 'connie_damico', 'connie6969', 5550001111, 'Quahog', 'connie@gmail.com', '40 Birch Street, Quahog, RI', 95, 1100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `monthly_sales`
--
ALTER TABLE `monthly_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offs`
--
ALTER TABLE `offs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminID` (`adminID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `monthly_sales`
--
ALTER TABLE `monthly_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `offs`
--
ALTER TABLE `offs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `offs`
--
ALTER TABLE `offs`
  ADD CONSTRAINT `offs_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `offs_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
