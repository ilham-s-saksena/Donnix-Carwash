-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 04, 2022 at 12:40 AM
-- Server version: 5.7.34
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carwash`
--

-- --------------------------------------------------------

--
-- Table structure for table `Absensi`
--

CREATE TABLE `Absensi` (
  `id_absensi` bigint(20) UNSIGNED NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('Sakit','Izin','Alfa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `denda` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Absensi`
--

INSERT INTO `Absensi` (`id_absensi`, `karyawan_id`, `tanggal`, `jenis`, `keterangan`, `denda`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2022-12-03', 'Izin', 'don', 80000000, '2022-12-03 06:03:44', '2022-12-03 06:04:08', '2022-12-03 06:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gaji` int(11) NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `jenis_kelamin`, `job`, `alamat`, `no_hp`, `gaji`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'donnix', 'Laki-Laki', 'Kasir', 'bogor', '08138088304', 90000, 'img.png\r\n', NULL, '2022-12-03 06:08:46', NULL),
(2, 'ravly', 'Laki-Laki', 'Pencuci', 'bogor', '6281380085869', 80000000, 'wp1.png', '2022-12-03 06:07:49', '2022-12-03 06:11:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kas_keluar`
--

CREATE TABLE `kas_keluar` (
  `tanggal` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kk` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `tagihan_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(15) NOT NULL,
  `ket` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kas_keluar`
--

INSERT INTO `kas_keluar` (`tanggal`, `id_kk`, `user_id`, `shift_id`, `tagihan_id`, `jumlah`, `ket`, `created_at`, `updated_at`) VALUES
('2022-12-03', 1, 1, 1, 1, 100, 'bayar', '2022-12-03 05:58:34', '2022-12-03 05:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `kas_masuk`
--

CREATE TABLE `kas_masuk` (
  `id_km` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `layanan_id` bigint(20) UNSIGNED NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kas_masuk`
--

INSERT INTO `kas_masuk` (`id_km`, `tanggal`, `user_id`, `shift_id`, `layanan_id`, `harga`, `jumlah`, `total`, `created_at`, `updated_at`) VALUES
(1, '2022-12-03', 1, 1, 1, 1000000, 2, 2000000, '2022-12-03 05:52:24', '2022-12-03 05:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_layanan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `kategori`, `nama_layanan`, `harga`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cuci', 'Cuci mobil', 80000, '2022-12-03 03:19:55', '2022-12-03 03:20:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_23_094721_create_layanan_table', 1),
(4, '2019_08_23_121829_add_soft_delete_to_layanan', 1),
(5, '2019_08_23_151300_create_karyawan_tabel', 1),
(6, '2019_08_23_152750_add_soft_delete_to_karyawan', 1),
(7, '2019_08_24_133226_add_soft_delete_to_users', 1),
(8, '2019_08_25_072135_create_shift_table', 1),
(9, '2019_08_26_054821_add_soft_delete_shift_table', 1),
(10, '2019_08_27_040344_create_tanggungan_table', 1),
(11, '2019_08_27_050810_create_absensi_table', 1),
(12, '2019_08_27_070909_create_supplier_table', 1),
(13, '2019_08_27_142601_create_tagihan_table', 1),
(14, '2019_09_01_124210_create_kas_masuk_table', 1),
(15, '2019_09_02_072810_create_kas_keluar_table', 1),
(16, '2019_09_05_060351_create_penjualan_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `layanan_id` bigint(20) UNSIGNED NOT NULL,
  `plat_nomor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tanggal`, `user_id`, `shift_id`, `layanan_id`, `plat_nomor`, `jumlah`, `status`, `created_at`, `updated_at`) VALUES
(3, '2022-12-03', 1, 1, 1, 'F 2948 cd', '1', 1, '2022-12-03 06:10:22', '2022-12-03 06:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `Shift`
--

CREATE TABLE `Shift` (
  `id_shift` bigint(20) UNSIGNED NOT NULL,
  `nama_shift` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mulai` time NOT NULL,
  `selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Shift`
--

INSERT INTO `Shift` (`id_shift`, `nama_shift`, `mulai`, `selesai`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Shif 1', '00:00:00', '06:00:00', '2022-12-03 05:37:05', '2022-12-03 05:37:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `id_supplier` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`id_supplier`, `nama`, `no_hp`, `alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'asep', '6281380085869', 'bgr', '2022-12-03 05:34:00', '2022-12-03 05:34:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Tagihan`
--

CREATE TABLE `Tagihan` (
  `id_tagihan` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Tagihan`
--

INSERT INTO `Tagihan` (`id_tagihan`, `kategori`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Listrik', 'uang listrik', '2022-12-03 05:38:55', '2022-12-03 05:38:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tanggungan`
--

CREATE TABLE `tanggungan` (
  `id_tanggungan` bigint(20) UNSIGNED NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` enum('Lunas','Belum Lunas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','kasir') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'donnix', 'admin@admin.com', NULL, '$2y$10$Fj1VkPcQVbqVhtshb5F.ruPfFg9UUgkfIN5NJdtkFz3aRWLvxS7sC', NULL, '2022-12-03 03:08:49', '2022-12-03 03:08:49', NULL),
(2, 'kasir', 'kasir', 'kasir@kasir.com', NULL, '$2y$10$zghhuQyrNj/Si30yxDbK5ORHWLte/YTH6VSUuAPN8uNVWr2wTC5ES', 'YoczAl5jfwZi4seohGKALL8oPdM2CYhxdUO4DSmtNJMbhZWlZuXlBe9NmC8m', '2022-12-03 03:15:40', '2022-12-03 03:15:40', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Absensi`
--
ALTER TABLE `Absensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `kas_keluar`
--
ALTER TABLE `kas_keluar`
  ADD PRIMARY KEY (`id_kk`),
  ADD KEY `kas_keluar_user_id_foreign` (`user_id`),
  ADD KEY `kas_keluar_shift_id_foreign` (`shift_id`),
  ADD KEY `kas_keluar_tagihan_id_foreign` (`tagihan_id`);

--
-- Indexes for table `kas_masuk`
--
ALTER TABLE `kas_masuk`
  ADD PRIMARY KEY (`id_km`),
  ADD KEY `kas_masuk_user_id_foreign` (`user_id`),
  ADD KEY `kas_masuk_shift_id_foreign` (`shift_id`),
  ADD KEY `kas_masuk_layanan_id_foreign` (`layanan_id`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `penjualan_user_id_foreign` (`user_id`),
  ADD KEY `penjualan_shift_id_foreign` (`shift_id`),
  ADD KEY `penjualan_layanan_id_foreign` (`layanan_id`);

--
-- Indexes for table `Shift`
--
ALTER TABLE `Shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `Tagihan`
--
ALTER TABLE `Tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `tanggungan`
--
ALTER TABLE `tanggungan`
  ADD PRIMARY KEY (`id_tanggungan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Absensi`
--
ALTER TABLE `Absensi`
  MODIFY `id_absensi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kas_keluar`
--
ALTER TABLE `kas_keluar`
  MODIFY `id_kk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kas_masuk`
--
ALTER TABLE `kas_masuk`
  MODIFY `id_km` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Shift`
--
ALTER TABLE `Shift`
  MODIFY `id_shift` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `id_supplier` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Tagihan`
--
ALTER TABLE `Tagihan`
  MODIFY `id_tagihan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tanggungan`
--
ALTER TABLE `tanggungan`
  MODIFY `id_tanggungan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kas_keluar`
--
ALTER TABLE `kas_keluar`
  ADD CONSTRAINT `kas_keluar_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id_shift`) ON DELETE CASCADE,
  ADD CONSTRAINT `kas_keluar_tagihan_id_foreign` FOREIGN KEY (`tagihan_id`) REFERENCES `tagihan` (`id_tagihan`) ON DELETE CASCADE,
  ADD CONSTRAINT `kas_keluar_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `kas_masuk`
--
ALTER TABLE `kas_masuk`
  ADD CONSTRAINT `kas_masuk_layanan_id_foreign` FOREIGN KEY (`layanan_id`) REFERENCES `layanan` (`id_layanan`) ON DELETE CASCADE,
  ADD CONSTRAINT `kas_masuk_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id_shift`) ON DELETE CASCADE,
  ADD CONSTRAINT `kas_masuk_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_layanan_id_foreign` FOREIGN KEY (`layanan_id`) REFERENCES `layanan` (`id_layanan`) ON DELETE CASCADE,
  ADD CONSTRAINT `penjualan_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id_shift`) ON DELETE CASCADE,
  ADD CONSTRAINT `penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
