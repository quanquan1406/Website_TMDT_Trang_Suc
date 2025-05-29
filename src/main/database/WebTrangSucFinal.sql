DROP DATABASE IF EXISTS ecommerce;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE admin (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  password VARCHAR(255),
  status INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255),
  password VARCHAR(255),
  phone_number VARCHAR(255),
  fullname VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  gender INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE address (
  id INTEGER AUTO_INCREMENT,
  address VARCHAR(255)  CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  user_id INTEGER,
  address_default INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)  CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)  CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  image VARCHAR(255),
  price INTEGER,
  sku VARCHAR(255),
  quantity INTEGER,
  description VARCHAR(255)  CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  category_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE carts (
  id INTEGER AUTO_INCREMENT,
  product_id INTEGER,
  category_id INTEGER,
  user_id INTEGER,
  price INTEGER,
  quantity INTEGER,
  total_price INTEGER,
  status INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE orders (
  id INTEGER AUTO_INCREMENT,
  cart_id INTEGER,
  user_id INTEGER,
  address_id INTEGER,
  total_price INTEGER,
  status INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (cart_id) REFERENCES carts (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Thêm dữ liệu vào bảng admin
INSERT INTO admin (username, password, status) VALUES 
('admin1', 'pass123', 1),
('admin2', 'pass456', 1),
('admin3', 'pass789', 1);

-- Thêm dữ liệu vào bảng users
INSERT INTO users (email, password, phone_number, fullname, gender) VALUES 
('user1@example.com', 'password1', '123456789', 'Ahihi', 1),
('user2@example.com', 'password2', '987654321', 'Amumu', 0),
('john.doe@example.com', 'password123', '1234567890', 'John Doe', 1),
('jane.smith@example.com', 'securepassword', '0987654321', 'Jane Smith', 0),
('lee.tran@example.com', 'hashedpassword', '1122334455', 'Lê Trần', 1);


-- Thêm dữ liệu vào bảng address
INSERT INTO address (address, user_id, address_default) VALUES 
('123 Main St', 1, 1),
('456 Oak St', 2, 1),
('123 Nguyễn Văn Cừ, Quận 5, TP.HCM', 1, 1),
('45 Lê Lợi, Quận 1, TP.HCM', 2, 1),
('78 Trần Phú, Quận 3, TP.HCM', 3, 0),
('56 Phan Văn Trị, Quận Gò Vấp, TP.HCM', 3, 1),
('123 Phan Văn Trị, Quận Gò Vấp, TP.HCM', 5, 1),
('456 Lê Thị Riêng, Quận 1, TP.HCM', 5, 0),
('90 Cách Mạng Tháng Tám, Quận 10, TP.HCM', 4, 1);



-- Thêm dữ liệu vào bảng categories
INSERT INTO categories (name) VALUES
('Khuyên tai'),
('Vòng cổ'),
('Vòng tay'),
('Nhẫn'),
('Dây chuyền');

-- Thêm dữ liệu vào bảng products
INSERT INTO products (name, image, price, sku, quantity, description, category_id) VALUES
 ('Superior Buffalo Horn Earrings', 'khuyentai1.jpg', 2800000, 'JE583', 11, 'Trademark: BETEKAR | Product Name: JE583 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 1),
 ('Earrings For Lover', 'khuyentai2.jpg', 3000000, 'JE683', 12, 'Trademark: BETEKAR | Product Name: JE683 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 1),
 ('Water Buffalo Horn Earrings', 'khuyentai3.jpg', 2800000, 'JE1583', 15, 'Trademark: BETEKAR | Product Name: JE1583 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 1),
 ('Earrings Of BETEKAR Jewelry', 'khuyentai4.jpg', 3200000, 'JE2256', 16, 'Trademark: BETEKAR | Product Name: JE2256 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 1),
 ('Earrings Collection For Summer', 'khuyentai5.jpg', 3200000, 'JE813', 12, 'Trademark: BETEKAR | Product Name: JE813 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 1);
 INSERT INTO products (name, image, price, sku, quantity, description, category_id) VALUES
 ('Superior Buffalo Horn Necklace', 'vongco1.jpg', 2800000, 'JN224', 5, 'Trademark: BETEKAR | Product Name: JN224 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 2),
 ('Necklace For Women', 'vongco2.jpg', 2800000, 'JN442', 6, 'Trademark: BETEKAR | Product Name: JN442 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 2),
 ('Water Buffalo Horn Necklace', 'vongco3.jpg', 2800000, 'JN554', 2, 'Trademark: BETEKAR | Product Name: JN554 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 2),
 ('Superior Buffalo Horn Necklace', 'vongco4.jpg', 2800000, 'JN345', 11, 'Trademark: BETEKAR | Product Name: JN345 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 2),
 ('New Necklace For New Day', 'vongco5.jpg', 2800000, 'JN667', 7, 'Trademark: BETEKAR | Product Name: JN667 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 2);
 INSERT INTO products (name, image, price, sku, quantity, description, category_id) VALUES
 ('Superior Buffalo Horn Bracelet', 'vongtay1.jpg', 2800000, 'JB523', 2, 'Trademark: BETEKAR | Product Name: JB523 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 3),
 ('BETEKAR Bracelet', 'vongtay2.jpg', 2800000, 'JB990', 6, 'Trademark: BETEKAR | Product Name: JB990 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 3),
 ('Bracelet For New Day', 'vongtay3.jpg', 1200000, 'JB113', 7, 'Trademark: BETEKAR | Product Name: JB113 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 3),
 ('Superior Horn Bracelet', 'vongtay4.jpg', 2800000, 'JB556', 3, 'Trademark: BETEKAR | Product Name: JB556 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 3),
 ('BETEKAR Collection Product', 'vongtay5.jpg', 2800000, 'JB453', 16, 'Trademark: BETEKAR | Product Name: JB453 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 3);
 INSERT INTO products (name, image, price, sku, quantity, description, category_id) VALUES
('Elegant Buffalo Horn Ring', 'nhan1.jpg', 1500000, 'RG101', 20, 'Trademark: BETEKAR | Product Name: RG101 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 4),
('Vintage Horn Band Ring', 'nhan2.jpg', 1800000, 'RG102', 15, 'Trademark: BETEKAR | Product Name: RG102 | Material: Vintage Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 4),
('Minimalist Horn Ring', 'nhan3.jpg', 1200000, 'RG103', 25, 'Trademark: BETEKAR | Product Name: RG103 | Material: Natural Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 4),
('Adjustable Horn Ring', 'nhan4.jpg', 2200000, 'RG104', 10, 'Trademark: BETEKAR | Product Name: RG104 | Material: Handcrafted Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 4),
('Premium Buffalo Horn Ring', 'nhan5.jpg', 3000000, 'RG105', 8, 'Trademark: BETEKAR | Product Name: RG105 | Material: High-quality Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 4);
INSERT INTO products (name, image, price, sku, quantity, description, category_id) VALUES 
('Natural Buffalo Horn Necklace', 'daychuyen1.jpg', 3500000, 'NK201', 12, 'Trademark: BETEKAR | Product Name: NK201 | Material: Superior Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 5),
('Handcrafted Horn Pendant Necklace', 'daychuyen2.jpg', 4000000, 'NK202', 8, 'Trademark: BETEKAR | Product Name: NK202 | Material: Handcrafted Buffalo Horn | Pendant Included | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 5),
('Minimalist Buffalo Horn Chain', 'daychuyen3.jpg', 2800000, 'NK203', 20, 'Trademark: BETEKAR | Product Name: NK203 | Material: Minimalist Buffalo Horn Design | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 5),
('Premium Horn Statement Necklace', 'daychuyen4.jpg', 5500000, 'NK204', 5, 'Trademark: BETEKAR | Product Name: NK204 | Material: High-quality Buffalo Horn | Elegant Design | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 5),
('Vintage Buffalo Horn Necklace', 'daychuyen5.jpg', 4800000, 'NK205', 10, 'Trademark: BETEKAR | Product Name: NK205 | Material: Vintage Buffalo Horn | Made in: Vietnam | Made by: Skilled Craftsman | Insurance: 6 Months', 5);

-- Thêm dữ liệu vào bảng carts
INSERT INTO carts (product_id, category_id, user_id, price, quantity, total_price, status) VALUES 
(1, 1, 1, 2800000, 1, 2800000, 1),
(2, 2, 2, 3000000, 2, 6000000, 1),
(1, 1, 1, 2800000, 2, 5600000, 1),
(2, 1, 2, 3000000, 1, 3000000, 1),
(6, 2, 3, 2800000, 3, 8400000, 1),
(11, 3, 1, 1200000, 5, 6000000, 1),
(16, 4, 2, 1500000, 1, 1500000,1),
(5, 1, 4, 3200000, 1, 3200000, 1),
(10, 2, 4, 2800000, 2, 5600000, 1),
(15, 3, 5, 2800000, 3, 8400000, 1),
(19, 4, 5, 3000000, 1, 3000000, 1),
(20, 5, 3, 3500000, 2, 7000000, 1);

-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (cart_id, user_id, address_id, total_price, status) VALUES 
(1, 1, 1, 2800000,0),
(2, 2, 2, 6000000, 1),
(3, 1, 3, 5600000, 2),
(12, 3, 6, 7000000, 1),
(8, 4, 9, 3200000, 1),
(9, 4, 9, 5600000, 1),
(11, 5, 7, 3000000, 1),
(10, 5, 8, 8400000, 1),
(6 , 1, 3, 6000000, 1),
(7 , 2, 4, 1500000,1),
(5, 3, 5, 8400000, 1),
(4, 2, 4, 3000000, 1);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;