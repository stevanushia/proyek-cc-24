-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laracoffee
CREATE DATABASE IF NOT EXISTS `laracoffee` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laracoffee`;

-- Dumping structure for table laracoffee.banks
CREATE TABLE IF NOT EXISTS `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.banks: ~4 rows (approximately)
REPLACE INTO `banks` (`id`, `bank_name`, `account_number`, `logo`, `created_at`, `updated_at`) VALUES
	(1, 'Mandiri', '092 7840 1923 7422', 'bank-mandiri.svg', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'BRI', '082 9192 9183 3041', 'bank-bri.svg', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'BCA', '019 8272 8274 1234', 'bank-bca.svg', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(4, 'BNI', '076 8291 6371 6279', 'bank-bni.svg', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.categories: ~4 rows (approximately)
REPLACE INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
	(1, 'Product Sale', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'Production Cost', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'Marketing Cost', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(4, 'Server Maintanance', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.migrations: ~0 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2022_07_31_034300_create_users_table', 1),
	(3, '2022_08_01_022935_create_roles_table', 1),
	(4, '2022_08_02_142955_create_products_table', 1),
	(5, '2022_08_05_141036_create_orders_table', 1),
	(6, '2022_08_05_142133_create_banks_table', 1),
	(7, '2022_08_05_142158_create_payments_table', 1),
	(8, '2022_08_05_142213_create_notes_table', 1),
	(9, '2022_08_05_142234_create_statuses_table', 1),
	(10, '2022_08_09_132544_create_transactions_table', 1),
	(11, '2022_08_11_132444_create_reviews_table', 1),
	(12, '2022_08_12_090054_create_categories_table', 1);

-- Dumping structure for table laracoffee.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.notes: ~6 rows (approximately)
REPLACE INTO `notes` (`id`, `order_notes`, `created_at`, `updated_at`) VALUES
	(1, 'waiting for COD meeting', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, '[no proof of transfer] is waiting for the proof of transaction to be sent', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'proof of transfer successfully sent, waiting for approval from admin', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(4, 'proof of transfer approved, waiting for product delivery', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(5, 'transaction success', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(6, 'the order is canceled directly by the user', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int NOT NULL,
  `payment_id` int NOT NULL,
  `bank_id` int DEFAULT NULL,
  `note_id` int NOT NULL,
  `status_id` int NOT NULL,
  `transaction_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_done` int NOT NULL,
  `refusal_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_used` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.orders: ~0 rows (approximately)

-- Dumping structure for table laracoffee.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.payments: ~2 rows (approximately)
REPLACE INTO `payments` (`id`, `payment_method`, `created_at`, `updated_at`) VALUES
	(1, 'Transfer Bank', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'COD', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laracoffee.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orientation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `discount` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_name_unique` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.products: ~3 rows (approximately)
REPLACE INTO `products` (`id`, `product_name`, `orientation`, `description`, `price`, `stock`, `discount`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Toraja Coffee', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Adipisci porro debitis eius deserunt odio, repudiandae ad repellendus laboriosam nobis sed?', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem temporibus, pariatur, tempore quia officiis at repudiandae dolore assumenda sunt fugiat alias illo nam minus autem dolor voluptate. Dignissimos eum natus ipsum optio neque numquam, voluptatem autem! Officiis, voluptas. Dolorum atque minima, aliquam facilis minus exercitationem aliquid doloremque vero, error qui consequatur quas tempore aspernatur asperiores cupiditate similique? Eius esse excepturi repellat deleniti, asperiores quas magni! Labore facere dicta expedita natus quisquam eaque, aspernatur minima quas nobis mollitia soluta sed id incidunt consequatur recusandae. Asperiores distinctio cum recusandae, odit earum quod vero similique assumenda? Autem perferendis ipsa accusamus id eaque. Sapiente!', 50000, 120, 5, 'product/gaamRDJEO5xNbQMfgSXx91ZNIVYxid2S110yVkKg.jpg', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'Arabica Coffee', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Adipisci porro debitis eius deserunt odio, repudiandae ad repellendus laboriosam nobis sed?', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem temporibus, pariatur, tempore quia officiis at repudiandae dolore assumenda sunt fugiat alias illo nam minus autem dolor voluptate. Dignissimos eum natus ipsum optio neque numquam, voluptatem autem! Officiis, voluptas. Dolorum atque minima, aliquam facilis minus exercitationem aliquid doloremque vero, error qui consequatur quas tempore aspernatur asperiores cupiditate similique? Eius esse excepturi repellat deleniti, asperiores quas magni! Labore facere dicta expedita natus quisquam eaque, aspernatur minima quas nobis mollitia soluta sed id incidunt consequatur recusandae. Asperiores distinctio cum recusandae, odit earum quod vero similique assumenda? Autem perferendis ipsa accusamus id eaque. Sapiente!', 35000, 60, 0, 'product/r8e0iS6hEBocNNBRkmTy5uL7BUf9IjNSQmZrgKJy.jpg', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'Robusta Coffee', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Adipisci porro debitis eius deserunt odio, repudiandae ad repellendus laboriosam nobis sed?', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem temporibus, pariatur, tempore quia officiis at repudiandae dolore assumenda sunt fugiat alias illo nam minus autem dolor voluptate. Dignissimos eum natus ipsum optio neque numquam, voluptatem autem! Officiis, voluptas. Dolorum atque minima, aliquam facilis minus exercitationem aliquid doloremque vero, error qui consequatur quas tempore aspernatur asperiores cupiditate similique? Eius esse excepturi repellat deleniti, asperiores quas magni! Labore facere dicta expedita natus quisquam eaque, aspernatur minima quas nobis mollitia soluta sed id incidunt consequatur recusandae. Asperiores distinctio cum recusandae, odit earum quod vero similique assumenda? Autem perferendis ipsa accusamus id eaque. Sapiente!', 55000, 70, 10, 'product/Gy6UVqa000obrsMGJaRAzZ4hWEz5WGhu38QawLzC.jpg', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_edit` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.reviews: ~0 rows (approximately)

-- Dumping structure for table laracoffee.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.roles: ~3 rows (approximately)
REPLACE INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'Customer', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'Supplier', '2024-12-22 02:20:29', '2024-12-22 02:20:30');

-- Dumping structure for table laracoffee.statuses
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.statuses: ~5 rows (approximately)
REPLACE INTO `statuses` (`id`, `order_status`, `style`, `created_at`, `updated_at`) VALUES
	(1, 'approve', 'success', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(2, 'pending', 'warning', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(3, 'rejected', 'danger', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(4, 'done', 'info', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(5, 'canceled', 'secondary', '2024-12-20 10:04:17', '2024-12-20 10:04:17');

-- Dumping structure for table laracoffee.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `income` int DEFAULT NULL,
  `outcome` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.transactions: ~0 rows (approximately)

-- Dumping structure for table laracoffee.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon` int NOT NULL,
  `point` int NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracoffee.users: ~9 rows (approximately)
REPLACE INTO `users` (`id`, `fullname`, `username`, `email`, `password`, `role_id`, `image`, `phone`, `gender`, `address`, `coupon`, `point`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Moh. Najib Fikri', 'pStar7', 'najibfikri13@gmail.com', '$2y$10$VMZbqc8qe2KTxGNrTHRw5./fLxoS/oBn4ELdciLxt8k7bNsQBa.R6', 1, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '08123456789123', 'M', 'Shell road number 10', 0, 0, '3mRQJNknkT0efg6jQzIWB1fcxTZNkb', '2024-12-20 10:04:15', '2024-12-20 10:04:15'),
	(2, 'Patrick Star', 'its_me', 'member@gmail.com', '$2y$10$Y3z9Rej0xxW6s2Fdz7iY2.j5LZ28Ytys2pw2QtDQ3.teAdbnUoc2S', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '082918391823', 'M', 'Shell road number 18', 0, 0, 'TbhYqSw2ym0Y78Gxh7adi5oJ7qVR6n', '2024-12-20 10:04:15', '2024-12-20 10:04:15'),
	(3, 'Squidy', 'goodman', 'squidy@gmail.com', '$2y$10$g.8QtGeKiOpZQt4eHlXWOO61rsv745KwNoxGKfyl4O4mvn917JuOe', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '019292823382', 'M', 'Small healt', 0, 0, '58CgnAMrlr08p4KsKEETEtNNeaLLJx', '2024-12-20 10:04:16', '2024-12-20 10:04:16'),
	(4, 'Viviane Schuppe', 'Gabriella', 'keshawn.bogisich@example.com', '$2y$10$KH8X9c69S8PjUBtLeAXlaum21q2amgmaQRf0FOKESdrUdlId5d93m', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '718.288.1029', 'F', '440 Syble Spring\nPort Heavenshire, CT 27914', 0, 0, 'T4mUBjHu61DFi7LAfUDD5MvcnV9qMJ', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(5, 'Jimmy Goodwin', 'Kennith', 'xschultz@example.net', '$2y$10$A/leAr7a4dipqLIsci8Hc.NT2d0O7QSNp9eYydtuGXrAcK1Bzz8uK', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '1-458-631-0432', 'F', '6194 Gail River\nNorth Deonchester, CO 72033-7250', 0, 0, 'zbcEEwJT4Itfmd9POhCnSmvI8OKk6Z', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(6, 'Toby Effertz', 'Doris', 'lesch.christiana@example.com', '$2y$10$GuYGPo4CPp9Z.uhvVsBxGeqBUJVXl3UxaH1e2jBsvn8cXgDzKGJqO', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '1-212-378-8372', 'F', '365 Rashawn Pine\nLake Mosesstad, WY 36608-5139', 0, 0, 'detqADfFEBMhrsQFCNbCDh6ksV1DcA', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(7, 'Mr. Alfredo Rowe', 'Norval', 'emmett.jast@example.net', '$2y$10$NVFaCKCYs3nVCdNMT3Nba.9VOD4UEH3WJOglz7pFI/83BaaTw5aGm', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '+1 (743) 305-8626', 'M', '522 Cruickshank Prairie\nBarrettview, NE 75906-3580', 0, 0, 'uUIQ2PODqJD8uQIeX9tG0v491VgJPk', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(8, 'Lowell Casper', 'Hassie', 'zoey81@example.com', '$2y$10$CFxpv0VkaKgKOZDO.fejHu0OpzCEB6yoMwUI100BVrkpYIXNkOqU6', 2, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '850-927-0006', 'M', '782 Travis Ridge Suite 459\nGerhardfort, OK 39517-6114', 0, 0, '0xqfyykVYC3fKpF6tHauCtkfQgqEnV', '2024-12-20 10:04:17', '2024-12-20 10:04:17'),
	(9, 'sugeng halimawan', 'sugenghalimawan', 'sugeng@gmail.com', '$2y$10$QYpOhHep8hb2Gmc6TcjtDuwImqqvny0cApnveyhrrYzkCJ25iQfBe', 1, 'profile/cV8nuMT7VBfYYtANwUxegJ366XDbw0nXdxLEvehk.jpg', '5553428400', 'M', 'jalan raya', 0, 0, 'e4jM29gtqFx3OgByvvsV0gf3CUoWIiXqqayZ0dy9fOPfcP3RFjsjN79vFvNm', '2024-12-20 19:44:20', '2024-12-20 19:44:20');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
