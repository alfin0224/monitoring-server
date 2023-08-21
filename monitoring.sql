-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2023 at 04:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

CREATE TABLE `hardware` (
  `hardware` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `timezone` int(11) NOT NULL,
  `local_time` datetime NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`hardware`, `location`, `timezone`, `local_time`, `latitude`, `longitude`, `created_by`, `created_at`, `deleted_at`) VALUES
(4001, 'ST. JOMBANG', 7, '2022-11-10 16:20:00', -3.709444, 115.403611, 'admin', '2022-11-10 09:20:00', NULL),
(4002, 'ST. TIMBURU', 7, '2022-11-10 16:20:00', -2.552639, 115.964806, 'admin', '2022-11-10 09:20:00', NULL),
(4003, 'ST. RIAM ADUNGAN', 7, '2022-11-10 16:20:00', -3.738917, 115.198417, 'admin', '2022-11-10 09:20:00', NULL),
(4004, 'ST. SURABAYA', 7, '2022-11-10 16:20:00', -3.709444, 115.403611, 'admin', '2023-08-19 13:22:20', '2023-08-20 07:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `hardware_detail`
--

CREATE TABLE `hardware_detail` (
  `id` int(11) NOT NULL,
  `hardware` int(11) NOT NULL,
  `sensor` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hardware_detail`
--

INSERT INTO `hardware_detail` (`id`, `hardware`, `sensor`, `deleted_at`) VALUES
(1, 4001, 'rf', NULL),
(2, 4002, 'wl', NULL),
(3, 4002, 'bt', NULL),
(4, 4003, 'ah', NULL),
(5, 4003, 'ws', NULL),
(6, 4003, 'bt', NULL),
(13, 4002, 'rf', '2023-08-20 08:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `master_sensors`
--

CREATE TABLE `master_sensors` (
  `sensor` varchar(4) NOT NULL,
  `sensor_name` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_sensors`
--

INSERT INTO `master_sensors` (`sensor`, `sensor_name`, `unit`, `created_by`, `created_at`, `deleted_at`) VALUES
('ah', 'Air Humidity', '%', 'super admin', '2022-11-10 09:20:00', NULL),
('bt', 'Battery', 'Volt', 'admin', '2022-11-10 09:20:00', NULL),
('rf', 'Rainfall', 'mm', 'admin', '2022-11-10 09:20:00', NULL),
('ts', 'Test Sensor', 'mm', 'admin', NULL, '2023-08-19 23:33:34'),
('wl', 'Water Level', 'cm', 'admin', '2022-11-10 09:20:00', NULL),
('ws', 'Wind Speed', 'm/s', 'admin', '2022-11-10 09:20:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2023_08_18_144712_create_role_user_table', 2),
(6, '2023_08_18_150136_create_role_user_table', 3),
(8, '2014_10_12_000000_create_users_table', 4),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 4),
(10, '2019_08_19_000000_create_failed_jobs_table', 4),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(12, '2023_08_18_150136_create_roles_table', 5),
(13, '2023_08_18_150224_add_role_id_to_users_table', 5),
(14, '2023_08_19_030202_create_master_sensors_table', 6),
(15, '2023_08_19_101247_create_transaksis_table', 7),
(16, '2023_08_19_101301_create_transaksi_details_table', 7),
(17, '2023_08_19_102145_create_transaksis_table', 8),
(18, '2023_08_19_102150_create_transaksi_details_table', 8),
(19, '2023_08_19_133357_create_master_sensors_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(24, 'App\\Models\\User', 1, 'authToken', 'e4ec0dfbd6db931e43e05b1f447f3c85b0b39ebd542eaa8d9009f6192493d2de', '[\"*\"]', '2023-08-20 18:01:06', NULL, '2023-08-20 18:00:46', '2023-08-20 18:01:06'),
(25, 'App\\Models\\User', 1, 'authToken', '9edc320cf59c659e202616c7ebc7bd108dc9b7c47b97954699ff6eb254983ae1', '[\"*\"]', '2023-08-20 18:02:38', NULL, '2023-08-20 18:02:19', '2023-08-20 18:02:38'),
(26, 'App\\Models\\User', 1, 'authToken', 'a1f9dfd0dc288f89e291873e8161abf76939b4757609255e49a1073db8fece0b', '[\"*\"]', '2023-08-20 19:23:57', NULL, '2023-08-20 18:06:07', '2023-08-20 19:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', '2023-08-18 08:55:48', '2023-08-18 08:55:48'),
(2, 'admin', '2023-08-18 08:55:48', '2023-08-18 08:55:48'),
(3, 'user', '2023-08-18 08:55:48', '2023-08-18 08:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `trans_id` bigint(20) UNSIGNED NOT NULL,
  `hardware` int(11) NOT NULL,
  `parameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`parameter`)),
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`trans_id`, `hardware`, `parameter`, `created_by`, `created_at`, `deleted_at`) VALUES
(1, 4001, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-08 09:20:00', NULL),
(2, 4002, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-08 09:20:00', NULL),
(3, 4003, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-08 09:20:00', NULL),
(4, 4001, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-09 09:20:00', NULL),
(5, 4002, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-09 09:20:00', NULL),
(6, 4003, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-09 09:20:00', NULL),
(7, 4001, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-10 09:20:00', NULL),
(8, 4002, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-10 09:20:00', NULL),
(9, 4003, '{\"key1\": \"value1\", \"key2\": \"value2\"}', 'admin', '2022-11-10 09:20:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trans_id` bigint(20) UNSIGNED NOT NULL,
  `hardware` int(11) NOT NULL,
  `sensor` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `trans_id`, `hardware`, `sensor`, `value`, `deleted_at`) VALUES
(1, 1, 4001, 'rf', 0.50, NULL),
(2, 2, 4002, 'wl', 701.25, NULL),
(3, 2, 4002, 'bt', 12.10, NULL),
(4, 3, 4003, 'ah', 27.00, NULL),
(5, 3, 4003, 'ws', 10.00, NULL),
(6, 3, 4003, 'bt', 12.15, NULL),
(7, 4, 4001, 'rf', 1.50, NULL),
(8, 5, 4002, 'wl', 750.50, NULL),
(9, 5, 4002, 'bt', 12.30, NULL),
(10, 6, 4003, 'ah', 25.00, NULL),
(11, 6, 4003, 'ws', 8.55, NULL),
(12, 6, 4003, 'bt', 12.05, NULL),
(13, 7, 4001, 'rf', 0.50, NULL),
(14, 8, 4002, 'wl', 550.75, NULL),
(15, 8, 4002, 'bt', 12.20, NULL),
(16, 9, 4003, 'ah', 25.00, NULL),
(17, 9, 4003, 'ws', 11.30, NULL),
(18, 9, 4003, 'bt', 12.23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Alfienda Rahman', 'alfin@gmail.com', NULL, '$2y$10$N5/yDysYEcuaMcjfx07jP.NIoQgYDMfl/m0ImmWSuGsxqJzWfApyS', NULL, '2023-08-18 20:07:46', '2023-08-18 20:07:46', 1),
(2, 'John Doe', 'john@gmail.com', NULL, '$2y$10$1IrnNyS67mdUWB1AtM2c5un8NUY3PgPHEJyO9kGdM9M1GTulV9Fki', NULL, '2023-08-18 20:11:15', '2023-08-18 20:11:15', 2),
(3, 'Michael Paulo', 'michael@gmail.com', NULL, '$2y$10$Q9bN1UkUiWJk3RpZhu/MXOY6vxzng8Qva.0ND072Qyz.OPCsvMa5K', NULL, '2023-08-20 17:03:52', '2023-08-20 17:03:52', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`hardware`);

--
-- Indexes for table `hardware_detail`
--
ALTER TABLE `hardware_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hardware_detail_ibfk_1` (`hardware`),
  ADD KEY `hardware_detail_ibfk_2` (`sensor`);

--
-- Indexes for table `master_sensors`
--
ALTER TABLE `master_sensors`
  ADD PRIMARY KEY (`sensor`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hardware_detail`
--
ALTER TABLE `hardware_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `trans_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hardware_detail`
--
ALTER TABLE `hardware_detail`
  ADD CONSTRAINT `hardware_detail_ibfk_1` FOREIGN KEY (`hardware`) REFERENCES `hardware` (`hardware`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hardware_detail_ibfk_2` FOREIGN KEY (`sensor`) REFERENCES `master_sensors` (`sensor`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
