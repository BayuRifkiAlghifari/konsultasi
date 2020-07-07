-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jul 2020 pada 10.55
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi_konsultasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id_chat`, `id_pengirim`, `id_dokter`, `created_at`) VALUES
(1, 4, 5, '2020-06-28 04:40:02'),
(2, 6, 5, '2020-07-07 04:24:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat_detail`
--

CREATE TABLE `chat_detail` (
  `id_chat_detail` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `chat_detail`
--

INSERT INTO `chat_detail` (`id_chat_detail`, `id_chat`, `id_pengirim`, `id_penerima`, `message`, `created_at`) VALUES
(13, 1, 4, 5, 'asdasdasd', '2020-06-28 05:11:32'),
(14, 1, 4, 5, 'qwe', '2020-06-28 05:11:38'),
(15, 1, 4, 5, 'qwe', '2020-06-28 05:11:42'),
(16, 1, 4, 5, 'asd', '2020-06-28 05:12:54'),
(17, 1, 5, 4, 'asdasdasdqwe', '2020-06-28 05:28:07'),
(18, 1, 5, 4, 'tes\n\ntes', '2020-07-06 07:19:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id_diagnosa` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `diagnosa`
--

INSERT INTO `diagnosa` (`id_diagnosa`, `id_user`, `score`, `keterangan`, `status`, `created_at`) VALUES
(5, 4, 60, '', 'Aktif', '2020-06-27 15:30:34'),
(6, 4, 0, '', 'Aktif', '2020-07-04 06:54:38'),
(7, 4, 80, '', 'Aktif', '2020-07-04 06:54:59'),
(8, 4, 0, '', 'Aktif', '2020-07-06 07:21:42'),
(9, 4, 0, '', 'Aktif', '2020-07-07 08:05:29'),
(10, 4, 0, '', 'Aktif', '2020-07-07 08:05:36'),
(11, 4, 80, '', 'Aktif', '2020-07-07 08:08:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosa_detail`
--

CREATE TABLE `diagnosa_detail` (
  `id_diagnosa_detail` int(11) NOT NULL,
  `id_diagnosa` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `jawaban` varchar(20) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `diagnosa_detail`
--

INSERT INTO `diagnosa_detail` (`id_diagnosa_detail`, `id_diagnosa`, `id_penyakit`, `id_gejala`, `jawaban`, `nilai`, `created_at`) VALUES
(7, 5, 6, 2, '1', 20, '2020-06-27 15:30:34'),
(8, 5, 6, 3, '0', 0, '2020-06-27 15:30:34'),
(9, 5, 6, 4, '1', 40, '2020-06-27 15:30:34'),
(10, 7, 6, 2, '1', 20, '2020-07-04 06:54:59'),
(11, 7, 6, 3, '1', 20, '2020-07-04 06:54:59'),
(12, 7, 6, 4, '1', 40, '2020-07-04 06:54:59'),
(13, 8, 6, 2, '0', 0, '2020-07-06 07:21:42'),
(14, 8, 6, 3, '0', 0, '2020-07-06 07:21:43'),
(15, 8, 6, 4, '0', 0, '2020-07-06 07:21:43'),
(16, 11, 6, 2, '1', 20, '2020-07-07 08:08:10'),
(17, 11, 6, 3, '1', 20, '2020-07-07 08:08:10'),
(18, 11, 6, 4, '1', 40, '2020-07-07 08:08:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `kode_gejala` varchar(20) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `kode_gejala`, `id_penyakit`, `nama`, `nilai`, `created_at`) VALUES
(2, 'GEJL-2020-00001', 6, 'Batuk Darah', 20, '2020-06-27 13:10:50'),
(3, 'GEJL-2020-00002', 6, 'Mati', 20, '2020-06-27 14:20:59'),
(4, 'GEJL-2020-00003', 6, 'Sekarat', 40, '2020-06-27 14:21:07'),
(5, 'GEJL-2020-00004', 0, 'murah', 15000, '2020-07-07 01:30:43'),
(6, 'GEJL-2020-00005', 0, 'asd', 24, '2020-07-07 01:31:27'),
(7, 'GEJL-2020-00006', 0, 'asd', 24, '2020-07-07 01:32:33'),
(8, 'GEJL-2020-00007', 0, 'asd', 213, '2020-07-07 01:33:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `lev_id` int(11) NOT NULL,
  `lev_nama` varchar(50) NOT NULL,
  `lev_keterangan` text NOT NULL,
  `lev_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`lev_id`, `lev_nama`, `lev_keterangan`, `lev_status`, `created_at`) VALUES
(2, 'Administrator', '-', 'Aktif', '2020-06-18 09:40:31'),
(4, 'Dokter', '-', 'Aktif', '2020-06-18 10:20:10'),
(5, 'Pengguna', '-', 'Aktif', '2020-06-18 10:20:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_menu_id` int(11) NOT NULL,
  `menu_nama` varchar(50) NOT NULL,
  `menu_keterangan` text NOT NULL,
  `menu_index` int(11) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  `menu_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_menu_id`, `menu_nama`, `menu_keterangan`, `menu_index`, `menu_icon`, `menu_url`, `menu_status`, `created_at`) VALUES
(1, 0, 'Dashboard', '-', 1, 'fa fa-suitcase', 'dashboard', 'Aktif', '2020-06-18 09:40:07'),
(2, 0, 'Pengaturan', '-', 10, 'fa fa-cogs', '#', 'Aktif', '2020-06-18 09:40:07'),
(3, 2, 'Hak Akses', '-', 1, 'fa fa-caret-right', 'pengaturan/hakAkses', 'Aktif', '2020-06-18 09:40:07'),
(4, 2, 'Menu', '-', 2, 'fa fa-caret-right', 'pengaturan/menu', 'Aktif', '2020-06-18 09:40:07'),
(5, 2, 'Level', '-', 3, 'fa fa-caret-right', 'pengaturan/level', 'Aktif', '2020-06-18 09:40:07'),
(6, 2, 'Pengguna', '-', 4, 'fa fa-caret-right', 'pengaturan/pengguna', 'Aktif', '2020-06-18 09:40:07'),
(15, 0, 'Home', '-', 1, 'fa fa-home', 'home', 'Aktif', '2020-06-18 10:24:18'),
(16, 0, 'Gejala', '-', 3, 'fa fa-bug', 'gejala/data', 'Aktif', '2020-06-18 10:51:01'),
(17, 0, 'Penyakit', '-', 2, 'fa fa-ambulance', 'penyakit/data', 'Aktif', '2020-06-27 12:18:53'),
(18, 0, 'Saran', '-', 4, 'fa fa-lightbulb-o', 'saran/data', 'Aktif', '2020-06-27 13:12:26'),
(19, 0, 'Diagnosa', '-', 2, 'fa fa-medkit', 'diagnosa/data', 'Aktif', '2020-06-27 14:03:29'),
(20, 0, 'Chat', '-', 4, 'fa fa-comments-o', 'chat', 'Aktif', '2020-06-27 16:03:01'),
(21, 0, 'Program', '-', 5, 'fa fa-random', 'program/data', 'Aktif', '2020-07-07 00:54:21'),
(23, 0, 'Pembayaran', '-', 6, 'fa fa-money', 'pembayaran/data', 'Aktif', '2020-07-07 06:56:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id_program` int(11) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `gambar` varchar(250) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `tanggal_diterima` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `tanggal`, `user_id`, `id_program`, `nama`, `gambar`, `status`, `tanggal_diterima`) VALUES
(2, '2020-07-07', 4, 17, 'test', 'Screenshot_(17).png', 'valid', '2020-07-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `kode_penyakit` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `min_persentase` int(11) NOT NULL,
  `max_persentase` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `kode_penyakit`, `nama`, `min_persentase`, `max_persentase`, `created_at`) VALUES
(6, 'SICK-2020-00001', 'Kanker', 50, 80, '2020-06-27 12:58:57'),
(7, 'SICK-2020-00002', 'PENYAKITAN', 10, 100, '2020-06-27 12:59:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program`
--

CREATE TABLE `program` (
  `id_program` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `harga` int(11) NOT NULL,
  `durasi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `program`
--

INSERT INTO `program` (`id_program`, `judul`, `keterangan`, `harga`, `durasi`) VALUES
(16, 'Test', 'paket termurah', 15000, '10'),
(17, 'langganan 15 hari', 'berlangganan 15 hari', 200000, '15'),
(19, 'netflix', 'murmer', 20000, '30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_aplikasi`
--

CREATE TABLE `role_aplikasi` (
  `rola_id` int(11) NOT NULL,
  `rola_menu_id` int(11) NOT NULL,
  `rola_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_aplikasi`
--

INSERT INTO `role_aplikasi` (`rola_id`, `rola_menu_id`, `rola_lev_id`, `created_at`) VALUES
(2, 1, 2, '2020-06-18 09:39:47'),
(4, 3, 2, '2020-06-18 09:39:47'),
(5, 4, 2, '2020-06-18 09:39:47'),
(6, 5, 2, '2020-06-18 09:39:47'),
(7, 6, 2, '2020-06-18 09:39:47'),
(8, 2, 2, '2020-06-18 09:39:47'),
(17, 15, 5, '2020-06-18 10:24:29'),
(19, 16, 2, '2020-06-18 10:51:14'),
(20, 17, 2, '2020-06-27 12:19:01'),
(21, 18, 2, '2020-06-27 13:12:37'),
(22, 18, 4, '2020-06-27 13:40:59'),
(23, 1, 4, '2020-06-27 14:00:38'),
(24, 19, 5, '2020-06-27 14:03:43'),
(25, 20, 4, '2020-06-27 16:04:16'),
(26, 20, 5, '2020-06-27 16:04:21'),
(27, 21, 2, '2020-07-07 00:55:36'),
(28, 23, 2, '2020-07-07 06:56:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(11) NOT NULL,
  `role_user_id` int(11) NOT NULL,
  `role_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_users`
--

INSERT INTO `role_users` (`role_id`, `role_user_id`, `role_lev_id`, `created_at`) VALUES
(1, 1, 2, '2020-06-18 09:39:26'),
(4, 4, 5, '2020-06-18 10:47:23'),
(5, 5, 4, '2020-06-27 13:42:05'),
(6, 6, 5, '2020-07-07 04:23:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `saran`
--

CREATE TABLE `saran` (
  `id_saran` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `saran`
--

INSERT INTO `saran` (`id_saran`, `id_penyakit`, `id_user`, `judul`, `keterangan`, `created_at`) VALUES
(1, 6, 1, 'Mamam', 'Banyak ibadah', '2020-06-27 13:32:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_nama`, `user_password`, `user_email`, `user_phone`, `user_status`, `created_at`) VALUES
(1, 'Administrator', 'utqQiS/p4vWKh3E81QVNBONFqJt14hRtvAx446gYROkV8.8kh11eS', 'administrator@gmail.com', '08123123', 'Aktif', '2020-06-18 09:39:08'),
(4, 'Test', 'HMbuuXXmxRfLdVt.4lgZ3u2zkA1X5sZgKXPBNZrOeCMMSibjB9v56', 'test@gmail.com', '08123123', 'Aktif', '2020-06-18 10:47:23'),
(5, 'Dokter 1', 'IxxXBD2uRR5n3Oxfhis2F..QuIz6RspxHVtdwDxkYK3XHUKGBCbPK', 'dokter@gmail.com', '08123123', 'Aktif', '2020-06-27 13:42:05'),
(6, 'user', 'KgReZOXKeCOmgudNnfgraupzCSm2D0wyN4FwoZe80HmxoiS38KhLC', 'user@gmail.com', '07879867786', 'Aktif', '2020-07-07 04:23:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`);

--
-- Indeks untuk tabel `chat_detail`
--
ALTER TABLE `chat_detail`
  ADD PRIMARY KEY (`id_chat_detail`);

--
-- Indeks untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id_diagnosa`);

--
-- Indeks untuk tabel `diagnosa_detail`
--
ALTER TABLE `diagnosa_detail`
  ADD PRIMARY KEY (`id_diagnosa_detail`);

--
-- Indeks untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`lev_id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `id_program` (`id_program`);

--
-- Indeks untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indeks untuk tabel `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id_program`);

--
-- Indeks untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  ADD PRIMARY KEY (`rola_id`);

--
-- Indeks untuk tabel `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id_saran`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `chat_detail`
--
ALTER TABLE `chat_detail`
  MODIFY `id_chat_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id_diagnosa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `diagnosa_detail`
--
ALTER TABLE `diagnosa_detail`
  MODIFY `id_diagnosa_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `program`
--
ALTER TABLE `program`
  MODIFY `id_program` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `saran`
--
ALTER TABLE `saran`
  MODIFY `id_saran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_program`) REFERENCES `program` (`id_program`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
