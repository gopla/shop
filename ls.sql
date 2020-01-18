-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.1.36-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win32
-- HeidiSQL Versi:               10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk ls
CREATE DATABASE IF NOT EXISTS `ls` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ls`;

-- membuang struktur untuk table ls.budget
CREATE TABLE IF NOT EXISTS `budget` (
  `id_budget` int(11) NOT NULL AUTO_INCREMENT,
  `pemasukan` int(11) DEFAULT '0',
  `pengeluaran` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_budget`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='\r\n';

-- Membuang data untuk tabel ls.budget: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` (`id_budget`, `pemasukan`, `pengeluaran`, `balance`, `created_at`, `updated_at`) VALUES
	(1, 1150000, 50439000, -49289000, '2019-07-08 19:00:15', '2020-01-18 04:22:16');
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;

-- membuang struktur untuk table ls.budget_detail
CREATE TABLE IF NOT EXISTS `budget_detail` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_budget` int(11) DEFAULT '1',
  `id_cicilan` int(11) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `total` int(20) DEFAULT NULL,
  `jenis` enum('Pemasukan','Pengeluaran') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `id_cicilan` (`id_cicilan`),
  KEY `id_pembelian` (`id_pembelian`),
  KEY `id_budget` (`id_budget`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `FK_budget_detail_budget` FOREIGN KEY (`id_budget`) REFERENCES `budget` (`id_budget`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_budget_detail_cicilan_detail` FOREIGN KEY (`id_cicilan`) REFERENCES `cicilan_detail` (`id_cicilan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_budget_detail_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_budget_detail_pembelian` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.budget_detail: ~70 rows (lebih kurang)
/*!40000 ALTER TABLE `budget_detail` DISABLE KEYS */;
INSERT INTO `budget_detail` (`id_detail`, `id_budget`, `id_cicilan`, `id_pembelian`, `id_customer`, `total`, `jenis`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 1, 1, 4200000, 'Pengeluaran', '2019-07-14 03:43:06', '2019-07-14 03:43:06'),
	(2, 1, NULL, 2, 2, 460000, 'Pengeluaran', '2019-07-14 03:44:13', '2019-07-14 03:44:13'),
	(3, 1, NULL, 3, 2, 500000, 'Pengeluaran', '2019-07-14 03:44:41', '2019-07-14 03:44:41'),
	(4, 1, NULL, 4, 2, 54000, 'Pengeluaran', '2019-07-14 03:45:16', '2019-07-14 03:45:16'),
	(5, 1, NULL, 5, 3, 900000, 'Pengeluaran', '2019-07-14 03:45:54', '2019-07-14 03:45:54'),
	(6, 1, NULL, 6, 4, 395000, 'Pengeluaran', '2019-07-14 03:46:25', '2019-07-14 03:46:25'),
	(7, 1, NULL, 7, 4, 395000, 'Pengeluaran', '2019-07-14 03:46:45', '2019-07-14 03:46:45'),
	(8, 1, NULL, 8, 4, 265000, 'Pengeluaran', '2019-07-14 03:47:03', '2019-07-14 03:47:03'),
	(9, 1, NULL, 9, 5, 110000, 'Pengeluaran', '2019-07-14 03:47:38', '2019-07-14 03:47:38'),
	(10, 1, NULL, 10, 5, 95000, 'Pengeluaran', '2019-07-14 03:48:02', '2019-07-14 03:48:02'),
	(11, 1, NULL, 11, 6, 115000, 'Pengeluaran', '2019-07-14 03:48:41', '2019-07-14 03:48:41'),
	(12, 1, NULL, 12, 6, 10000, 'Pengeluaran', '2019-07-14 03:49:03', '2019-07-14 03:49:03'),
	(13, 1, NULL, 13, 6, 2850000, 'Pengeluaran', '2019-07-14 03:49:22', '2019-07-14 03:49:22'),
	(14, 1, NULL, 14, 7, 1800000, 'Pengeluaran', '2019-07-14 03:49:55', '2019-07-14 03:49:55'),
	(15, 1, NULL, 15, 7, 88000, 'Pengeluaran', '2019-07-14 03:50:19', '2019-07-14 03:50:19'),
	(16, 1, NULL, 16, 7, 20000, 'Pengeluaran', '2019-07-14 03:50:34', '2019-07-14 03:50:34'),
	(17, 1, NULL, 17, 8, 68000, 'Pengeluaran', '2019-07-14 03:50:59', '2019-07-14 03:50:59'),
	(18, 1, NULL, 18, 8, 245000, 'Pengeluaran', '2019-07-14 03:51:30', '2019-07-14 03:51:30'),
	(19, 1, NULL, 19, 8, 20000, 'Pengeluaran', '2019-07-14 03:52:03', '2019-07-14 03:52:03'),
	(20, 1, NULL, 20, 8, 110000, 'Pengeluaran', '2019-07-14 03:52:22', '2019-07-14 03:52:22'),
	(21, 1, NULL, 21, 8, 75000, 'Pengeluaran', '2019-07-14 03:53:00', '2019-07-14 03:53:00'),
	(22, 1, NULL, 22, 8, 120000, 'Pengeluaran', '2019-07-14 03:53:26', '2019-07-14 03:53:26'),
	(23, 1, NULL, 23, 8, 55000, 'Pengeluaran', '2019-07-14 03:54:04', '2019-07-14 03:54:04'),
	(24, 1, 1, NULL, 1, 75000, 'Pemasukan', '2019-07-14 04:02:36', '2019-07-14 04:02:36'),
	(25, 1, 1, NULL, 1, 75000, 'Pemasukan', '2019-07-14 04:03:00', '2019-07-14 04:03:00'),
	(26, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:03:08', '2019-07-14 04:03:08'),
	(27, 1, 1, NULL, 1, 200000, 'Pemasukan', '2019-07-14 04:03:16', '2019-07-14 04:03:16'),
	(28, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:03:29', '2019-07-14 04:03:29'),
	(29, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:03:38', '2019-07-14 04:03:38'),
	(30, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:03:48', '2019-07-14 04:03:48'),
	(31, 1, 1, NULL, 1, 50000, 'Pemasukan', '2019-07-14 04:03:57', '2019-07-14 04:03:57'),
	(32, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:04:04', '2019-07-14 04:04:04'),
	(33, 1, 1, NULL, 1, 100000, 'Pemasukan', '2019-07-14 04:04:12', '2019-07-14 04:04:12'),
	(34, 1, 1, NULL, 1, 50000, 'Pemasukan', '2019-07-14 04:04:19', '2019-07-14 04:04:19'),
	(35, 1, NULL, 24, 27, 1535000, 'Pengeluaran', '2019-07-20 01:50:20', '2019-07-20 01:50:20'),
	(36, 1, NULL, 25, 29, NULL, 'Pengeluaran', '2019-07-20 01:50:41', '2019-07-20 01:50:41'),
	(37, 1, NULL, 26, 30, 1225000, 'Pengeluaran', '2019-07-20 01:51:57', '2019-07-20 01:51:57'),
	(38, 1, NULL, 27, 51, 380000, 'Pengeluaran', '2019-07-20 01:52:36', '2019-07-20 01:52:36'),
	(39, 1, NULL, 28, 33, 1700000, 'Pengeluaran', '2019-07-20 01:53:06', '2019-07-20 01:53:06'),
	(40, 1, NULL, 29, 33, 620000, 'Pengeluaran', '2019-07-20 01:53:29', '2019-07-20 01:53:29'),
	(41, 1, NULL, 30, 33, 150000, 'Pengeluaran', '2019-07-20 01:53:52', '2019-07-20 01:53:52'),
	(42, 1, NULL, 31, 33, 20000, 'Pengeluaran', '2019-07-20 01:54:09', '2019-07-20 01:54:09'),
	(43, 1, NULL, 32, 34, 1700000, 'Pengeluaran', '2019-07-20 01:54:34', '2019-07-20 01:54:34'),
	(44, 1, NULL, 33, 34, 1400000, 'Pengeluaran', '2019-07-20 01:54:58', '2019-07-20 01:54:58'),
	(45, 1, NULL, 34, 35, 1700000, 'Pengeluaran', '2019-07-20 01:55:21', '2019-07-20 01:55:21'),
	(46, 1, NULL, 35, 36, 1700000, 'Pengeluaran', '2019-07-20 01:55:49', '2019-07-20 01:55:49'),
	(47, 1, NULL, 36, 37, 1440000, 'Pengeluaran', '2019-07-20 01:56:09', '2019-07-20 01:56:09'),
	(48, 1, NULL, 37, 37, 30000, 'Pengeluaran', '2019-07-20 01:56:31', '2019-07-20 01:56:31'),
	(49, 1, NULL, 38, 37, 410000, 'Pengeluaran', '2019-07-20 01:57:02', '2019-07-20 01:57:02'),
	(50, 1, NULL, 39, 38, 1440000, 'Pengeluaran', '2019-07-20 01:57:22', '2019-07-20 01:57:22'),
	(51, 1, NULL, 40, 38, 2500000, 'Pengeluaran', '2019-07-20 01:57:41', '2019-07-20 01:57:41'),
	(52, 1, NULL, 41, 39, 1000000, 'Pengeluaran', '2019-07-20 01:58:12', '2019-07-20 01:58:12'),
	(53, 1, NULL, 42, 55, 295000, 'Pengeluaran', '2019-07-20 01:58:38', '2019-07-20 01:58:38'),
	(54, 1, NULL, 43, 55, 2000000, 'Pengeluaran', '2019-07-20 01:59:00', '2019-07-20 01:59:00'),
	(55, 1, NULL, 44, 42, 400000, 'Pengeluaran', '2019-07-20 01:59:27', '2019-07-20 01:59:27'),
	(56, 1, NULL, 45, 43, 115000, 'Pengeluaran', '2019-07-20 01:59:47', '2019-07-20 01:59:47'),
	(57, 1, NULL, 46, 44, 800000, 'Pengeluaran', '2019-07-20 02:00:14', '2019-07-20 02:00:14'),
	(58, 1, NULL, 47, 44, 150000, 'Pengeluaran', '2019-07-20 02:00:42', '2019-07-20 02:00:42'),
	(59, 1, NULL, 48, 45, 3450000, 'Pengeluaran', '2019-07-20 02:01:19', '2019-07-20 02:01:19'),
	(60, 1, NULL, 49, 45, 70000, 'Pengeluaran', '2019-07-20 02:01:52', '2019-07-20 02:01:52'),
	(61, 1, NULL, 50, 45, 85000, 'Pengeluaran', '2019-07-20 02:02:26', '2019-07-20 02:02:26'),
	(62, 1, NULL, 51, 45, 380000, 'Pengeluaran', '2019-07-20 02:02:53', '2019-07-20 02:02:53'),
	(63, 1, NULL, 52, 46, 1850000, 'Pengeluaran', '2019-07-20 02:04:14', '2019-07-20 02:04:14'),
	(64, 1, NULL, 53, 46, 1500000, 'Pengeluaran', '2019-07-20 02:04:41', '2019-07-20 02:04:41'),
	(65, 1, NULL, 54, 46, 1200000, 'Pengeluaran', '2019-07-20 02:05:09', '2019-07-20 02:05:09'),
	(66, 1, NULL, 55, 46, 30000, 'Pengeluaran', '2019-07-20 02:05:28', '2019-07-20 02:05:28'),
	(67, 1, NULL, 56, 46, 140000, 'Pengeluaran', '2019-07-20 02:05:54', '2019-07-20 02:05:54'),
	(68, 1, NULL, 57, 31, 1850000, 'Pengeluaran', '2019-07-20 02:07:36', '2019-07-20 02:07:36'),
	(69, 1, NULL, 58, 8, 1490000, 'Pengeluaran', '2019-07-20 02:08:38', '2019-07-20 02:08:38'),
	(70, 1, NULL, 59, 8, 1965000, 'Pengeluaran', '2019-07-20 02:09:20', '2019-07-20 02:09:20'),
	(71, 1, NULL, 60, 34, 34000, 'Pengeluaran', '2019-07-20 02:09:52', '2019-07-20 02:09:52'),
	(72, 1, NULL, 61, 48, 330000, 'Pengeluaran', '2019-07-20 02:13:48', '2019-07-20 02:13:48'),
	(73, 1, NULL, 62, 48, 75000, 'Pengeluaran', '2019-07-20 02:14:10', '2019-07-20 02:14:10'),
	(74, 1, NULL, 63, 48, 225000, 'Pengeluaran', '2019-07-20 02:14:49', '2019-07-20 02:14:49'),
	(75, 1, NULL, 64, 48, 80000, 'Pengeluaran', '2019-07-20 02:15:27', '2019-07-20 02:15:27'),
	(76, 1, NULL, 66, 71, 25000, 'Pengeluaran', '2020-01-18 04:16:53', '2020-01-18 04:16:53'),
	(77, 1, 38, NULL, 38, 50000, 'Pemasukan', '2020-01-18 04:20:56', '2020-01-18 04:20:56'),
	(78, 1, 1, NULL, 1, 50000, 'Pemasukan', '2020-01-18 04:22:16', '2020-01-18 04:22:16');
/*!40000 ALTER TABLE `budget_detail` ENABLE KEYS */;

-- membuang struktur untuk table ls.cicilan
CREATE TABLE IF NOT EXISTS `cicilan` (
  `id_cicilan` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `total_cicilan` int(20) DEFAULT '0',
  `total_bayar` int(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cicilan`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `FK_cicilan_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.cicilan: ~71 rows (lebih kurang)
/*!40000 ALTER TABLE `cicilan` DISABLE KEYS */;
INSERT INTO `cicilan` (`id_cicilan`, `id_customer`, `total_cicilan`, `total_bayar`, `created_at`, `updated_at`) VALUES
	(1, 1, 5250000, 1100000, '2019-07-14 03:39:56', '2020-01-18 04:22:16'),
	(2, 2, 1267500, 0, '2019-07-14 03:40:25', '2019-07-14 03:45:16'),
	(3, 3, 1125000, 0, '2019-07-14 03:40:53', '2019-07-14 03:45:54'),
	(4, 4, 1318750, 0, '2019-07-14 03:41:07', '2019-07-14 03:47:03'),
	(5, 5, 256250, 0, '2019-07-14 03:41:20', '2019-07-14 03:48:02'),
	(6, 6, 3718750, 0, '2019-07-14 03:41:38', '2019-07-14 03:49:22'),
	(7, 7, 2385000, 0, '2019-07-14 03:41:57', '2019-07-14 03:50:34'),
	(8, 8, 5185000, 0, '2019-07-14 03:42:14', '2019-07-20 02:09:20'),
	(9, 9, 0, 0, '2019-07-20 01:27:43', '2019-07-20 01:27:43'),
	(10, 10, 0, 0, '2019-07-20 01:28:09', '2019-07-20 01:28:09'),
	(11, 11, 0, 0, '2019-07-20 01:28:23', '2019-07-20 01:28:23'),
	(12, 12, 0, 0, '2019-07-20 01:28:44', '2019-07-20 01:28:44'),
	(13, 13, 0, 0, '2019-07-20 01:28:55', '2019-07-20 01:28:55'),
	(14, 14, 0, 0, '2019-07-20 01:29:15', '2019-07-20 01:29:15'),
	(15, 15, 0, 0, '2019-07-20 01:29:30', '2019-07-20 01:29:30'),
	(16, 16, 0, 0, '2019-07-20 01:29:50', '2019-07-20 01:29:50'),
	(17, 17, 0, 0, '2019-07-20 01:30:12', '2019-07-20 01:30:12'),
	(18, 18, 0, 0, '2019-07-20 08:40:49', '2019-07-20 08:40:50'),
	(19, 19, 0, 0, '2019-07-20 08:40:52', '2019-07-20 08:40:52'),
	(20, 20, 0, 0, NULL, NULL),
	(21, 21, 0, 0, NULL, NULL),
	(22, 22, 0, 0, NULL, NULL),
	(23, 23, 0, 0, NULL, NULL),
	(24, 24, 0, 0, NULL, NULL),
	(25, 25, 0, 0, NULL, NULL),
	(26, 26, 0, 0, NULL, NULL),
	(27, 27, 1918750, 0, NULL, '2019-07-20 01:50:20'),
	(28, 28, 0, 0, NULL, NULL),
	(29, 29, 0, 0, NULL, NULL),
	(30, 30, 1531250, 0, NULL, '2019-07-20 01:51:57'),
	(31, 31, 2312500, 0, NULL, '2019-07-20 02:07:36'),
	(32, 32, 0, 0, NULL, NULL),
	(33, 33, 3112500, 0, NULL, '2019-07-20 01:54:09'),
	(34, 34, 3917500, 0, NULL, '2019-07-20 02:09:52'),
	(35, 35, 2125000, 0, NULL, '2019-07-20 01:55:21'),
	(36, 36, 2125000, 0, NULL, '2019-07-20 01:55:49'),
	(37, 37, 2350000, 0, NULL, '2019-07-20 01:57:02'),
	(38, 38, 4925000, 50000, NULL, '2020-01-18 04:20:56'),
	(39, 39, 1250000, 0, NULL, '2019-07-20 01:58:12'),
	(40, 40, 0, 0, NULL, NULL),
	(41, 41, 0, 0, NULL, NULL),
	(42, 42, 500000, 0, NULL, '2019-07-20 01:59:27'),
	(43, 43, 143750, 0, NULL, '2019-07-20 01:59:46'),
	(44, 44, 1187500, 0, NULL, '2019-07-20 02:00:42'),
	(45, 45, 4981250, 0, NULL, '2019-07-20 02:02:53'),
	(46, 46, 5900000, 0, NULL, '2019-07-20 02:05:54'),
	(47, 47, 0, 0, NULL, NULL),
	(48, 48, 887500, 0, NULL, '2019-07-20 02:15:27'),
	(49, 49, 0, 0, NULL, NULL),
	(50, 50, 0, 0, NULL, NULL),
	(51, 51, 475000, 0, NULL, '2019-07-20 01:52:36'),
	(52, 52, 0, 0, NULL, NULL),
	(53, 53, 0, 0, NULL, NULL),
	(54, 54, 0, 0, NULL, NULL),
	(55, 55, 2868750, 0, NULL, '2019-07-20 01:59:00'),
	(56, 56, 0, 0, NULL, NULL),
	(57, 57, 0, 0, NULL, NULL),
	(58, 58, 0, 0, NULL, NULL),
	(59, 59, 0, 0, NULL, NULL),
	(60, 60, 0, 0, NULL, NULL),
	(61, 61, 0, 0, NULL, NULL),
	(62, 62, 0, 0, NULL, NULL),
	(63, 63, 0, 0, NULL, NULL),
	(64, 64, 0, 0, NULL, NULL),
	(65, 65, 0, 0, NULL, NULL),
	(66, 66, 0, 0, NULL, NULL),
	(67, 67, 0, 0, NULL, NULL),
	(68, 68, 0, 0, NULL, NULL),
	(69, 69, 0, 0, NULL, NULL),
	(70, 70, 0, 0, NULL, NULL),
	(71, 71, 31250, 0, '2020-01-18 04:15:46', '2020-01-18 04:16:53');
/*!40000 ALTER TABLE `cicilan` ENABLE KEYS */;

-- membuang struktur untuk table ls.cicilan_detail
CREATE TABLE IF NOT EXISTS `cicilan_detail` (
  `id_cicilan` int(11) NOT NULL AUTO_INCREMENT,
  `bayar` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `id_cicilan` (`id_cicilan`),
  CONSTRAINT `FK_cicilan_detail_cicilan` FOREIGN KEY (`id_cicilan`) REFERENCES `cicilan` (`id_cicilan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.cicilan_detail: ~13 rows (lebih kurang)
/*!40000 ALTER TABLE `cicilan_detail` DISABLE KEYS */;
INSERT INTO `cicilan_detail` (`id_cicilan`, `bayar`, `created_at`, `updated_at`) VALUES
	(1, 75000, '2019-07-14 04:02:36', '2019-07-14 04:02:36'),
	(1, 75000, '2019-07-14 04:03:00', '2019-07-14 04:03:00'),
	(1, 100000, '2019-07-14 04:03:08', '2019-07-14 04:03:08'),
	(1, 200000, '2019-07-14 04:03:16', '2019-07-14 04:03:16'),
	(1, 100000, '2019-07-14 04:03:29', '2019-07-14 04:03:29'),
	(1, 100000, '2019-07-14 04:03:38', '2019-07-14 04:03:38'),
	(1, 100000, '2019-07-14 04:03:48', '2019-07-14 04:03:48'),
	(1, 50000, '2019-07-14 04:03:56', '2019-07-14 04:03:56'),
	(1, 100000, '2019-07-14 04:04:04', '2019-07-14 04:04:04'),
	(1, 100000, '2019-07-14 04:04:12', '2019-07-14 04:04:12'),
	(1, 50000, '2019-07-14 04:04:19', '2019-07-14 04:04:19'),
	(38, 50000, '2020-01-18 04:20:55', '2020-01-18 04:20:55'),
	(1, 50000, '2020-01-18 04:22:16', '2020-01-18 04:22:16');
/*!40000 ALTER TABLE `cicilan_detail` ENABLE KEYS */;

-- membuang struktur untuk table ls.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `alamat` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.customer: ~68 rows (lebih kurang)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id_customer`, `nama`, `kontak`, `alamat`, `created_at`, `updated_at`) VALUES
	(1, 'M. Ulfa', '0', 'Ketapang', '2019-07-14 03:39:56', '2019-07-14 03:39:56'),
	(2, 'Ifa', '0', 'Kedung Pedaringan', '2019-07-14 03:40:25', '2019-07-14 03:40:25'),
	(3, 'M. Cus (Themoon)', '0', '0', '2019-07-14 03:40:53', '2019-07-14 03:40:53'),
	(4, 'Putri', '0', '0', '2019-07-14 03:41:07', '2019-07-14 03:41:07'),
	(5, 'Boned', '0', '0', '2019-07-14 03:41:20', '2019-07-14 03:41:20'),
	(6, 'Seniti B.S.T', '0', '0', '2019-07-14 03:41:37', '2019-07-14 03:41:37'),
	(7, 'Boned (Ndarem)', '0', '0', '2019-07-14 03:41:57', '2019-07-14 03:41:57'),
	(8, 'Rina', '0', '0', '2019-07-14 03:42:14', '2019-07-14 03:42:14'),
	(9, 'Atik', '0', '0', '2019-07-20 01:27:42', '2019-07-20 01:27:42'),
	(10, 'Noval', '0', '0', '2019-07-20 01:28:09', '2019-07-20 01:28:09'),
	(11, 'Mbak Har', '0', '0', '2019-07-20 01:28:23', '2019-07-20 01:28:23'),
	(12, 'Mbak Cus', '0', '0', '2019-07-20 01:28:44', '2019-07-20 01:28:44'),
	(13, 'Mbak Sugik', '0', '0', '2019-07-20 01:28:55', '2019-07-20 01:28:55'),
	(14, 'Mbak Cus Tiwan', '0', '0', '2019-07-20 01:29:14', '2019-07-20 01:29:14'),
	(15, 'Mbak Cus Sri', '0', '0', '2019-07-20 01:29:30', '2019-07-20 01:29:30'),
	(16, 'Mbak Cus Kedung', '0', '0', '2019-07-20 01:29:50', '2019-07-20 01:29:50'),
	(17, 'Kiptiya', '0', '0', '2019-07-20 01:30:12', '2019-07-20 01:30:12'),
	(18, 'Cus mbah', NULL, NULL, NULL, NULL),
	(19, 'Mbak Sri', NULL, NULL, NULL, NULL),
	(20, 'Yani', NULL, NULL, NULL, NULL),
	(21, 'Pocing', NULL, NULL, NULL, NULL),
	(22, 'Cus Devi', NULL, NULL, NULL, NULL),
	(23, 'Atul', NULL, NULL, NULL, NULL),
	(24, 'Endel', NULL, NULL, NULL, NULL),
	(25, 'Mbak Ida', NULL, NULL, NULL, NULL),
	(26, 'Mbak Ju', NULL, NULL, NULL, NULL),
	(27, 'Yu Mi', NULL, NULL, NULL, NULL),
	(28, 'Bude Yeni', NULL, NULL, NULL, NULL),
	(29, 'Sul Jaran', NULL, NULL, NULL, NULL),
	(30, 'Kristin Letto', NULL, NULL, NULL, NULL),
	(31, 'Dewi Darus', NULL, NULL, NULL, NULL),
	(32, 'Lia GJ', NULL, NULL, NULL, NULL),
	(33, 'Mbak IKa', NULL, NULL, NULL, NULL),
	(34, 'Ria', NULL, NULL, NULL, NULL),
	(35, 'Rina Cak Kri', NULL, NULL, NULL, NULL),
	(36, 'Mbak Umi', NULL, NULL, NULL, NULL),
	(37, 'Khodah', NULL, NULL, NULL, NULL),
	(38, 'Yuni A', NULL, NULL, NULL, NULL),
	(39, 'Mbak Sulis', NULL, NULL, NULL, NULL),
	(40, 'Mbak Putri Sempol', NULL, NULL, NULL, NULL),
	(41, 'Bu Tir', NULL, NULL, NULL, NULL),
	(42, 'Briska', NULL, NULL, NULL, NULL),
	(43, 'Sunarti B.S.T', NULL, NULL, NULL, NULL),
	(44, 'Mbak Ani', NULL, NULL, NULL, NULL),
	(45, 'Mbak Atus', NULL, NULL, NULL, NULL),
	(46, 'Mbak Bawon', NULL, NULL, NULL, NULL),
	(47, 'Rina 2', NULL, NULL, NULL, NULL),
	(48, 'Yuni', NULL, NULL, NULL, NULL),
	(49, 'Boned 2', NULL, NULL, NULL, NULL),
	(50, 'Mbak WInarti', NULL, NULL, NULL, NULL),
	(51, 'Mbak e Lia GJ', NULL, NULL, NULL, NULL),
	(52, 'Mbak Winarti 2\r\n', NULL, NULL, NULL, NULL),
	(53, 'Pak Jhon B.S.T', NULL, NULL, NULL, NULL),
	(54, 'Mbak Umi 2', NULL, NULL, NULL, NULL),
	(55, 'Sempol', NULL, NULL, NULL, NULL),
	(56, 'Nami', NULL, NULL, NULL, NULL),
	(57, 'Putri 2', NULL, NULL, NULL, NULL),
	(58, 'Luluk', NULL, NULL, NULL, NULL),
	(59, 'Linda', NULL, NULL, NULL, NULL),
	(60, 'Novi', NULL, NULL, NULL, NULL),
	(61, 'Silvi C', NULL, NULL, NULL, NULL),
	(62, 'Khusnul', NULL, NULL, NULL, NULL),
	(63, 'Karsinah', NULL, NULL, NULL, NULL),
	(64, 'Endah', NULL, NULL, NULL, NULL),
	(65, 'Sri Lu', NULL, NULL, NULL, NULL),
	(66, 'Fira', NULL, NULL, NULL, NULL),
	(67, 'Mbak Diah', NULL, NULL, NULL, NULL),
	(68, 'Inces', NULL, NULL, NULL, NULL),
	(69, 'Endel 2', NULL, NULL, NULL, NULL),
	(70, 'Rina', NULL, NULL, NULL, NULL),
	(71, 'Tes', '88544555', 'Gak', '2020-01-18 04:15:45', '2020-01-18 04:15:45');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- membuang struktur untuk table ls.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel ls.migrations: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table ls.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `cost` int(20) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `img` varchar(300) DEFAULT 'thumb.png',
  `tgl` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `FK_pembelian_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.pembelian: ~64 rows (lebih kurang)
/*!40000 ALTER TABLE `pembelian` DISABLE KEYS */;
INSERT INTO `pembelian` (`id_pembelian`, `id_customer`, `nama`, `cost`, `price`, `img`, `tgl`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Laptop Lenovo', 4200000, 5250000, 'thumb.png', '2019-05-09', '2019-07-14 03:43:06', '2019-07-14 03:43:06'),
	(2, 2, 'Blender Panasonic', 460000, 575000, 'thumb.png', '2019-03-21', '2019-07-14 03:44:13', '2019-07-14 03:44:13'),
	(3, 2, 'Mixer Panasonic', 500000, 625000, 'thumb.png', '2019-05-17', '2019-07-14 03:44:41', '2019-07-14 03:44:41'),
	(4, 2, 'Rok Sudut', 54000, 67500, 'thumb.png', '2019-05-31', '2019-07-14 03:45:16', '2019-07-14 03:45:16'),
	(5, 3, 'Jaket Kulit', 900000, 1125000, 'thumb.png', '2019-04-12', '2019-07-14 03:45:54', '2019-07-14 03:45:54'),
	(6, 4, 'Hambal Besar', 395000, 493750, 'thumb.png', '2019-05-21', '2019-07-14 03:46:24', '2019-07-14 03:46:24'),
	(7, 4, 'Hambal Besar', 395000, 493750, 'thumb.png', '2019-01-05', '2019-07-14 03:46:44', '2019-07-14 03:46:44'),
	(8, 4, 'Magic Com', 265000, 331250, 'thumb.png', '2019-02-05', '2019-07-14 03:47:03', '2019-07-14 03:47:03'),
	(9, 5, 'Sprei Bonita B.4', 110000, 137500, 'thumb.png', '2019-01-04', '2019-07-14 03:47:38', '2019-07-14 03:47:38'),
	(10, 5, 'Sprei Bonita B.2', 95000, 118750, 'thumb.png', '2019-05-05', '2019-07-14 03:48:02', '2019-07-14 03:48:02'),
	(11, 6, 'Cetakan Kue Pukis', 115000, 143750, 'thumb.png', '2019-02-04', '2019-07-14 03:48:41', '2019-07-14 03:48:41'),
	(12, 6, 'Cotton Bud', 10000, 12500, 'thumb.png', '2019-02-05', '2019-07-14 03:49:03', '2019-07-14 03:49:03'),
	(13, 6, 'Kulkas 2 pintu', 2850000, 3562500, 'thumb.png', '2019-01-06', '2019-07-14 03:49:22', '2019-07-14 03:49:22'),
	(14, 7, 'Vivo Y81', 1800000, 2250000, 'thumb.png', '2019-01-03', '2019-07-14 03:49:54', '2019-07-14 03:49:54'),
	(15, 7, 'MIe Sedap Goreng', 88000, 110000, 'thumb.png', '2019-02-04', '2019-07-14 03:50:19', '2019-07-14 03:50:19'),
	(16, 7, 'Mantel', 20000, 25000, 'thumb.png', '2019-01-03', '2019-07-14 03:50:34', '2019-07-14 03:50:34'),
	(17, 8, 'Rak Buku', 68000, 85000, 'thumb.png', '2019-02-02', '2019-07-14 03:50:59', '2019-07-14 03:50:59'),
	(18, 8, 'MInyak Freis Well 2 Dus', 245000, 306250, 'thumb.png', '2019-02-03', '2019-07-14 03:51:30', '2019-07-14 03:51:30'),
	(19, 8, 'Tongsis', 20000, 25000, 'thumb.png', '2019-02-03', '2019-07-14 03:52:03', '2019-07-14 03:52:03'),
	(20, 8, 'Mukena', 110000, 137500, 'thumb.png', '2019-02-05', '2019-07-14 03:52:22', '2019-07-14 03:52:22'),
	(21, 8, 'Sarung', 75000, 93750, 'thumb.png', '2019-02-04', '2019-07-14 03:53:00', '2019-07-14 03:53:00'),
	(22, 8, 'Sandal', 120000, 150000, 'thumb.png', '2019-03-05', '2019-07-14 03:53:26', '2019-07-14 03:53:26'),
	(23, 8, 'Sarung', 55000, 68750, 'thumb.png', '2019-03-05', '2019-07-14 03:54:04', '2019-07-14 03:54:04'),
	(24, 27, 'Gelang 3600 Gram', 1535000, 1918750, 'thumb.png', '2019-05-01', '2019-07-20 01:50:20', '2019-07-20 01:50:20'),
	(25, 29, 'Samsung J2 Prime', 1225000, 1531250, 'thumb.png', '2019-07-20', '2019-07-20 01:50:41', '2019-07-20 01:50:41'),
	(26, 30, 'Samsung J2 Prime', 1225000, 1531250, 'thumb.png', '2019-01-03', '2019-07-20 01:51:57', '2019-07-20 01:51:57'),
	(27, 51, 'Sprei Bonita 4', 380000, 475000, 'thumb.png', '2019-03-02', '2019-07-20 01:52:36', '2019-07-20 01:52:36'),
	(28, 33, 'Lemari Es Politro Sedang', 1700000, 2125000, 'thumb.png', '2019-02-02', '2019-07-20 01:53:06', '2019-07-20 01:53:06'),
	(29, 33, 'Naiba', 620000, 775000, 'thumb.png', '2019-02-04', '2019-07-20 01:53:29', '2019-07-20 01:53:29'),
	(30, 33, 'Mukena 2', 150000, 187500, 'thumb.png', '2019-02-02', '2019-07-20 01:53:52', '2019-07-20 01:53:52'),
	(31, 33, 'Sendok', 20000, 25000, 'thumb.png', '2019-01-01', '2019-07-20 01:54:08', '2019-07-20 01:54:08'),
	(32, 34, 'Lemari Es Politron Kecil', 1700000, 2125000, 'thumb.png', '2019-01-01', '2019-07-20 01:54:34', '2019-07-20 01:54:34'),
	(33, 34, 'Kasur Busa', 1400000, 1750000, 'thumb.png', '2019-02-01', '2019-07-20 01:54:57', '2019-07-20 01:54:57'),
	(34, 35, 'TV Polytron 24 Inch', 1700000, 2125000, 'thumb.png', '2019-02-01', '2019-07-20 01:55:21', '2019-07-20 01:55:21'),
	(35, 36, 'TV Polytron 24 Inch', 1700000, 2125000, 'thumb.png', '2019-02-01', '2019-07-20 01:55:49', '2019-07-20 01:55:49'),
	(36, 37, 'Samsung J4', 1440000, 1800000, 'thumb.png', '2019-02-01', '2019-07-20 01:56:09', '2019-07-20 01:56:09'),
	(37, 37, 'Silikon', 30000, 37500, 'thumb.png', '2019-02-01', '2019-07-20 01:56:31', '2019-07-20 01:56:31'),
	(38, 37, 'Hambal 2 x 20s', 410000, 512500, 'thumb.png', '2019-02-01', '2019-07-20 01:57:02', '2019-07-20 01:57:02'),
	(39, 38, 'Samsung J4', 1440000, 1800000, 'thumb.png', '2019-02-01', '2019-07-20 01:57:22', '2019-07-20 01:57:22'),
	(40, 38, 'Kursi Jepara', 2500000, 3125000, 'thumb.png', '2019-01-01', '2019-07-20 01:57:41', '2019-07-20 01:57:41'),
	(41, 39, 'Sepeda', 1000000, 1250000, 'thumb.png', '2019-01-01', '2019-07-20 01:58:12', '2019-07-20 01:58:12'),
	(42, 55, 'Panci Set', 295000, 368750, 'thumb.png', '2019-01-01', '2019-07-20 01:58:37', '2019-07-20 01:58:37'),
	(43, 55, 'Kostum', 2000000, 2500000, 'thumb.png', '2019-01-01', '2019-07-20 01:59:00', '2019-07-20 01:59:00'),
	(44, 42, 'Cincin 950', 400000, 500000, 'thumb.png', '2019-01-01', '2019-07-20 01:59:27', '2019-07-20 01:59:27'),
	(45, 43, 'Cetakan Kue', 115000, 143750, 'thumb.png', '2019-01-01', '2019-07-20 01:59:46', '2019-07-20 01:59:46'),
	(46, 44, 'DIpan', 800000, 1000000, 'thumb.png', '2019-01-01', '2019-07-20 02:00:14', '2019-07-20 02:00:14'),
	(47, 44, 'Bandang 2', 150000, 187500, 'thumb.png', '2019-01-01', '2019-07-20 02:00:42', '2019-07-20 02:00:42'),
	(48, 45, 'Oppo A3s 2', 3450000, 4312500, 'thumb.png', '2019-01-01', '2019-07-20 02:01:18', '2019-07-20 02:01:18'),
	(49, 45, 'Tempered Glass', 70000, 87500, 'thumb.png', '2019-01-01', '2019-07-20 02:01:52', '2019-07-20 02:01:52'),
	(50, 45, 'Regulator', 85000, 106250, 'thumb.png', '2019-01-01', '2019-07-20 02:02:26', '2019-07-20 02:02:26'),
	(51, 45, 'Hambal', 380000, 475000, 'thumb.png', '2019-01-01', '2019-07-20 02:02:53', '2019-07-20 02:02:53'),
	(52, 46, 'Kulkas Sharp', 1850000, 2312500, 'thumb.png', '2019-01-01', '2019-07-20 02:04:14', '2019-07-20 02:04:14'),
	(53, 46, 'Mesin Cuci Sharp', 1500000, 1875000, 'thumb.png', '2019-01-01', '2019-07-20 02:04:41', '2019-07-20 02:04:41'),
	(54, 46, 'Samsung J2 Prime', 1200000, 1500000, 'thumb.png', '2019-01-01', '2019-07-20 02:05:09', '2019-07-20 02:05:09'),
	(55, 46, 'Tempered Glass', 30000, 37500, 'thumb.png', '2019-01-01', '2019-07-20 02:05:28', '2019-07-20 02:05:28'),
	(56, 46, 'Power Bank Veger', 140000, 175000, 'thumb.png', '2019-01-01', '2019-07-20 02:05:54', '2019-07-20 02:05:54'),
	(57, 31, 'Etalase', 1850000, 2312500, 'thumb.png', '2019-01-01', '2019-07-20 02:07:36', '2019-07-20 02:07:36'),
	(58, 8, 'Cincin', 1490000, 1862500, 'thumb.png', '2019-01-01', '2019-07-20 02:08:37', '2019-07-20 02:08:37'),
	(59, 8, 'Gelang', 1965000, 2456250, 'thumb.png', '2019-01-01', '2019-07-20 02:09:20', '2019-07-20 02:09:20'),
	(60, 34, 'Rak Tas', 34000, 42500, 'thumb.png', '2019-01-01', '2019-07-20 02:09:52', '2019-07-20 02:09:52'),
	(61, 48, 'Wallpaper', 330000, 412500, 'thumb.png', '2019-01-01', '2019-07-20 02:13:48', '2019-07-20 02:13:48'),
	(62, 48, 'Bantal', 75000, 93750, 'thumb.png', '2019-01-01', '2019-07-20 02:14:10', '2019-07-20 02:14:10'),
	(63, 48, 'Mangkok', 225000, 281250, 'thumb.png', '2019-01-01', '2019-07-20 02:14:48', '2019-07-20 02:14:48'),
	(64, 48, 'Sandal', 80000, 100000, 'thumb.png', '2019-01-01', '2019-07-20 02:15:27', '2019-07-20 02:15:27'),
	(65, 48, 'Taplak Kulkas', 27000, 33750, 'thumb.png', '2019-01-01', '2019-07-20 02:17:18', '2019-07-20 02:17:18'),
	(66, 71, 'Buku', 25000, 31250, 'thumb.png', '2020-01-16', '2020-01-18 04:16:53', '2020-01-18 04:16:53');
/*!40000 ALTER TABLE `pembelian` ENABLE KEYS */;

-- membuang struktur untuk table ls.pembelian_detail
CREATE TABLE IF NOT EXISTS `pembelian_detail` (
  `id_pembelian` int(11) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img` varchar(250) DEFAULT 'thumb.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `id_pembelian` (`id_pembelian`),
  CONSTRAINT `FK_pembelian_detail_pembelian` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.pembelian_detail: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `pembelian_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembelian_detail` ENABLE KEYS */;

-- membuang struktur untuk table ls.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel ls.role: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- membuang struktur untuk table ls.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel ls.users: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
