-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2023 at 04:18 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 14, 1, '2023-05-02 22:22:56', '2023-05-02 22:22:56'),
(2, 3, 6, 1, '2023-05-02 22:31:06', '2023-05-02 22:31:06'),
(3, 3, 18, 1, '2023-05-02 22:31:53', '2023-05-02 22:31:53'),
(4, 3, 11, 1, '2023-05-02 22:41:53', '2023-05-02 22:41:53'),
(5, 3, 28, 1, '2023-05-02 22:45:51', '2023-05-02 22:45:51'),
(18, 3, 8, 1, '2023-05-03 21:39:10', '2023-05-03 21:39:10'),
(19, 3, 16, 1, '2023-05-03 21:59:08', '2023-05-03 21:59:08'),
(20, 5, 12, 1, '2023-05-03 22:32:23', '2023-05-03 22:32:23'),
(21, 5, 25, 1, '2023-05-03 22:35:59', '2023-05-03 22:35:59'),
(27, 4, 6, 1, '2023-05-04 11:41:54', '2023-05-04 11:41:54'),
(28, 1, 14, 1, '2023-05-05 19:54:04', '2023-05-05 19:54:04'),
(29, 1, 18, 1, '2023-05-05 19:57:47', '2023-05-05 19:57:47'),
(30, 1, 6, 1, '2023-05-05 20:13:28', '2023-05-05 20:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Men', 1, '2023-04-03 18:38:26', '2023-04-03 18:38:26'),
(2, 'Women', 1, '2023-04-03 18:39:36', '2023-04-03 18:39:36'),
(3, 'Footwear', 1, '2023-04-08 19:08:21', '2023-04-08 19:08:21'),
(4, 'Accessories', 1, '2023-04-08 20:42:46', '2023-04-08 20:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_20_191320_create_categories_table', 1),
(6, '2023_02_20_191341_create_products_table', 1),
(7, '2023_02_20_200642_create_carts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\User', 2, 'UserToken', 'a45c28b54a6c23d71e4297e1ce85b139d3eeeeb08ead8773907acc8dd0e137b1', '[\"*\"]', '2023-05-03 17:40:05', NULL, '2023-05-03 17:32:41', '2023-05-03 17:40:05'),
(33, 'App\\Models\\User', 5, 'UserToken', '58c77f0ad2881ead70207b9f583471d25fa58904d4bea01d99dece94a57fb00d', '[\"*\"]', '2023-05-03 22:46:14', NULL, '2023-05-03 22:31:55', '2023-05-03 22:46:14'),
(35, 'App\\Models\\User', 2, 'UserToken', 'c8778097a4655a67d48d3fcd251ead58e228b516ac82dc5d9259c1e208b81db5', '[\"*\"]', '2023-05-04 18:34:35', NULL, '2023-05-04 10:17:59', '2023-05-04 18:34:35'),
(41, 'App\\Models\\User', 2, 'UserToken', 'a7f660163a292967547e06c0fff65c94ad1784a14eb0f99ef3ef581ca21c9adb', '[\"*\"]', '2023-05-05 18:53:21', NULL, '2023-05-05 17:58:53', '2023-05-05 18:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `count` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `description`, `price`, `count`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(5, 'Comfort Fit Crew Neck Printed T-Shirt', 'men5.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 250.00, 15, 1, 1, '2023-04-08 00:30:55', '2023-04-08 00:30:55'),
(6, 'New Regular Fit Crew Neck Basic Short Sleeve T-Shirt', 'men2.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 285.00, 38, 1, 1, '2023-04-08 19:11:11', '2023-05-05 19:08:31'),
(7, 'Regular Fit Back Slogan Print T-Shirt', 'men6.png', 'Height: 1.86 Bust: 91 Waist: 75 Hips: 91', 260.00, 26, 1, 1, '2023-04-08 19:33:09', '2023-04-08 19:33:09'),
(8, 'Oversized Short Sleeve One Side Pocket T-Shirt', 'men7.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 399.00, 23, 1, 1, '2023-04-08 19:46:20', '2023-04-08 19:46:20'),
(9, 'Boxy Fit Crew Neck Printed T-Shirt', 'men8.png', 'Model Measurements: Height: 1.86 Bust: 92 Waist: 74 Hips: 91 Sample size: M', 330.00, 9, 1, 1, '2023-04-08 19:49:32', '2023-04-08 19:49:32'),
(10, 'Oversize Fit Crew Neck T-Shirt', 'men4.png', 'Defacto Fit Slim Fit T-Shirt', 230.00, 7, 1, 1, '2023-04-08 20:11:25', '2023-04-08 20:11:25'),
(11, 'Slim Fit V-Neck Basic Short Sleeve T-Shirt', 'men1.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 230.00, 50, 1, 1, '2023-04-08 20:16:21', '2023-04-08 20:16:21'),
(12, 'Comfort Fit Crew Neck Printed T-Shirt', 'men3.png', 'Height: 1.86 Bust: 91 Waist: 75 Hips: 91 Cotton 100%', 650.00, 15, 1, 1, '2023-04-08 20:18:41', '2023-04-08 20:18:41'),
(13, 'Regular Fit Crew Neck Pullover', 'women9.png', 'Model Measurements: Height: 1.77 Bust: 80 Waist: 60 Hips: 92', 350.00, 30, 1, 2, '2023-04-08 20:20:15', '2023-04-08 20:20:15'),
(14, 'Oversize Fit Shirt Collar Poplin Long Sleeve Shirt', 'women1.png', 'Model Measurements: Height: 1.71 Bust: 80 Waist: 59 Hips: 89Main Fabric Content: : Cotton 100%', 299.00, 17, 1, 2, '2023-04-08 20:21:54', '2023-04-08 20:21:54'),
(15, 'Regular Fit Crew Neck Short Sleeve T-Shirt', 'women2.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 250.00, 33, 1, 2, '2023-04-08 20:23:43', '2023-04-08 20:23:43'),
(16, 'Oversize Fit Shirt Collar Oxford Long Sleeve', 'women8.png', 'Model Measurements: Height: 1.71 Bust: 82 Waist: 59 Hips: 89 Sample size: M Main Fabric Content: : Cotton 100%', 300.00, 9, 1, 2, '2023-04-08 20:28:00', '2023-04-08 20:28:00'),
(17, 'Regular Fit Long Sleeve Linen Look Shirt', 'women5.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 599.00, 4, 1, 2, '2023-04-08 20:30:37', '2023-04-08 20:30:37'),
(18, 'Loose Fit Crew Neck Printed Short Sleeve T-Shirt', 'women4.png', 'Model Measurements: Height: 1.77 Bust: 80 Waist: 57 Hips: 89', 250.00, 90, 1, 2, '2023-04-08 20:32:56', '2023-04-08 20:32:56'),
(19, 'Comfort Fit Crew Neck Printed Shirt', 'women6.png', 'Model Measurements: Height: 1.77 Bust: 80 Waist: 57 Hips: 89', 439.00, 8, 1, 2, '2023-04-08 20:35:50', '2023-04-08 20:35:50'),
(20, 'Oversize Fit Shirt Collar Long Sleeve Shirt', 'women3.png', 'Model Measurements: Height: 1.77 Bust: 80 Waist: 57 Hips: 89 Cotton 100%', 480.00, 22, 1, 2, '2023-04-08 20:37:19', '2023-04-08 20:37:19'),
(21, 'Regular Fit Shirt Collar Long Sleeve Shirt', 'women7.png', 'Perfect quality shirt for women', 760.00, 4, 1, 2, '2023-04-08 20:40:59', '2023-04-08 20:40:59'),
(22, 'Women Straw Hat', 'acc2.png', 'Main Fabric Content: : Paper 66%,Polyester 34%', 140.00, 8, 1, 4, '2023-04-08 20:44:28', '2023-04-08 20:44:28'),
(23, 'Women Cotton Cap Hat', 'acc1.png', 'Main Fabric Content: : Cotton 100%', 75.00, 13, 1, 4, '2023-04-08 20:51:21', '2023-04-08 20:51:21'),
(24, 'Women Cotton Cap Hat', 'acc3.png', 'Main Fabric Content: Cotton 100%', 110.00, 8, 1, 4, '2023-04-08 20:53:06', '2023-04-08 20:53:06'),
(25, 'Women PowerPuff Girls Cap Hat', 'acc4.png', 'Main Fabric Content: Paper', 350.00, 150, 1, 4, '2023-04-08 20:54:38', '2023-04-08 20:54:38'),
(26, 'Woman Cotton Bucket Hat', 'acc5.png', 'Main Fabric Content : Cotton 100%', 80.00, 8, 1, 4, '2023-04-08 20:55:45', '2023-04-08 20:55:45'),
(27, 'Women Oval Buckle Classic Belt', 'acc6.png', 'Main Fabric Content : Polyurethane 100%', 135.00, 22, 1, 4, '2023-04-08 20:57:21', '2023-04-08 20:57:21'),
(28, 'Woman Rectangle Clasp Faux Leather Jean Belt', 'acc7.png', 'Main Fabric Content : Polyurethane 100%', 145.00, 80, 1, 4, '2023-04-08 20:58:57', '2023-04-08 20:58:57'),
(29, 'Comfort Fit Crew Neck Shirt', 'product.png', 'Model Measurements: Height: 1.87 Bust: 92 Waist: 63 Hips: 92 .. Main Fabric Content: : Cotton 100%', 250.00, 8, 1, 2, '2023-04-08 23:04:38', '2023-04-08 23:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `type`, `email_verified_at`, `password`, `address`, `city`, `postCode`, `gender`, `age`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kareem Ayman', 'kemoayman2015@gmail.com', 'admin', NULL, '$2y$10$6SEwB0/cIHcGA4O.uXZ4AubaytZbVHY65gvncbOeJZ0j72dtXwiPm', 'zahraa nasr city', 'cairo', '123456', 'male', 20, '01118614244', NULL, NULL, '2023-05-06 11:30:29'),
(2, 'kemo', 'kemo@gmail.com', 'user', NULL, '$2y$10$JxRXZavB7BqQJfj7OPJxIu/Ysguqv6WSph1bGBNK2ZtlhJIQqHOLu', 'zahraa nasr city', 'cairo', NULL, 'male', 20, '01118614255', NULL, '2023-04-29 20:50:07', '2023-04-29 20:50:07'),
(3, 'mohamed ahmed', 'mohamedAhmed@gmail.com', 'user', NULL, '$2y$10$vFg12xIXURgxSB6DGPg3xeqs874iB.yxi9W95obhWX8ekyCQijlFK', 'zahraa', 'cairo', NULL, 'male', 20, '01115614244', NULL, '2023-05-02 20:32:54', '2023-05-02 20:32:54'),
(4, 'kiko ayman', 'kemoayman5@gmail.com', 'admin', NULL, '$2y$10$53t922.w9VRwkZYPYjCrmu6AWx95dJqb4pW5Dph.y5FTCl/27L1Ci', 'Zahraa Nasrcity 620', 'Cairo', '123456', 'male', 22, '01110333550', NULL, '2023-05-03 17:15:40', '2023-05-05 12:34:27'),
(5, 'hamada', 'kimo123@mail.com', 'user', NULL, '$2y$10$il20bGos3NFbSBko8iCD5e/rR9j/oIh49XIlKx4IgyaeurzAAAcCO', 'zahraa', 'cairo', NULL, 'male', 20, '01115614245', NULL, '2023-05-03 22:31:55', '2023-05-05 12:39:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
