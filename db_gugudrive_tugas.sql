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


-- Dumping database structure for db_gugudrive
DROP DATABASE IF EXISTS `db_gugudrive`;
CREATE DATABASE IF NOT EXISTS `db_gugudrive` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_gugudrive`;

-- Dumping structure for table db_gugudrive.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `filepath` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `filetype` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `owner` int NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_owner` (`owner`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_gugudrive.files: ~7 rows (approximately)
REPLACE INTO `files` (`id`, `filename`, `filepath`, `filetype`, `owner`, `updated_at`, `created_at`, `deleted_at`) VALUES
	(19, 'after edit', 'files/UxtmS06k3Kgt3cjONmyAQLrWbwyMw98o9wab1s5m.jpg', 'jpg', 3, '2024-11-26', '2024-11-25', NULL),
	(20, 'hawk tuah', 'files/li3zW81iUdqgKHANXcir2FoH7s0970d3uzpAIGtv.jpg', 'jpg', 3, '2024-11-25', '2024-11-25', NULL),
	(21, 'cheat gta', 'files/rTWBXm5NbBi6gfkiB9z8pazctwRMus1vc0xlmsa5.pdf', 'pdf', 3, '2024-11-25', '2024-11-25', NULL),
	(22, 'skibidi', 'files/xnxFEJLT7onquoOQL8jQsV0bn3plySsa1uVyUVV6.jpg', 'jpg', 3, '2024-11-25', '2024-11-25', NULL),
	(23, 'skibidi fortnite', 'files/QZrTMo122Kl3wKMZRFtgSOwzoOqG5rJ0edXbd1E5.jpg', 'jpg', 3, '2024-11-25', '2024-11-25', NULL),
	(24, 'ini punya kai cenat well', 'files/n9E4dRZcMGpxLLfIWIho5m3zINzTwJZGd7wwz9rE.jpg', 'jpg', 4, '2024-11-26', '2024-11-26', NULL),
	(25, 'ini pdf', 'files/DIN7htLAtzWpms0O6dJEcafq7EHM2eeddQ2g0zBO.pdf', 'pdf', 4, '2024-11-26', '2024-11-26', NULL);

-- Dumping structure for table db_gugudrive.shared_files
DROP TABLE IF EXISTS `shared_files`;
CREATE TABLE IF NOT EXISTS `shared_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_file` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`id_user`),
  KEY `fk_file` (`id_file`),
  CONSTRAINT `fk_file` FOREIGN KEY (`id_file`) REFERENCES `files` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_gugudrive.shared_files: ~0 rows (approximately)
REPLACE INTO `shared_files` (`id`, `id_user`, `id_file`) VALUES
	(2, 3, 24);

-- Dumping structure for table db_gugudrive.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_gugudrive.users: ~2 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `password`, `profile_url`, `updated_at`, `created_at`) VALUES
	(3, 'Mario Hawk Tuah', 'mht@istts.com', '123456', 'files/S3xvNyx82WEISXma5QUQMY10sUUklwt8UCTkkufr.jpg', '2024-11-25', '2024-11-24'),
	(4, 'Kai Cenat', 'a@a.com', 'aaaaaa', NULL, '2024-11-24', '2024-11-24');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
