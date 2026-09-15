-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2026 at 10:12 PM
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
-- Database: `hospital_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Confirmed','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `appointment_date`, `appointment_time`, `reason`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(21, 52, 19, '2026-08-28', '10:00:00', 'Sensitivity', 'Completed', NULL, '2026-08-28 22:54:30', '2026-08-29 00:16:28'),
(22, 53, 39, '2026-08-29', '00:00:00', 'Knee pain', 'Pending', NULL, '2026-08-28 23:35:28', '2026-08-28 23:35:28'),
(23, 54, 25, '2026-08-31', '14:00:00', 'Chest pain, shortness of breath', 'Completed', NULL, '2026-08-28 23:52:21', '2026-08-29 00:14:47'),
(25, 56, 27, '2026-08-31', '14:00:00', 'Oil skin', 'Pending', NULL, '2026-08-29 00:03:16', '2026-08-29 00:03:16'),
(26, 57, 19, '2026-08-31', '10:00:00', 'Teeth pain', 'Pending', NULL, '2026-08-29 00:09:29', '2026-08-29 00:09:29'),
(27, 58, 32, '2026-09-03', '10:00:00', 'Sensitivity', 'Pending', NULL, '2026-08-29 00:19:09', '2026-08-29 00:19:09'),
(28, 59, 37, '2026-08-31', '22:00:00', 'Fever, cough, weakness', 'Pending', NULL, '2026-08-29 00:24:53', '2026-08-29 00:24:53'),
(29, 60, 25, '2026-08-31', '00:00:00', 'Palpitations, fatigue', 'Completed', NULL, '2026-08-29 00:28:54', '2026-08-29 00:41:31'),
(30, 61, 32, '2026-09-10', '10:00:00', 'Sensitivity', 'Pending', NULL, '2026-08-29 00:31:59', '2026-08-29 00:31:59'),
(31, 62, 29, '2026-09-30', '12:00:00', 'Stomach pain, nausea', 'Pending', NULL, '2026-08-29 00:37:02', '2026-08-29 00:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `specialization` varchar(100) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `email`, `phone`, `specialization`, `qualification`, `gender`, `profile_image`, `status`, `created_at`, `updated_at`) VALUES
(17, 'Dr. Sara Aliii', 'saraa@gmail.com', '03111234567', 'Cardiologist', 'MBBS, FCPS', 'Female', NULL, 'Inactive', '2026-08-19 01:48:06', '2026-08-26 20:57:48'),
(18, 'Dr. Usman Malik', 'usman@gmail.com', '03221234567', 'Neurologist', 'MBBS, MD', 'Male', NULL, 'Inactive', '2026-08-19 01:48:06', '2026-08-26 20:57:48'),
(19, 'Dr. Ayesha Noor', 'ayesha@gmail.com', '03331234567', 'Dentist', 'BDS, FCPS', 'Female', NULL, 'Inactive', '2026-08-19 01:48:06', '2026-08-26 20:57:48'),
(20, 'Dr. Hamza Ahmed', 'hamza@gmail.com', '03441234567', 'General Physician', 'MBBS', 'Male', NULL, 'Inactive', '2026-08-19 01:48:06', '2026-08-26 20:57:48'),
(21, 'Dr.Mahnoor', 'mahnoor123@gmail.com', '0345-5567890', 'Neurologist', 'MBBS', 'Female', '1787133408.png', 'Inactive', '2026-08-19 14:56:48', '2026-08-26 20:57:48'),
(25, 'Dr. Ahmed Hassan', 'ahmed.hassan@hospital.com', '03001230001', 'Cardiologist', 'MBBS, FCPS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(26, 'Dr. Sara Ahmed', 'sara.ahmed@hospital.com', '03111230002', 'Neurologist', 'MBBS, MD', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(27, 'Dr. Bilal Shah', 'bilal.shah@hospital.com', '03221230003', 'Dermatologist', 'MBBS, FCPS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(28, 'Dr. Ayesha Khan', 'ayesha.khan@hospital.com', '03331230004', 'Gynecologist', 'MBBS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(29, 'Dr. Hamza Ali', 'hamza.ali@hospital.com', '03441230005', 'General Physician', 'MBBS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(30, 'Dr. Hina Raza', 'hina.raza@hospital.com', '03051230006', 'Pediatrician', 'MBBS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(31, 'Dr. Usman Malik', 'usman.malik@hospital.com', '03161230007', 'Orthopedic Surgeon', 'MBBS, MS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(32, 'Dr. Maham Noor', 'maham.noor@hospital.com', '03271230008', 'Dentist', 'BDS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(33, 'Dr. Hassan Tariq', 'hassan.tariq@hospital.com', '03381230009', 'ENT Specialist', 'MBBS, FCPS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(34, 'Dr. Fatima Iqbal', 'fatima.iqbal@hospital.com', '03491230010', 'Dermatologist', 'MBBS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(35, 'Dr. Zain Ali', 'zain.ali@hospital.com', '03011230011', 'Cardiologist', 'MBBS, MD', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(36, 'Dr. Maryam Khan', 'maryam.khan@hospital.com', '03121230012', 'Neurologist', 'MBBS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(37, 'Dr. Danish Ahmed', 'danish.ahmed@hospital.com', '03231230013', 'General Physician', 'MBBS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(38, 'Dr. Sana Yousaf', 'sana.yousaf@hospital.com', '03341230014', 'Gynecologist', 'MBBS, FCPS', 'Female', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48'),
(39, 'Dr. Ali Raza', 'ali.raza@hospital.com', '03451230015', 'Orthopedic Surgeon', 'MBBS, MS', 'Male', NULL, 'Active', '2026-08-26 20:56:11', '2026-08-26 20:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `prescription` text DEFAULT NULL,
  `record_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`id`, `patient_id`, `doctor_id`, `appointment_id`, `diagnosis`, `symptoms`, `prescription`, `record_date`, `notes`, `created_at`, `updated_at`) VALUES
(11, 52, 28, NULL, 'Dental Caries', 'Toothache, sensitivity', 'Desensitizing toothpaste', '2026-08-22', NULL, '2026-08-28 23:17:29', '2026-08-29 00:39:16'),
(12, 53, 39, NULL, 'Knee Arthritis', 'Knee pain, swelling', 'Rest, physiotherapy and orthopedic follow-up', '2026-08-22', NULL, '2026-08-28 23:41:14', '2026-08-29 00:39:24'),
(13, 54, 25, NULL, 'Hypertension', 'Chest pain, shortness of breath', 'BP monitoring, low-salt diet', '2026-08-22', NULL, '2026-08-28 23:54:47', '2026-08-29 00:39:34'),
(15, 56, 27, NULL, 'Acne Vulgaris', 'Oily skin', 'Topical acne treatment', '2026-08-22', NULL, '2026-08-29 00:06:02', '2026-08-29 00:38:48'),
(16, 57, 19, NULL, 'Dental Caries', 'Toothache, sensitivity', 'Dental filling recommended', '2026-08-22', NULL, '2026-08-29 00:20:50', '2026-08-29 00:39:04'),
(17, 58, 32, NULL, 'Dental Caries', 'Sensitivity', 'Dental filling recommended', '2026-08-22', NULL, '2026-08-29 00:21:46', '2026-08-29 00:39:46'),
(18, 59, 37, NULL, 'Viral Infection', 'Fever, cough, weakness', 'Rest, fluids and symptomatic treatment', '2026-08-22', NULL, '2026-08-29 00:25:44', '2026-08-29 00:40:05'),
(19, 60, 25, NULL, 'Arrhythmia', 'Palpitations, fatigue', 'ECG and cardiology follow-up', '2026-08-22', NULL, '2026-08-29 00:29:48', '2026-08-29 00:40:15'),
(20, 61, 32, NULL, 'Dental Caries', 'Sensitivity', 'Dental filling recommended', '2026-08-22', NULL, '2026-08-29 00:33:17', '2026-08-29 00:40:26'),
(21, 62, 29, NULL, 'Gastritis', 'Stomach pain, nausea', 'Dietary advice and medical treatment', '2026-08-22', NULL, '2026-08-29 00:38:27', '2026-08-29 00:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `email`, `phone`, `gender`, `date_of_birth`, `blood_group`, `address`, `status`, `created_at`, `updated_at`) VALUES
(52, 'Fatima', 'fatima@gmail.com', '0345-5567890', 'Female', '2003-03-12', 'B+', 'Sialkot', 1, '2026-08-28 22:54:30', '2026-08-28 22:54:30'),
(53, 'Zahra', 'zahra@gmail.com', '0345-5567890', 'Female', '2001-08-29', 'A+', 'Kamoki', 1, '2026-08-28 23:35:28', '2026-08-28 23:35:28'),
(54, 'Haleema', 'haleema@gmail.com', '0345-556789', 'Female', '2003-02-22', 'B+', 'Lahore', 1, '2026-08-28 23:52:21', '2026-08-28 23:52:21'),
(56, 'Hassan', 'hassan@gmail.com', '0345-556789', 'Male', '1999-12-11', 'O+', 'Lahore', 1, '2026-08-29 00:03:16', '2026-08-29 00:03:16'),
(57, 'Azka', 'azka@gmail.com', '0300-8907654', 'Female', '1998-02-02', 'A+', 'Islamabad', 1, '2026-08-29 00:09:29', '2026-08-29 00:09:29'),
(58, 'Haniya', 'haniya@gmail.com', '0300-8907654', 'Female', '2001-11-01', 'AB+', 'Karachi', 1, '2026-08-29 00:19:09', '2026-08-29 00:19:09'),
(59, 'Waniya', 'waniya@gmail.com', '0345-6567890', 'Female', '2002-02-22', 'B+', 'Karachi', 1, '2026-08-29 00:24:53', '2026-08-29 00:24:53'),
(60, 'Ajwa', 'ajwa@gmail.com', '0300-8907654', 'Female', '2002-11-12', 'B+', 'Karachi', 1, '2026-08-29 00:28:54', '2026-08-29 00:28:54'),
(61, 'Ahmed', 'ahmed@gmail.com', '0340-5567890', 'Male', '2000-02-22', 'B+', 'Pindi', 1, '2026-08-29 00:31:59', '2026-08-29 00:31:59'),
(62, 'Moiz', 'moiz@gmail.com', '0345-5567890', 'Male', '2003-02-22', 'O+', 'Sialkot', 1, '2026-08-29 00:37:02', '2026-08-29 00:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','doctor','user') NOT NULL DEFAULT 'user',
  `profile_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `profile_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sabra Noor', 'sabranoor@gmail.com', '$2y$10$rhE06Qth1nzxwUJmZyuFAuYiOzMaWwdatBaSKSxHQAuL9/a1p1hFi', 'user', 'admin_1_1787491035.jpeg', 1, '2026-08-21 00:32:07', '2026-08-23 18:17:15'),
(2, 'Waleed', 'waleed@gmail.com', '$2y$10$ffrJn7EyTtK9aqhYcR0YF.gnmIcLzvctP8ji.o.f7oFR0lvkW80m.', 'user', 'admin_2_1787491786.png', 1, '2026-08-21 00:34:46', '2026-08-23 18:29:46'),
(4, 'Sabra', 'sabra@gmail.com', '$2y$10$vTYE.C.58LVOg40v2OG7o.i1aHqYhov3l2PLxqhGvg1GnUUqQnGuq', 'user', NULL, 1, '2026-08-21 00:39:26', '2026-08-21 00:39:26'),
(17, 'Admin', 'admin@gmail.com', '$2y$10$c/hI5aPrjjk/qBaCpjzBIuUo5ApAkuDetAU2.Xo5dqB4G476LrW.i', 'admin', NULL, 1, '2026-08-22 23:42:55', '2026-08-22 23:43:07'),
(18, 'Noor', 'noor@gamil.com', '$2y$10$SSrF9efTpSpO7PfgNTUCP.EVULdlkiuOOoru3hev6xke.1JNefc36', 'user', NULL, 1, '2026-08-23 16:18:45', '2026-08-23 16:18:45'),
(19, 'user', 'user@gmail.com', '$2y$10$x7A/jaTpho8cLYWoizv9deUe4F0xRj6TAY/Aa7vrNniZ/WJcn2YKS', 'user', NULL, 1, '2026-08-26 21:02:52', '2026-08-26 21:02:52'),
(20, 'Fatima', 'fatima@gmail.com', '$2y$10$FyqjxJxjlLftyefOJa5tWOpxU/nhdkFP5UmRGZc95Qkd4gjP8GWB6', 'user', NULL, 1, '2026-08-28 22:50:28', '2026-08-28 22:50:28'),
(21, 'Zahra', 'zahra@gmail.com', '$2y$10$HeZl1IWHRT3SxuHt9sEoT.5PXKBdsVPjoeaPozmTW2LlrnOPcY0mm', 'user', NULL, 1, '2026-08-28 23:33:26', '2026-08-28 23:33:26'),
(22, 'Haleema', 'haleema@gmail.com', '$2y$10$VuZ2KXHVmliWNRXDmx8QDuM0rUv/GoK9ZDPOky0/vhSUFzKAPgpEe', 'user', NULL, 1, '2026-08-28 23:49:50', '2026-08-28 23:49:50'),
(23, 'Hassan', 'hassan@gmail.com', '$2y$10$sDUj/nDEoyfT2czi6s8KVu5NqAkGIN.fPdNsGnXvgFGunh.wyLzKC', 'user', NULL, 1, '2026-08-29 00:02:02', '2026-08-29 00:02:02'),
(24, 'Azka', 'azka@gmail.com', '$2y$10$ZbOnjoWo1Eyz8OkqNJjKbeo4gzSQP3C5vZRn0w/DVLYSt20NRkmJW', 'user', NULL, 1, '2026-08-29 00:08:15', '2026-08-29 00:08:15'),
(25, 'Haniya', 'haniya@gmail.com', '$2y$10$83xi/tLoVw5H5EaGvwTpJ.cCzZKxkb74VuGtG0F2XCoBkii/6WddS', 'user', NULL, 1, '2026-08-29 00:17:38', '2026-08-29 00:17:38'),
(26, 'Waniya', 'waniya@gmail.com', '$2y$10$undC1fxvGc7J103xjDQFYuunc8iHyV5gMfPT.NOYSK2yUqv7Zc8xm', 'user', NULL, 1, '2026-08-29 00:22:33', '2026-08-29 00:22:33'),
(27, 'Ajwa', 'ajwa@gmail.com', '$2y$10$hP36Q1fs3cy08Kf0Ye/nWelX37TsI.L7YUJk1SO25jNn6JURXGGiC', 'user', NULL, 1, '2026-08-29 00:26:49', '2026-08-29 00:26:49'),
(28, 'Ahmed', 'ahmed@gmail.com', '$2y$10$9O9FtdhrOU0x08D8ejxo3ugCWyWh2evEUKpsVgYBYIqslGyFF5wqe', 'user', NULL, 1, '2026-08-29 00:30:25', '2026-08-29 00:30:25'),
(29, 'Moiz', 'moiz@gmail.com', '$2y$10$kBOoDRi.BqHRlLqlVmvzIeWKJESs2eeip/LAochsG.YRpvX4ZnU.u', 'user', NULL, 1, '2026-08-29 00:34:40', '2026-08-29 00:34:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointment_patient` (`patient_id`),
  ADD KEY `fk_appointment_doctor` (`doctor_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_record_patient` (`patient_id`),
  ADD KEY `fk_record_doctor` (`doctor_id`),
  ADD KEY `fk_record_appointment` (`appointment_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `fk_record_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_record_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_record_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
