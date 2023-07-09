-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2023 at 02:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stores`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumers`
--

CREATE TABLE `consumers` (
  `consumer_id` int(11) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `consumer_mobile` varchar(20) NOT NULL,
  `consumer_address` varchar(255) DEFAULT NULL,
  `buying_from_store` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumers`
--

INSERT INTO `consumers` (`consumer_id`, `consumer_name`, `consumer_mobile`, `consumer_address`, `buying_from_store`) VALUES
(1, 'Consumer 1', '1234567890', '123 Main St', 1),
(2, 'Consumer 2', '2345678901', '456 Elm St', 2),
(3, 'Consumer 3', '3456789012', '789 Oak St', 3),
(4, 'Consumer 4', '4567890123', '321 Pine St', 4),
(5, 'Consumer 5', '5678901234', '654 Maple St', 5),
(6, 'Consumer 6', '6789012345', '789 Oak St', 3),
(7, 'Consumer 7', '7890123456', '654 Maple St', 5),
(8, 'Consumer 8', '8901234567', '321 Pine St', 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_type` enum('owner','worker') NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_address` varchar(255) DEFAULT NULL,
  `employee_mobile` varchar(20) NOT NULL,
  `employee_gender` enum('male','female') DEFAULT NULL,
  `employee_age` int(10) DEFAULT NULL,
  `employee_status` enum('active','inactive') DEFAULT 'active',
  `working_in_store` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_type`, `employee_name`, `employee_address`, `employee_mobile`, `employee_gender`, `employee_age`, `employee_status`, `working_in_store`) VALUES
(1, 'owner', 'John Smith', '123 Main St', '9876543210', 'male', 30, 'active', 1),
(2, 'worker', 'Jane Doe', '456 Elm St', '9876543211', 'female', 25, 'active', 2),
(3, 'worker', 'John Doe', '123 Elm St', '9876543210', 'male', 30, 'inactive', 1),
(4, 'worker', 'Emily Williams', '789 Oak St', '9876543213', 'female', 28, 'active', 3),
(5, 'owner', 'Robert Davis', '321 Pine St', '9876543214', 'male', 40, 'active', 4),
(6, 'worker', 'Sarah Thompson', '654 Maple St', '9876543215', 'female', 22, 'active', 5),
(7, 'worker', 'David Brown', '654 Maple St', '9876543216', 'male', 27, 'inactive', 5);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_address` varchar(255) NOT NULL,
  `Open_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `store_address`, `Open_date`) VALUES
(1, 'Store 1', '123 Main St', '2023-01-01'),
(2, 'Store 2', '456 Elm St', '2023-02-15'),
(3, 'Store 3', '789 Oak St', '2022-03-25'),
(4, 'Store 4', '321 Pine St', '2023-04-20'),
(5, 'Store 5', '654 Maple St', '2023-05-05'),
(6, 'Store 6', '654 Maple St', '2023-07-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumers`
--
ALTER TABLE `consumers`
  ADD PRIMARY KEY (`consumer_id`),
  ADD KEY `fk_buying_from_store` (`buying_from_store`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `working_in_store` (`working_in_store`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumers`
--
ALTER TABLE `consumers`
  MODIFY `consumer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consumers`
--
ALTER TABLE `consumers`
  ADD CONSTRAINT `consumers_ibfk_1` FOREIGN KEY (`buying_from_store`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `fk_buying_from_store` FOREIGN KEY (`buying_from_store`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`working_in_store`) REFERENCES `store` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
