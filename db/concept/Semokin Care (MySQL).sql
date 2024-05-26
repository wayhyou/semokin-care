CREATE TABLE `Users` (
  `user_id` varchar(255) PRIMARY KEY,
  `username` varchar(255),
  `password` varchar(255),
  `email` varchar(255),
  `full_name` varchar(255),
  `phone_number` varchar(255),
  `address` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Products` (
  `product_id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `description` text,
  `price` money,
  `stock` integer,
  `category_id` varchar(255) COMMENT 'foreign key to Categories table',
  `brand_id` varchar(255) COMMENT 'foreign key to Brands table',
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Categories` (
  `category_id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `description` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Brands` (
  `brand_id` varchar(255) PRIMARY KEY,
  `name` varchar(255),
  `description` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Orders` (
  `order_id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255) COMMENT 'foreign key to Users table',
  `order_data` timestamp,
  `status` varchar(255) COMMENT 'Pending, Shipped, Delivered, Cancelled',
  `total_amount` money,
  `shipping_address` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `OrderItems` (
  `order_item_id` varchar(255) PRIMARY KEY,
  `order_id` varchar(255) COMMENT 'foreign key to Orders table',
  `product_id` varchar(255) COMMENT 'foreign key to Products table',
  `quantity` integer,
  `price` money,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Reviews` (
  `review_id` varchar(255) PRIMARY KEY,
  `product_id` varchar(255) COMMENT 'foreign key to Products table',
  `user_id` varchar(255) COMMENT 'foreign key to Users table',
  `rating` float COMMENT '1.0 - 5.0',
  `comment` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Cart` (
  `cart_id` varchar(255) PRIMARY KEY,
  `user_id` varchar(255) COMMENT 'foreign key to Users table',
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `CartItems` (
  `cart_item_id` varchar(255) PRIMARY KEY,
  `cart_id` varchar(255) COMMENT 'foreign key to Cart table',
  `product_id` varchar(255) COMMENT 'foreign key to Products table',
  `quantity` integer,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Payments` (
  `payment` varchar(255) PRIMARY KEY,
  `order_id` varchar(255) COMMENT 'foreign key to Orders table',
  `amount` money,
  `payment_method` varchar(255) COMMENT 'Credit Card, PayPal, etc.',
  `payment_status` varchar(255) COMMENT 'Pending, Completed, Failed',
  `payment_date` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `Orders` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `OrderItems` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`);

ALTER TABLE `OrderItems` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

ALTER TABLE `Products` ADD FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`);

ALTER TABLE `Products` ADD FOREIGN KEY (`brand_id`) REFERENCES `Brands` (`brand_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

ALTER TABLE `Cart` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `CartItems` ADD FOREIGN KEY (`cart_id`) REFERENCES `Cart` (`cart_id`);

ALTER TABLE `CartItems` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`);
