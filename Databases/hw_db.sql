-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 09:18 PM
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
-- Database: `hw_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hw_allocation`
--

CREATE TABLE `hw_allocation` (
  `allotment_id` int(4) NOT NULL,
  `hw_id` int(8) NOT NULL,
  `student_id` varchar(9) NOT NULL,
  `hw_date` varchar(10) NOT NULL,
  `hw_status` varchar(1) NOT NULL,
  `hw_note` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hw_p`
--

CREATE TABLE `hw_p` (
  `hw_id` int(8) NOT NULL,
  `hw_name` varchar(32) NOT NULL,
  `hw_desc` int(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hw_allocation`
--
ALTER TABLE `hw_allocation`
  ADD PRIMARY KEY (`allotment_id`),
  ADD KEY `hw_id_fk` (`hw_id`);

--
-- Indexes for table `hw_p`
--
ALTER TABLE `hw_p`
  ADD PRIMARY KEY (`hw_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hw_allocation`
--
ALTER TABLE `hw_allocation`
  ADD CONSTRAINT `hw_id_fk` FOREIGN KEY (`hw_id`) REFERENCES `hw_p` (`hw_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
