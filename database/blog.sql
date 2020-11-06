-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 06 Kas 2020, 16:50:53
-- Sunucu sürümü: 5.7.32
-- PHP Sürümü: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `icnflt_blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `etiket`
--

CREATE TABLE `etiket` (
  `id` int(11) NOT NULL,
  `baslik` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `aciklama` varchar(200) NOT NULL,
  `eklenme_tarihi` datetime DEFAULT NULL,
  `guncellenme_tarihi` datetime DEFAULT NULL,
  `silinme_tarihi` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `etiket`
--

INSERT INTO `etiket` (`id`, `baslik`, `url`, `aciklama`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES
(1, 'default', 'default', 'default', '2020-11-05 15:28:47', '2020-11-05 15:28:47', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) NOT NULL,
  `baslik` varchar(200) NOT NULL,
  `baslik_ic` varchar(200) NOT NULL,
  `ust_kategori` int(10) NOT NULL,
  `aciklama` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `eklenme_tarihi` datetime NOT NULL,
  `guncellenme_tarihi` datetime NOT NULL,
  `silinme_tarihi` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`id`, `baslik`, `baslik_ic`, `ust_kategori`, `aciklama`, `url`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES
(1, 'Genel', 'Genel', 0, '', 'genel', '2020-11-05 15:25:56', '2020-11-05 21:08:45', NULL),
(2, 'Başka Bir Kategori', 'Başka Bir Kategori', 0, 'Başka Bir Kategori', 'baska-bir-kategori', '2020-11-05 19:00:58', '2020-11-05 19:00:58', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfa`
--

CREATE TABLE `sayfa` (
  `id` int(20) NOT NULL,
  `baslik` varchar(140) NOT NULL,
  `baslik_ic` varchar(140) NOT NULL,
  `url` varchar(200) NOT NULL,
  `kategori` varchar(200) NOT NULL,
  `icerik` text NOT NULL,
  `aciklama` varchar(185) NOT NULL,
  `resim` varchar(300) NOT NULL,
  `etiketler` varchar(300) NOT NULL,
  `yazar` int(20) NOT NULL,
  `okunma` int(200) NOT NULL,
  `sabit` int(1) DEFAULT NULL,
  `slider` int(1) DEFAULT NULL,
  `sponsorlu` int(1) DEFAULT NULL,
  `anasayfa` int(1) DEFAULT NULL,
  `eklenme_tarihi` datetime NOT NULL,
  `guncellenme_tarihi` datetime NOT NULL,
  `silinme_tarihi` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sayfa`
--
-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `site`
--

CREATE TABLE `site` (
  `id` int(1) NOT NULL,
  `baslik` varchar(200) NOT NULL,
  `baslik_ic` varchar(50) NOT NULL,
  `aciklama` varchar(200) NOT NULL,
  `kelime` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `cdnurl` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `pinterest` varchar(200) NOT NULL,
  `medium` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `youtube` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `site`
--

INSERT INTO `site` (`id`, `baslik`, `baslik_ic`, `aciklama`, `kelime`, `url`, `cdnurl`, `facebook`, `instagram`, `google`, `twitter`, `linkedin`, `pinterest`, `medium`, `email`, `youtube`) VALUES
(1, 'Blog Adı', 'Blog Adı', 'blog sitesi', 'blog sitesi', 'domain', 'domain/assets', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

CREATE TABLE `uye` (
  `id` int(30) NOT NULL,
  `kullanici` varchar(200) NOT NULL,
  `sifre` varchar(200) NOT NULL,
  `isim` varchar(200) NOT NULL,
  `eposta` varchar(200) NOT NULL,
  `yetki` int(1) NOT NULL,
  `rutbe` int(2) NOT NULL,
  `aktif` int(1) NOT NULL,
  `il` int(11) DEFAULT '5',
  `dogum_tarihi` date DEFAULT NULL,
  `eklenme_tarihi` datetime NOT NULL,
  `guncellenme_tarihi` datetime NOT NULL,
  `silinme_tarihi` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`id`, `kullanici`, `sifre`, `isim`, `eposta`, `yetki`, `rutbe`, `aktif`, `il`, `dogum_tarihi`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES
(1, 'admin', '95d45733aa1f4803ccdc3d44dcbc01044240b2ff', 'Blog Sistemi', 'info@blogsitesi.com', 1, 1, 1, 34, '2000-10-01', '2019-02-24 00:00:00', '2019-02-24 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

CREATE TABLE `yorum` (
  `id` int(20) NOT NULL,
  `icerik_id` int(20) NOT NULL,
  `isim` varchar(200) NOT NULL,
  `eposta` varchar(200) NOT NULL,
  `yorum` text NOT NULL,
  `onay` int(1) NOT NULL,
  `eklenme_tarihi` datetime NOT NULL,
  `onaylanma_tarihi` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `etiket`
--
ALTER TABLE `etiket`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sayfa`
--
ALTER TABLE `sayfa`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `uye`
--
ALTER TABLE `uye`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `yorum`
--
ALTER TABLE `yorum`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `etiket`
--
ALTER TABLE `etiket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `sayfa`
--
ALTER TABLE `sayfa`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `site`
--
ALTER TABLE `site`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `uye`
--
ALTER TABLE `uye`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `yorum`
--
ALTER TABLE `yorum`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
