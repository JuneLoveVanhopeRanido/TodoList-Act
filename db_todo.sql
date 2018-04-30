-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2018 at 07:39 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_todo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `status_id` int(255) NOT NULL,
  `status_name` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`status_id`, `status_name`, `created_at`, `update_at`) VALUES
(1, 'On going', '2018-04-25 04:48:21', '2018-04-25 04:48:21'),
(2, 'Completed', '2018-04-25 04:48:21', '2018-04-25 04:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tasks`
--

CREATE TABLE `tbl_tasks` (
  `task_id` int(255) NOT NULL,
  `task_name` varchar(30) NOT NULL,
  `task_description` text NOT NULL,
  `task_status` int(255) NOT NULL DEFAULT '1',
  `task_completed` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tasks`
--

INSERT INTO `tbl_tasks` (`task_id`, `task_name`, `task_description`, `task_status`, `task_completed`, `created_at`, `updated_at`) VALUES
(90, 'papa', '', 2, '2018-04-27 12:33:59', '2018-04-27 08:33:11', '2018-04-27 12:33:59'),
(91, 'june', '', 2, '2018-04-27 09:58:11', '2018-04-27 08:34:21', '2018-04-27 09:58:11'),
(92, 'love', '', 2, '2018-04-30 06:11:40', '2018-04-27 08:35:07', '2018-04-30 06:11:40'),
(93, 'june', '', 2, '2018-04-27 09:58:17', '2018-04-27 08:35:25', '2018-04-27 09:58:17'),
(94, 'mama', 'papa', 1, '0000-00-00 00:00:00', '2018-04-27 10:51:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_task`
-- (See below for the actual view)
--
CREATE TABLE `view_task` (
`task_id` int(255)
,`task_name` varchar(30)
,`status_name` varchar(10)
,`task_completed` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `view_task`
--
DROP TABLE IF EXISTS `view_task`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_task`  AS  select `tbl_tasks`.`task_id` AS `task_id`,`tbl_tasks`.`task_name` AS `task_name`,`tbl_status`.`status_name` AS `status_name`,`tbl_tasks`.`task_completed` AS `task_completed` from (`tbl_status` join `tbl_tasks`) where (`tbl_tasks`.`task_status` = `tbl_status`.`status_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_status` (`task_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `status_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  MODIFY `task_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  ADD CONSTRAINT `tbl_tasks_ibfk_1` FOREIGN KEY (`task_status`) REFERENCES `tbl_status` (`status_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
