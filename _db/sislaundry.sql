-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2023 pada 08.13
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sislaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `clothes`
--

CREATE TABLE `clothes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `clothes`
--

INSERT INTO `clothes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Baju', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(2, 'Celana', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(3, 'Kemeja', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(4, 'Jaket', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(5, 'Gaun', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(6, 'Rok', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(7, 'Kaos Kaki', '2023-11-17 02:50:01', '2023-11-17 02:50:01'),
(8, 'Sarung Tangan', '2023-11-17 02:50:01', '2023-11-17 02:50:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `packages`
--

INSERT INTO `packages` (`id`, `name`, `time`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Boneka Kecil', '2 Hari', '5000.00', 'Satuan', '2023-11-17 02:50:51', '2023-11-17 04:15:23'),
(2, 'Boneka Jumbo', '3 Hari', '30000.00', 'Satuan', '2023-11-17 02:50:51', '2023-11-17 04:15:00'),
(3, 'Boneka Besar', '3 Hari', '20000.00', 'Satuan', '2023-11-17 02:50:51', '2023-11-17 04:14:05'),
(4, 'Bad Cover', '2 Hari', '25000.00', 'Satuan', '2023-11-17 02:50:51', '2023-11-17 04:12:34'),
(13, 'Boneka Sedang', '3 Hari', '10000.00', 'Satuan', '2023-11-17 04:15:47', '2023-11-17 04:15:47'),
(14, 'Jasa Cuci', '1 Hari', '4000.00', 'Kg', '2023-11-17 04:16:23', '2023-11-17 04:16:23'),
(15, 'Jasa Setrika', '1 Hari', '4000.00', 'Kg', '2023-11-17 04:16:45', '2023-11-17 04:16:45'),
(16, 'Karpet', '3 Hari', '10000.00', 'Kg', '2023-11-17 04:17:12', '2023-11-17 04:17:12'),
(17, 'Kiloan 1', '2 hari', '6000.00', 'Kg', '2023-11-17 04:17:42', '2023-11-17 04:17:42'),
(18, 'Kiloan 2', '1 hari', '10000.00', 'Kg', '2023-11-17 04:17:58', '2023-11-17 04:17:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `receipt` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `package` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_transaction` decimal(10,2) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  `clothes_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_status`
--

CREATE TABLE `transaction_status` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `cuci` tinyint(4) DEFAULT 0,
  `kering` tinyint(4) DEFAULT 0,
  `strika` tinyint(4) DEFAULT 0,
  `siap` tinyint(4) DEFAULT 0,
  `selesai` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `scope`, `created_at`, `updated_at`) VALUES
(1, 'Indah Puspita Dewa', 'admin', '$2y$10$sXNXZXsMsuYmbHK4xJEDBuNL.WIB7G973R9epG6RDIims5eRT17gq', 'admin', '2023-11-17 01:38:53', '2023-11-17 07:00:38');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transactions_clothes` (`clothes_id`),
  ADD KEY `fk_transactions_packages` (`package_id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indeks untuk tabel `transaction_status`
--
ALTER TABLE `transaction_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `clothes`
--
ALTER TABLE `clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaction_status`
--
ALTER TABLE `transaction_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_clothes` FOREIGN KEY (`clothes_id`) REFERENCES `clothes` (`id`),
  ADD CONSTRAINT `fk_transactions_packages` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction_status`
--
ALTER TABLE `transaction_status`
  ADD CONSTRAINT `transaction_status_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
