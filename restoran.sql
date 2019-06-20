-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2019 at 11:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `detail_id` int(11) NOT NULL,
  `transaksi_id` varchar(15) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`detail_id`, `transaksi_id`, `produk_id`, `jumlah`) VALUES
(136, '03061935-529', 1, 2),
(137, '03061935-529', 6, 2),
(139, '03061935-529', 4, 3),
(140, '03061958-770', 6, 1),
(141, '03061958-770', 4, 1),
(142, '03061958-770', 1, 1),
(151, '03061918-315', 3, 1),
(152, '03061918-315', 6, 2),
(153, '03061918-315', 4, 1),
(155, '03061935-529', 5, 2),
(156, '0406191-401', 3, 2),
(157, '0406191-401', 1, 2),
(158, '0406191-401', 6, 2),
(159, '0406191-401', 5, 2),
(160, '03061918-315', 1, 12),
(161, '04061938-084', 1, 2),
(162, '04061938-084', 2, 1),
(163, '04061938-084', 3, 1),
(164, '04061938-084', 4, 1),
(167, '0406197-599', 6, 1),
(168, '0406191-401', 4, 1),
(169, '0406191-401', 2, 1),
(170, '04061950-077', 1, 1),
(171, '04061950-077', 2, 1),
(172, '0406197-599', 1, 1),
(173, '0406197-599', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `kasir_id` varchar(25) NOT NULL,
  `kasir_nama` varchar(50) NOT NULL,
  `kasir_pin` text NOT NULL,
  `status` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`kasir_id`, `kasir_nama`, `kasir_pin`, `status`) VALUES
('Admin', 'Administrator', 'e10adc3949ba59abbe56e057f20f883e', 'admin'),
('defuj', 'dede fuji abdul', 'c362c2abf0e4d1ed469ecb67b551cabd', 'user'),
('user', 'DEFAULT USER', 'e10adc3949ba59abbe56e057f20f883e', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Foods'),
(2, 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `produk_nama` varchar(50) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `produk_harga` float NOT NULL,
  `produk_diskon` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `kategori_id`, `produk_harga`, `produk_diskon`) VALUES
(1, 'Green Tea', 2, 8000, 0),
(2, 'Ayam Geprek', 1, 16000, 10),
(3, 'Ayam Bakar', 1, 35000, 15),
(4, 'Nasi Goreng Manis', 1, 15000, 40),
(5, 'Nasi Goreng Pedas', 1, 16000, 0),
(6, 'Es Teh Manis', 2, 2500, 0),
(7, 'Jus Alpukat', 2, 10000, 0),
(8, 'Jus Lemon', 2, 8000, 0),
(9, 'Es Kelapa Muda', 2, 15000, 0),
(10, 'Jus Jeruk', 2, 8000, 0),
(11, 'Bajigur', 2, 4000, 0),
(12, 'Susu Coklat', 2, 8000, 0),
(13, 'Susu Vanila', 2, 8000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` varchar(15) NOT NULL,
  `transaksi_waktu` datetime NOT NULL,
  `kasir_id` varchar(25) NOT NULL,
  `transaksi_bayar` float NOT NULL DEFAULT '0',
  `transaksi_cash` float NOT NULL DEFAULT '0',
  `transaksi_kembali` float NOT NULL DEFAULT '0',
  `AN` varchar(50) NOT NULL,
  `transaksi_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_waktu`, `kasir_id`, `transaksi_bayar`, `transaksi_cash`, `transaksi_kembali`, `AN`, `transaksi_status`) VALUES
('03061918-315', '2019-06-03 17:18:49', 'defuj', 139750, 150000, 10250, 'Ilham', 0),
('03061935-529', '2019-06-03 16:35:27', 'defuj', 80000, 100000, 20000, 'Moh Ihsan', 1),
('03061958-770', '2019-06-03 16:58:51', 'defuj', 19500, 20000, 500, 'Sri', 0),
('0406191-401', '2019-06-04 12:01:22', 'defuj', 135900, 200000, 64100, 'Saepul', 1),
('04061938-084', '2019-06-04 12:38:58', 'defuj', 69150, 70000, 850, 'saroji', 1),
('04061950-077', '2019-06-04 13:50:51', 'defuj', 22400, 50000, 27600, 'yakuza', 0),
('0406197-599', '2019-06-04 13:07:01', 'defuj', 2500, 3000, 500, 'Markonah', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`kasir_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `kasir_id` (`kasir_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kasir_id`) REFERENCES `kasir` (`kasir_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
