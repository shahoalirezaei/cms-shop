-- Basic Tables Creation Without Foreign Keys
-- CMS Store Database for Railway

-- Table: categories
CREATE TABLE categories (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(200) NOT NULL,
  img varchar(300) NOT NULL,
  href varchar(300) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: admins
CREATE TABLE admins (
  id int(100) NOT NULL AUTO_INCREMENT,
  firstname varchar(100) NOT NULL,
  lastname varchar(100) NOT NULL,
  username varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  task varchar(100) NOT NULL,
  img varchar(100) NOT NULL,
  token varchar(100) NOT NULL,
  role varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: users
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  firstname varchar(100) NOT NULL,
  lastname varchar(100) NOT NULL,
  username varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  email varchar(200) NOT NULL,
  phone varchar(100) NOT NULL,
  city varchar(100) NOT NULL,
  score int(11) NOT NULL,
  buy int(11) NOT NULL,
  role varchar(50) DEFAULT 'USER',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: monthlysales
CREATE TABLE monthlysales (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  price int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: products
CREATE TABLE products (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(300) NOT NULL,
  price int(11) NOT NULL,
  score float NOT NULL,
  count int(11) NOT NULL,
  img varchar(1000) NOT NULL,
  popularity int(11) NOT NULL,
  sale int(11) NOT NULL,
  colors int(11) NOT NULL,
  categoryID int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: comments
CREATE TABLE comments (
  id int(11) NOT NULL AUTO_INCREMENT,
  userID int(11) NOT NULL,
  productID int(11) NOT NULL,
  score int(11) NOT NULL,
  date varchar(50) NOT NULL,
  body text NOT NULL,
  isAccept int(11) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: offs
CREATE TABLE offs (
  id int(11) NOT NULL AUTO_INCREMENT,
  code varchar(20) NOT NULL,
  percent int(11) NOT NULL,
  productID int(11) NOT NULL,
  adminID int(11) NOT NULL,
  datetime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  max_use int(11) DEFAULT 1,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: orders
CREATE TABLE orders (
  id int(11) NOT NULL AUTO_INCREMENT,
  productID int(11) NOT NULL,
  userID int(11) NOT NULL,
  date varchar(20) NOT NULL,
  hour varchar(10) NOT NULL,
  popularity int(11) NOT NULL DEFAULT 0,
  sale int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;