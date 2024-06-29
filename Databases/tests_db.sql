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
-- Database: `tests_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `phy_tests`
--

CREATE TABLE `phy_tests` (
  `t_id` int(8) NOT NULL,
  `t_name` varchar(32) NOT NULL,
  `t_desc` varchar(96) NOT NULL,
  `ques_link` varchar(96) NOT NULL,
  `max_marks` int(3) NOT NULL,
  `num_of_ques` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='t_id is the unique id of a test, test is abbreviated as t';

--
-- Dumping data for table `phy_tests`
--

INSERT INTO `phy_tests` (`t_id`, `t_name`, `t_desc`, `ques_link`, `max_marks`, `num_of_ques`) VALUES
(1, 'light test', 'test on all light modules', 'https://navlakhi.studio/data/video/2024/video2.html', 80, 10);

-- --------------------------------------------------------

--
-- Table structure for table `phy_test_allocation`
--

CREATE TABLE `phy_test_allocation` (
  `allotment_id` int(4) NOT NULL,
  `student_id` varchar(9) NOT NULL,
  `t_id` int(11) NOT NULL,
  `t_date` varchar(10) NOT NULL,
  `marks_scored` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='student & t_id are foreign, attempt id to be passed ahead ';

--
-- Dumping data for table `phy_test_allocation`
--

INSERT INTO `phy_test_allocation` (`allotment_id`, `student_id`, `t_id`, `t_date`, `marks_scored`) VALUES
(1, 'C230232', 1, '28/06/2024', 78);

-- --------------------------------------------------------

--
-- Table structure for table `phy_test_attempt_details`
--

CREATE TABLE `phy_test_attempt_details` (
  `ques_num` varchar(6) NOT NULL,
  `allotment_id` int(4) NOT NULL,
  `attempt_status` varchar(2) NOT NULL,
  `ques_type` varchar(2) NOT NULL,
  `ques_max_marks` int(2) NOT NULL,
  `ques_marks_scored` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='attempt details for questions of tests';

--
-- Dumping data for table `phy_test_attempt_details`
--

INSERT INTO `phy_test_attempt_details` (`ques_num`, `allotment_id`, `attempt_status`, `ques_type`, `ques_max_marks`, `ques_marks_scored`) VALUES
('1A', 1, 'A', 'A', 8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `test_ques_type_list`
--

CREATE TABLE `test_ques_type_list` (
  `ques_type` varchar(2) NOT NULL,
  `type_desc` varchar(32) NOT NULL,
  `type_status` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='added for scalability';

--
-- Dumping data for table `test_ques_type_list`
--

INSERT INTO `test_ques_type_list` (`ques_type`, `type_desc`, `type_status`) VALUES
('A', 'Application Based Questions (ABQ', ''),
('M', 'Multiple Choice Questions (MCQ)', ''),
('T', 'Theory Based Questions (TBQ)', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phy_tests`
--
ALTER TABLE `phy_tests`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `phy_test_allocation`
--
ALTER TABLE `phy_test_allocation`
  ADD PRIMARY KEY (`allotment_id`),
  ADD KEY `t_id_fk` (`t_id`);

--
-- Indexes for table `phy_test_attempt_details`
--
ALTER TABLE `phy_test_attempt_details`
  ADD PRIMARY KEY (`ques_num`),
  ADD KEY `attempt_id_fk` (`allotment_id`),
  ADD KEY `ques_type_fk` (`ques_type`);

--
-- Indexes for table `test_ques_type_list`
--
ALTER TABLE `test_ques_type_list`
  ADD PRIMARY KEY (`ques_type`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phy_test_allocation`
--
ALTER TABLE `phy_test_allocation`
  ADD CONSTRAINT `t_id_fk` FOREIGN KEY (`t_id`) REFERENCES `phy_tests` (`t_id`);

--
-- Constraints for table `phy_test_attempt_details`
--
ALTER TABLE `phy_test_attempt_details`
  ADD CONSTRAINT `attempt_id_fk` FOREIGN KEY (`allotment_id`) REFERENCES `phy_test_allocation` (`allotment_id`),
  ADD CONSTRAINT `ques_type_fk` FOREIGN KEY (`ques_type`) REFERENCES `test_ques_type_list` (`ques_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
