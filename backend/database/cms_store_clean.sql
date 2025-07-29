-- Clean SQL file for Railway MySQL Database
-- CMS Store Database Structure and Data

-- Table structure for table `admins`
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

-- Dumping data for table `admins`
INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `task`, `img`, `token`, `role`) VALUES
(1, 'Peter', 'Griffin', 'admin', '$2b$10$GF.1sXuUyP42bJMWmXAhmOWyyIyQoHO5NbzDlURqetFlFQzE8K/Gm', 'Front-end DeveloperDigital Marketer', 'img/peter.jpg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9', 'admin'),
(2, 'Lois', 'Griffin', 'shahokhan', '$2b$10$YbA/GoMKhfhRRLUEv6lRQeZqb8V0hzOmF/gY0C9R3AZ0Esn8z7bkK', 'Python Developer', 'img/lois.jpg', 'G4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ', 'demo'),
(3, 'Stewie', 'Griffin', 'stewie_griffin', 'sa_ds12', 'Developer', 'img/stewie.jpg', 'SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c', NULL);

-- Table structure for table `categories`
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `img` varchar(300) NOT NULL,
  `href` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `categories`
INSERT INTO `categories` (`id`, `title`, `img`, `href`) VALUES
(1, 'گوشی موبایل', 'img/categories-1.png', '/category-info/گوشی موبایل'),
(2, 'کامپیوتر', 'img/categories-2.png', '/category-info/کامپیوتر'),
(3, 'لپ تاپ', 'img/categories-3.png', '/category-info/لپ تاپ'),
(4, 'هدفون', 'img/categories-4.png', '/category-info/هدفون'),
(5, 'ساعت هوشمند', 'img/categories-5.png', '/category-info/ساعت هوشمند'),
(6, 'کنسول بازی', 'img/categories-6.png', '/category-info/کنسول بازی');

-- Table structure for table `comments`
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `isAccept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `comments`
INSERT INTO `comments` (`id`, `userID`, `productID`, `score`, `date`, `body`, `isAccept`) VALUES
(1, 1, 1, 5, '1403/5/1', 'عالی بود', 1),
(2, 2, 1, 4, '1403/5/2', 'خوب بود اما قیمت کمی بالا', 1),
(3, 3, 2, 3, '1403/5/3', 'متوسط بود', 1),
(4, 1, 3, 5, '1403/5/4', 'بسیار عالی', 1),
(5, 2, 4, 4, '1403/5/5', 'کیفیت خوب داره', 1);

-- Table structure for table `monthlysales`
CREATE TABLE `monthlysales` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `monthlysales`
INSERT INTO `monthlysales` (`id`, `title`, `price`) VALUES
(1, 'فروردین', 7500000),
(2, 'اردیبهشت', 6200000),
(3, 'خرداد', 8100000),
(4, 'تیر', 9300000),
(5, 'مرداد', 7800000),
(6, 'شهریور', 8900000),
(7, 'مهر', 9500000),
(8, 'آبان', 8200000),
(9, 'آذر', 9800000),
(10, 'دی', 8700000),
(11, 'بهمن', 9100000),
(12, 'اسفند', 10200000);

-- Table structure for table `offs`
CREATE TABLE `offs` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `percent` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `max_use` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `offs`
INSERT INTO `offs` (`id`, `code`, `percent`, `productID`, `adminID`, `datetime`, `max_use`) VALUES
(1, 'SUMMER20', 20, 1, 1, '2025-07-23 23:25:54', 1),
(2, 'WINTER15', 15, 2, 1, '2025-07-23 23:25:54', 5),
(3, 'NEWUSER10', 10, 3, 2, '2025-07-23 23:25:54', 3);

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `popularity` int(11) NOT NULL DEFAULT 0,
  `sale` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `orders`
INSERT INTO `orders` (`id`, `productID`, `userID`, `date`, `hour`, `popularity`, `sale`) VALUES
(1, 1, 1, '1403/5/1', '14:30', 1, 1),
(2, 2, 2, '1403/5/2', '16:45', 1, 1),
(3, 3, 3, '1403/5/3', '10:20', 1, 1),
(4, 1, 2, '1403/5/4', '18:15', 1, 1),
(5, 4, 1, '1403/5/5', '12:00', 1, 1);

-- Table structure for table `products`
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `score` float NOT NULL,
  `count` int(11) NOT NULL,
  `img` varchar(1000) NOT NULL,
  `popularity` int(11) NOT NULL,
  `sale` int(11) NOT NULL,
  `colors` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `products`
INSERT INTO `products` (`id`, `title`, `price`, `score`, `count`, `img`, `popularity`, `sale`, `colors`, `categoryID`) VALUES
(1, 'گوشی سامسونگ Galaxy S23', 25000000, 4.5, 15, 'img/products-1.jpg', 120, 85, 3, 1),
(2, 'کامپیوتر گیمینگ ASUS', 45000000, 4.8, 8, 'img/products-2.jpg', 95, 12, 2, 2),
(3, 'لپ تاپ MacBook Pro', 65000000, 4.9, 5, 'img/products-3.jpg', 150, 8, 2, 3),
(4, 'هدفون بی سیم Sony', 8500000, 4.3, 25, 'img/products-4.jpg', 200, 45, 4, 4),
(5, 'ساعت هوشمند Apple Watch', 15000000, 4.6, 12, 'img/products-5.jpg', 180, 35, 5, 5),
(6, 'PlayStation 5', 35000000, 4.7, 6, 'img/products-6.jpg', 300, 25, 1, 6);

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `score` int(11) NOT NULL,
  `buy` int(11) NOT NULL,
  `role` varchar(50) DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- Dumping data for table `users`
INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `phone`, `city`, `score`, `buy`, `role`) VALUES
(1, 'علی', 'احمدی', 'ali_ahmadi', '$2b$10$example1', 'ali@example.com', '09123456789', 'تهران', 150, 2, 'USER'),
(2, 'مریم', 'رضایی', 'maryam_rezaei', '$2b$10$example2', 'maryam@example.com', '09987654321', 'اصفهان', 200, 3, 'USER'),
(3, 'حسن', 'محمدی', 'hassan_mohammadi', '$2b$10$example3', 'hassan@example.com', '09112345678', 'شیراز', 100, 1, 'USER');

-- Indexes and Auto Increment settings
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `productID` (`productID`);

ALTER TABLE `monthlysales`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `offs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `adminID` (`adminID`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT settings
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `monthlysales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `offs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- Foreign Key Constraints
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

ALTER TABLE `offs`
  ADD CONSTRAINT `offs_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `offs_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`);