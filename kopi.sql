-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 05:38 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kopi`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailjual`
--

CREATE TABLE `detailjual` (
  `no_nota` int(11) NOT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailjual`
--

INSERT INTO `detailjual` (`no_nota`, `kode`, `harga`, `jumlah`, `total_harga`) VALUES
(1, 'P02', 18000, 1, 18000),
(1, 'P03', 19000, 2, 38000),
(2, 'P01', 14000, 1, 14000),
(2, 'P02', 18000, 1, 18000),
(2, 'P03', 19000, 1, 19000),
(3, 'P03', 19000, 1, 19000),
(4, 'P01', 14000, 1, 14000),
(4, 'P03', 19000, 1, 19000),
(5, 'P01', 14000, 1, 14000),
(5, 'P02', 18000, 21, 378000),
(5, 'P03', 19000, 1, 19000),
(6, 'P01', 14000, 1, 14000),
(6, 'P02', 18000, 2, 36000),
(6, 'P03', 19000, 1, 19000),
(7, 'P04', 10000, 1, 10000),
(7, 'P06', 3000, 2, 6000),
(8, 'P04', 10000, 1, 10000),
(8, 'P06', 3000, 1, 3000),
(9, 'P03', 13000, 2, 26000),
(10, 'P03', 13000, 1, 13000),
(10, 'P04', 10000, 1, 10000),
(10, 'P06', 3000, 1, 3000),
(11, 'P03', 13000, 3, 39000),
(11, 'P04', 10000, 1, 10000),
(12, 'P02', 10000, 1, 10000),
(12, 'P03', 13000, 1, 13000),
(12, 'P04', 10000, 1, 10000),
(13, 'P02', 10000, 2, 20000),
(13, 'P03', 13000, 1, 13000),
(13, 'P04', 10000, 1, 10000),
(14, 'P01', 8000, 2, 16000),
(14, 'P03', 13000, 1, 13000),
(15, 'P01', 8000, 1, 8000),
(15, 'P02', 10000, 1, 10000),
(15, 'P04', 10000, 1, 10000),
(16, 'P01', 8000, 1, 8000),
(16, 'P04', 10000, 1, 10000),
(17, 'P01', 8000, 4, 32000),
(17, 'P04', 10000, 2, 20000),
(17, 'P05', 17000, 1, 17000),
(17, 'P06', 3000, 1, 3000),
(18, 'P01', 8000, 1, 8000),
(18, 'P02', 10000, 1, 10000),
(18, 'P03', 13000, 1, 13000),
(18, 'P04', 10000, 1, 10000),
(19, 'P02', 10000, 1, 10000),
(19, 'P03', 13000, 1, 13000),
(19, 'P04', 10000, 1, 10000),
(20, 'P01', 8000, 1, 8000),
(20, 'P06', 3000, 2, 6000),
(20, 'P09', 8000, 1, 8000),
(21, 'P02', 10000, 1, 10000),
(21, 'P03', 13000, 1, 13000),
(21, 'P04', 10000, 1, 10000),
(23, 'P02', 10000, 1, 10000),
(23, 'P04', 10000, 1, 10000),
(23, 'P06', 3000, 1, 3000),
(24, 'P01', 8000, 1, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE `jual` (
  `no_nota` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `total_biaya` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `bukti_tf` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jual`
--

INSERT INTO `jual` (`no_nota`, `username`, `tanggal`, `total_biaya`, `pembayaran`, `kembalian`, `status`, `bukti_tf`) VALUES
(1, NULL, '2020-01-04', 56000, 56000, 0, 0, NULL),
(2, NULL, '2020-01-04', 51000, 52000, 1000, 0, NULL),
(3, NULL, '2020-01-04', 19000, 19000, 0, 0, NULL),
(4, NULL, '2020-01-04', 33000, 33000, 0, 0, NULL),
(5, NULL, '2020-01-04', 411000, 422000, 11000, 0, NULL),
(6, NULL, '2020-01-04', 69000, 600000, 531000, 0, NULL),
(7, NULL, '2020-01-05', 16000, 19000, 3000, 0, NULL),
(8, NULL, '2020-01-05', 13000, 15000, 2000, 0, NULL),
(9, NULL, '2020-01-06', 26000, 28000, 2000, 0, NULL),
(10, NULL, '2020-01-06', 26000, 30000, 4000, 0, NULL),
(11, NULL, '2020-01-06', 49000, 50000, 1000, 0, NULL),
(12, NULL, '2020-01-07', 33000, 40000, 7000, 0, NULL),
(13, NULL, '2020-01-12', 43000, 50000, 7000, 0, NULL),
(14, NULL, '2020-01-13', 29000, 30000, 1000, 0, NULL),
(15, NULL, '2020-01-13', 28000, 30000, 2000, 0, NULL),
(16, NULL, '2020-01-13', 18000, 5000000, 4982000, 1, '20200113042019200600'),
(17, NULL, '2020-01-13', 72000, 80000, 8000, 0, NULL),
(18, NULL, '2020-01-13', 41000, 50000, 9000, 1, '20200113044515634900'),
(19, NULL, '2020-01-14', 33000, 40000, 7000, 0, NULL),
(20, NULL, '2020-01-14', 22000, 50000, 28000, 0, NULL),
(21, NULL, '2020-01-19', 33000, 40000, 7000, 0, NULL),
(22, NULL, '2020-01-19', 20000, 50000, 30000, 1, '20200119045458378100'),
(23, NULL, '2020-01-19', 23000, 25000, 2000, 0, NULL),
(24, 'inuk', '2020-05-15', 8000, 10000, 2000, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`username`, `password`) VALUES
('Adinda', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
('chilman', 'ca34557d94bb7a0a7d3c59014dc96b50'),
('inuk', '81fa55d70a81dea372953df652556347'),
('maheza', '801dc3c9e3bcd2a3cf428f3b79b312b6');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode`, `nama`, `harga`, `gambar`, `deskripsi`) VALUES
('P01', 'Affogato', 27000, '20200518122831403800.jpeg', 'Affogato adalah sajian es krim dalam cangkir atau mangkuk kecil yang disiram dengan espresso. Sajian kopi unik ini berasal dari Italia. Dalam bahasa Italia affogato berarti tenggelam. Maksud dari penamaan itu adalah untuk menggambarkan tenggelamnya satu scoop es krim di dalam segelas espresso.'),
('P02', 'Americano', 20000, '20200518123046694300.jpg', 'Americano adalah minuman kopi espresso dengan tambahan air panas. Namanya diambil dari cara orang Amerika meminum espresso. Konon, penyebutan americano adalah sebagai lelucon dan ejekan terhadap orang-orang Amerika yang suka espresso-nya dibuat lebih encer.'),
('P03', 'Cappucino', 25000, '20200518123247782700.jpg', 'Kopi yang satu ini biasanya dinikmati di pagi hari. Campuran cappucino adalah 1/3 espresso, 1/3 susu yang dipanaskan, dan 1/3 susu yang dikocok hingga berbusa. Cappucino terdiri dari dua bahan dasar, yaitu kopi dan susu yang ditaburi sedikit cokelat bubuk di atas busanya.  Kunci cappucino yang nikmat adalah komposisi antara kopi, susu yang dipanaskan, dan susu yang dikocok harus seimbang. Untuk mengenali segelas kopi adalah cappucino atau bukan adalah dari rasa foam yang tegas ketika pertama kali diteguk, lalu diikuti kopi dengan rasa susu yang kuat setelahnya.'),
('P04', 'Latte', 25000, '20200518123415580000.jpg', 'Kebanyakan orang sering salah dalam membedakan antara latte dan cappucino. Walaupun keduanya sama-sama terbuat dari campuran espresso dan susu. Latte dan cappucino tetap memiliki perbedaan, yaitu banyaknya susu yang digunakan. Untuk latte perbandingan antara susu dan kopinya adalah 3 banding 1, sehingga latte lebih terasa susunya.  Untuk mengenali apakah yang kamu minum latte atau bukan, sejak pertama kali diteguk kamu akan langsung merasakan kopi yang terasa milky. Biasanya saat menuang susu ke dalam espresso seorang barista akan membentuk desain-desain tertentu yang disebut dengan latte art.'),
('P05', 'Espresso', 20000, '20200518123810303400.jpg', 'espresso merupakan kopi pekat yang dibuat dengan menuangkan air yang sangat panas. Jenis kopi yang satu ini merupakan favorit peminum kopi sejati karena memiliki cita rasa kopi yang sebenarnya. Aroma kopi pada secangkir espresso sangat kuat dan harum. Karena pekat, espresso cenderung lebih kental dan lembut. Espresso memiliki rasa yang pahit, namun akan meninggalkan kesan manis di mulut.'),
('P06', 'Kopi Tubruk', 15000, '20200518124050532300.jpg', 'Kopi Tubruk adalah minuman kopi khas Indonesia yang dibuat dengan menuangkan air panas ke dalam gelas atau teko yang sudah diisi bubuk kopi. Bisa dengan ditambahkan gula, bisa juga tanpa gula. Di Bali, Kopi Tubruk dikenal dengan nama â€œKopi Selemâ€ yang artinya kopi hitam.'),
('P09', 'Frappe', 30000, '20200518124422973600.jpg', 'FrappÃ© adalah minuman es kopi khas Yunani yang bersalut buih, terbuat dari kopi instan, gula, air dan es. FrappÃ© pertama kali diciptakan pada September 1957. Kopi ini pertama kali dibuat oleh Dimitrios Vakondios secara tidak disengaja. Dimitrios pada waktu itu adalah seorang penjual dari produk NestlÃ©.'),
('P10', 'Guillermo', 19000, '20200518124736061200.jpg', 'Kopi Guillermo Atau Kopi Lemon [image source] Kopi ini dikenal dengan nama Kopi Guillermo. Kopi ini biasa dinikmati saat panas ataupun dingin dengan campuran es batu.'),
('P11', 'Ristretto', 23000, '20200518125047749600.jpg', 'Ristretto adalah minuman kopi yang serupa dengan espresso tetapi menggunakan air yang lebih sedikit. Nama ristretto berasal dari Bahasa Italia yang memiliki arti \"terbatas\" atau \"terlarang\". ... Volume kopi yang dihasilkan dalam pembuatan ristretto adalah sebanyak 0.5 hingga 0.75 ons dalam waktu 25 detik.'),
('P12', 'Lungo', 28000, '20200518125853071800.jpg', 'lungo adalah kopi yang dihasilkan dari ekstraksi selama lebih dari 40 detik. Dan hasil volumenya tergantung dari keinginan si pelanggan. Untuk rasa sendiri, doppio cenderung lebih kuat'),
('P13', 'Picollo', 16000, '20200518130422549200.jpg', 'Piccolo adalah racikan kopi dan susu. Hampir sama dengan kopi latte namun Piccolo jumlah campuran kopinya lebih banyak dari latte. Minimal jumlah campuran kopi dan susunya sama atau seimbang. Walaupun dicampur dengan susu, harum Piccolo pekat aroma kopi hitam'),
('P14', 'Macchiato', 23000, '20200518142709594200.jpg', 'Kopi ini merupakan jenis kopi yang tidak lepas dari kopi espresso dimana macchiato merupakan espresso yang kaya rasa dengan susu dan busa'),
('P15', 'Mochaccino', 27000, '20200518143805909700.jpg', 'Mochaccino ini merupakan salah satu jenis kopi yang mangadopsi berbagai paduan bahan seperti kopi, susu, dan cokelat untuk menciptakan rasa yang nikmat dengan perpaduan yang pas'),
('P16', 'Con Panna', 23500, '20200518144423716200.jpg', 'Con Panna merupakan kopi espresso dengan sedikit krim kocok untuk meningkatkan rasa kaya dan karamel sehingga bisa menambah kenikmatan bagi penikmatnya'),
('P17', 'Flat White', 35000, '20200518144734445000.jpg', 'Espresso ristretto yang halus dengan susu untuk menciptakan rasa yang tidak terlalu kuat, tidak terlalu kental, dan rasanya tepat serta nikmat'),
('P18', 'Doppio', 21000, '20200518145004146600.jpg', 'Doppio merupakan sejenis kopi golongan esspresso dimana kopi doppio ini adalah double shot espresso sehingga menghasilkan cita rasa yang lebih '),
('P19', 'Long Black', 20000, '20200518150449806400.jpg', 'kopi ini sangat sederhana dan bisa dinikmati terutama bagi penggemar kopi espresso dimana long back merupakan 2 seloki espresso dengan seduhan air panas atau espresso hot'),
('P20', 'Yuangyang', 28000, '20200518145520180100.jpg', 'kopi yuangyang merupakan kopi dari hasil kombinasi atau perpaduan 3 bahan yaitu antara teh, kopi, dan juga susu dengan perpaduan yang pas sehingga menghasilkan cita rasa  yang dapat dinikmati'),
('P21', 'Cortado', 21500, '20200518145734351900.jpg', 'Cortado merupakan jenis kopi espresso dengan perpaduan rasio yang sudah ditentukan agar menghasilkan kenikmatan yang luar biasa kopi cortado adalah kopi dengan perpaduan one shot espresso dan susu dengan rasio 1:1'),
('P22', 'Cafe Con Hielo', 37000, '20200518150005706300.jpg', 'kopi ini sangat cocok jika kalian sedang pusing dan banyak pikiran kopi ini dapat menyegarkan pikiran anda yang sedang tidak karuan karena kopi Cafe Con Hielo merupakan perpaduan espresso dengan es batu yang akan menyegarkan pikiran anda'),
('P23', 'Cold Brew Ice Coffe', 40000, '20200518150409079600.jpg', 'Kopi ini merupakan kopi dengan cita rasa dan harga yang luar biasa karena kopi ini sangat memiliki cita rasa yang selalu membuat kita bahagia , kopi ini dibuat dari campuran bii kopi khusus untuk rasa yang sangat halus harga dan kualitas yang anda dapatkan tidak akan mengecewakan sekali anda menikmati kopi ini anda tidak bisa pindah ke lain hati nikmati kopinya rasakan sensasinya');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(4) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hak_akses` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_id`, `name`, `password`, `hak_akses`) VALUES
(4, 'admin', 'Admin', '0192023a7bbd73250516f069df18b500', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailjual`
--
ALTER TABLE `detailjual`
  ADD KEY `no_nota` (`no_nota`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `jual`
--
ALTER TABLE `jual`
  ADD PRIMARY KEY (`no_nota`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jual`
--
ALTER TABLE `jual`
  MODIFY `no_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailjual`
--
ALTER TABLE `detailjual`
  ADD CONSTRAINT `kode` FOREIGN KEY (`kode`) REFERENCES `produk` (`kode`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `no_nota` FOREIGN KEY (`no_nota`) REFERENCES `jual` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jual`
--
ALTER TABLE `jual`
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `konsumen` (`username`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
