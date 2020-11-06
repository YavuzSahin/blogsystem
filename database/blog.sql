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

INSERT INTO `sayfa` (`id`, `baslik`, `baslik_ic`, `url`, `kategori`, `icerik`, `aciklama`, `resim`, `etiketler`, `yazar`, `okunma`, `sabit`, `slider`, `sponsorlu`, `anasayfa`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES
(11, 'Türk Siyasetinin Beyaz Güvercini Bülent Ecevit', 'Türk Siyasetinin Beyaz Güvercini Bülent Ecevit', 'turk-siyasetinin-beyaz-guvercini-bulent-ecevit', '1', '<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Robert Koleji&rsquo;nden mezun olduktan sonra Londra&rsquo;ya giden, Harvard &Uuml;niversitesi&rsquo;nde incelemelerde bulunan, gazeteci, yazar, şair ve memleket sevdalısı bir siyaset&ccedil;iydi B&uuml;lent Ecevit&hellip;</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Kariyerinin her adımı aldığı eğitimin ne kadar iyi olduğunu g&ouml;zler &ouml;n&uuml;ne seriyordu.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Orta, alt ve yoksul kesimlerin sola y&ouml;nelmesini sağladı, milliyet&ccedil;ilerin &ouml;nyargılarını kırarak bambaşka bir siyaset inşa etti, &ccedil;ok&ccedil;a eleştirilmesine rağmen T&uuml;rkiye i&ccedil;in &ccedil;ok &ccedil;alıştı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">&Ouml;l&uuml;m&uuml;n&uuml;n 14. yıl d&ouml;n&uuml;m&uuml;nde size B&uuml;lent Ecevit&#39;i, Karaoğlan&#39;ı anlatacağız. Dilimiz d&ouml;nd&uuml;ğ&uuml;nce elbette...</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Babası Prof. Dr. Fahri Ecevit CHP Kastamonu milletvekiliydi, annesi Fatma Nazlı ise bir ressamdı...</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">28 Mayıs 1925 g&uuml;n&uuml; İstanbul&#39;da d&uuml;nyaya g&ouml;zlerini a&ccedil;an B&uuml;lent Ecevit&#39;in hem iyi bir siyaset&ccedil;i hem de ger&ccedil;ek bir sanat&ccedil;ı olmasının altında yatan en &ouml;nemli neden hi&ccedil; ş&uuml;phesiz ailesiydi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Tam bu noktada, kolejden tanıştığı ve 1946 yılında d&uuml;nya evine girdiği Rahşan Aral&#39;ı, bildiğimiz haliyle Rahşan Ecevit&#39;i anmadan olmaz...</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">&ldquo;Yanımdaki sensin, yalnızlığım sen, kendimden bile uzakta, elim elindeyken...&rdquo; satırlarını yazdığı Rahşan Hanım&#39;la Robert Koleji&#39;nde tanıştılar, &Ccedil;ocuk Esirgeme Kurumu salonunda sade bir t&ouml;renle evlendiler ve &ouml;l&uuml;m&uuml;ne kadar birbirlerinden hi&ccedil; ayrılmadılar. B&uuml;lent Ecevit&#39;i B&uuml;lent Ecevit yapan en &ouml;nemli insanlardan biriydi Rahşan Ecevit...</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1944 yılında d&ouml;nemin en iyi okullarından biri olan, h&acirc;l&acirc; mezunlarıyla fark yaratan Robert Koleji&#39;nden mezun oldu; Ankara &Uuml;niversitesi&rsquo;nde İngiliz Dili ve Edebiyatı, Londra &Uuml;niversitesi&rsquo;nde Sanskrit, Bengalce, Sanat Tarihi b&ouml;l&uuml;mlerine devam etti.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Mezun olduktan sonra Basın-Yayın Genel M&uuml;d&uuml;rl&uuml;ğ&uuml;&rsquo;ne İngilizce &ccedil;evirmen olarak girdi, 1946-1950 yılları arasında Londra&rsquo;da T&uuml;rk Basın Ataşeliğinde &ccedil;alıştı. 1950&rsquo;li yıllarda Ulus, Yeni Ulus ve Halk&ccedil;ı gazetelerinde yazar ve yazı işleri m&uuml;d&uuml;r&uuml; olarak g&ouml;rev yaptı. 1955 yılında ise Amerika Birleşik Devletleri&rsquo;nde yayınlanan Winston Salem gazetesinde konuk gazeteci olarak &ccedil;alıştı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Rockefeller Foundation Fellowship Bursu ile Amerika Birleşik Devletleri&rsquo;ne gitti, Harvard &Uuml;niversitesi&rsquo;nde sosyal psikoloji ve Orta Doğu &uuml;zerine incelemeler yaptı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">T&uuml;rk insanını ve T&uuml;rkiye&rsquo;yi en doğru şekilde analiz etmesinin başlıca nedeni tabii ki eğitimiydi. Kendini ger&ccedil;ekleştirmek ve &uuml;lkesini en doğru şekilde tanımak i&ccedil;in &ccedil;ıktığı bu yolda doğru eğitimler alarak siyasetini inşa etti.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1954 yılında katıldığı Cumhuriyet Halk Partisi&rsquo;ne yıllarca hizmet etti, 1957&rsquo;de Ankara&rsquo;dan milletvekili se&ccedil;ildi ve T&uuml;rkiye i&ccedil;in bambaşka bir siyaset defteri a&ccedil;ıldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Gazetecilik yapmaya ve &uuml;retmeye devam eden B&uuml;lent Ecevit, işini yaptığı i&ccedil;in sık sık sorgulamalardan ge&ccedil;ti. Ulus gazetesinde &ccedil;alışırken Celal Bayar&rsquo;a hakaret ettiği gerek&ccedil;esiyle sorguya alınırken, yine aynı gazetenin kapanmasına ve gazetecilerin tutuklanmasına neden oldu. Tekrar ediyoruz: Sadece işini yaptı, tıpkı bug&uuml;n olduğu gibi o g&uuml;n de gazeteciler benzer sans&uuml;rlerden ge&ccedil;iyorlardı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Milletvekili se&ccedil;ildikten sonra da yazmaya, &uuml;retmeye, yazıları &uuml;zerinden yeni bir T&uuml;rkiye yaratma &ccedil;alışmalarına devam etti.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Kurucu meclis &uuml;yeliği yaptığı ve yıllar boyunca farklı şehirlerden milletvekili se&ccedil;ildiği CHP&rsquo;nin 33 yıllık başkanı İsmet İn&ouml;n&uuml;&rsquo;y&uuml; devirdi ve 1972 yılında partinin başına ge&ccedil;ti.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1960 ve 1961 yılında kurucu meclis &uuml;yeliği g&ouml;revini y&uuml;r&uuml;ten B&uuml;lent Ecevit, 1961 yılında Ankara&rsquo;dan ve 1965 yılında Zonguldak&rsquo;tan milletvekili se&ccedil;ildi. 1961-1965 yılları arasında İsmet İn&ouml;n&uuml; başbakanlığında &Ccedil;alışma Bakanı olarak g&ouml;rev yaptı. İşte bu d&ouml;nemde T&uuml;rkiye değişimle tanışmaya başladı: Toplu s&ouml;zleşme ve grev hakları yasalaştı, sendika &ouml;zg&uuml;rl&uuml;ğ&uuml; sağlandı, &ccedil;alışma hakları ve sosyal g&uuml;venlik genel anlamda genişletildi. 1966 yılında başladığı parti genel sekreterliğini, 1971&rsquo;de askeri y&ouml;netimce oluşturulan h&uuml;k&uuml;mete katkıda bulunulduğu gerek&ccedil;esiyle bıraktı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">İsmet İn&ouml;n&uuml;&rsquo;n&uuml;n istifasıyla birlikte 1972 yılında ger&ccedil;ekleştirilen &ouml;zel kurultayla genel başkanlığa se&ccedil;ildi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Genel başkan olduğu ilk se&ccedil;imde oyların y&uuml;zde 33&rsquo;&uuml;n&uuml; aldı, 1974 yılında başbakan oldu ve bu ilk d&ouml;neminde Kıbrıs Barış Harekatı ile T&uuml;rk tarihine silinmez bir iz bıraktı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1973 yılındaki se&ccedil;imlerde yaşlı bir kadının &ldquo;Karaoğlan nirede ha evlatlar? Karaoğlan&#39;ı g&ouml;rmek istiyom&rdquo; sorusu B&uuml;lent Ecevit&rsquo;in Karaoğlan lakabını almasına vesile oldu. Milli Selamet Partisi ile koalisyon h&uuml;k&uuml;meti kurarak 8 ay kadar başbakanlık g&ouml;revini icra etti. 1974 yılında &ldquo;Ayşe tatile &ccedil;ıksın&rdquo; parolasıyla Kıbrıs Barış Harek&acirc;tı&#39;nı ger&ccedil;ekleştirerek T&uuml;rk ordusunun adaya &ccedil;ıkmasını sağladı. &quot;Biz aslında savaş i&ccedil;in değil, barış i&ccedil;in ve yalnız T&uuml;rklere değil, Rumlara da barış g&ouml;t&uuml;rmek i&ccedil;in adaya gidiyoruz&quot; dedi ve bu tarihten sonra Kıbrıs Fatihi olarak anıldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">&quot;T&uuml;rkiye&#39;nin neresinde ne yetişeceğine T&uuml;rklerden başka kimse karışamaz.&quot;</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">T&uuml;rkiye&rsquo;nin uyuşturucu ka&ccedil;ak&ccedil;ılığı ile su&ccedil;landığı yıllardı. 1971&rsquo;de Nihat Erim tarafından yasaklanan haşhaş ekimini 1974 yılında bazı b&ouml;lgelerde serbest bırakan B&uuml;lent Ecevit, o g&uuml;nleri ş&ouml;yle anlatıyordu: &ldquo;Yasaklayıcı tutumlarına karşın haşhaş &uuml;retimini belli kurallar i&ccedil;inde serbest bırakışımız ABD&#39;de &ccedil;ok tepki uyandırmıştı. Kongre&#39;nin ambargosu aslında Kıbrıs değil, haşhaşla ilgiliydi. Sonra Kıbrıs&#39;a yamandı.&rsquo;&rsquo; Bu karar ve Kıbrıs Harekatı&rsquo;yla birlikte T&uuml;rkiye&rsquo;ye ambargo uygulandı, İncirlik &Uuml;ss&uuml;&rsquo;n&uuml;n kullanımı askıya alındı. Ambargo 1978 yılına dek s&uuml;rd&uuml; ama Ecevit&#39;in bu &ccedil;ıkışı hafızalarda yer etti. </span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1977 yılında kurduğu azınlık h&uuml;k&uuml;meti g&uuml;venoyu alamadı, 1978-1979 yıllarında başbakanlık yaptı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Ve 12 Eyl&uuml;l1980 askeri darbesiyle siyaseten yasaklandı, Hamzak&ouml;y&#39;de g&ouml;zetim altında tutuldu, yargılandı ve mahkum edildi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1970&#39;li yıllardaki &ccedil;ıkışının ardından se&ccedil;im kampanyaları sabote edilen, defalarca suikast girişimine uğrayan ve halk&ccedil;ı tavrıyla d&ouml;nemin atmosferinde kendini belli eden B&uuml;lent Ecevit&#39;in hayatı 1980 askeri darbesiyle farklı bir konuma geldi. Siyasetten uzaklaştırılan ve 1982 yılında siyasetle uğraşması on yıl boyunca yasaklanan Karaoğlan, ayrıca Ulucanlar Cezaevi&#39;nde yattı. Hamzak&ouml;y&#39;e aktarıldığı 12 Eyl&uuml;l sabahında &ccedil;ekilen bu fotoğraf da T&uuml;rkiye&#39;nin utan&ccedil; tarihine atılan bir imza olarak kaldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Askeri y&ouml;netimin siyasal &ccedil;alışmalarını yasaklaması &uuml;zerine genel başkanlık g&ouml;revini bıraktı, &lsquo;Arayış&rsquo; dergisiyle siyasal yaşama katkılarını s&uuml;rd&uuml;rd&uuml; ancak bu dergi de askeri rejim tarafından kapatıldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Siyasal olarak yasaklı kaldığı 1987 yılına kadar &ccedil;alışmalarına devam etti ve bu &ccedil;alışmaları nedeniyle de hakkında 100&rsquo;&uuml; aşkın dava a&ccedil;ıldı, &uuml;&ccedil; kez hapse mahkum edildi. Dergilerde aktif olarak yazılar yazmaya devam eden B&uuml;lent Ecevit&rsquo;i hi&ccedil;bir şey yazma aşkından geri bırakamadı. D&uuml;ş&uuml;ncelerini ifade etmeyi, yazmayı, &uuml;retmeyi ve T&uuml;rkiye&rsquo;yi bir adım ileri taşımayı her daim kendisine g&ouml;rev belledi, yılmadan &ccedil;alışmalarını s&uuml;rd&uuml;rd&uuml;.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Yasaklı olduğu d&ouml;nemde eşi Rahşan Ecevit&rsquo;le birlikte Demokratik Sol Parti&rsquo;yi kurdu ve 1987&rsquo;deki halk oylamasıyla siyasal haklarına yeniden kavuşunca partinin genel başkanlığına se&ccedil;ildi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1991 yılında Zonguldak&rsquo;tan milletvekili se&ccedil;ilerek meclise yeniden girdi, 1997-1998 yılları arasında kurulan h&uuml;k&uuml;mette başbakan yardımcılığı yaptı, 28 Şubat s&uuml;recinde kurulan Mesut Yılmaz başkanlığındaki h&uuml;k&uuml;met gensoru ile d&uuml;ş&uuml;r&uuml;l&uuml;nce 1999&rsquo;da kurulan azınlık h&uuml;k&uuml;metinin başbakanı oldu. D&ouml;rd&uuml;nc&uuml; kez oturduğu başbakanlık koltuğunda T&uuml;rkiye tarihine damgasını vurdu ve PKK elebaşısı Abdullah &Ouml;calan&rsquo;ın Kenya&#39;da yakalanarak T&uuml;rkiye&rsquo;ye getirilmesini sağladı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">İsminde &lsquo;sol&rsquo; ge&ccedil;en bir partiyle milliyet&ccedil;ilerin &ouml;nyargılarını kırdı, &ouml;zellikle yoksul kesimlerin sola y&ouml;nelmesini sağladı ve T&uuml;rkiye&rsquo;deki sol kavramını yeniden inşa etti.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1999-2002 yılları arasında MHP ve ANAP ile birlikte kurduğu 57. h&uuml;k&uuml;metin başbakanı olarak g&ouml;rev yapan ve bu d&ouml;nemde sık sık eleştirilen B&uuml;lent Ecevit&rsquo;in en &ouml;nemli &ouml;zelliği hatalarıyla ve yanlışlarıyla barışık olmasıydı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">&quot;Ter&ouml;ristleri kendi ter&ouml;rlerinden kurtarmak i&ccedil;in...&quot;</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">19-22 Aralık 2000 tarihleri arasında aynı anda &uuml;lke &ccedil;apında 20 ayrı hapishanedeki siyasi tutuklu ve h&uuml;k&uuml;ml&uuml;lerin kaldığı bloklara operasyon d&uuml;zenlendi ve T&uuml;rkiye&#39;nin utan&ccedil; hanesine bir &ccedil;izik daha atıldı. Başbakan olan B&uuml;lent Ecevit, &#39;ter&ouml;ristleri kendi ter&ouml;rlerinden kurtarma&#39; olarak tanımladığı Hayata D&ouml;n&uuml;ş Operasyonu&#39;nu başlattı ve 30 tutuklu feci bir şekilde yaşamını yitirdi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">19 Şubat 2001 g&uuml;n&uuml; ger&ccedil;ekleştirilen Milli G&uuml;venlik Kurulu toplantısında, Cumhurbaşkanı Ahmet Necdet Sezer ile arasında bir tartışma yaşandı, anayasa kitap&ccedil;ığının fırlatıldığı bu tarihi olay sonrası T&uuml;rkiye b&uuml;y&uuml;k bir krize s&uuml;r&uuml;klendi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">O d&ouml;nem Sezer&rsquo;in h&uuml;k&uuml;meti yolsuzluklara karşı pasif davranmakla, denetleme organlarını engellemekle ve hukuka aykırı davranmakla su&ccedil;ladığı s&ouml;ylense de yıllar sonra Sezer şu s&ouml;zleri s&ouml;yledi: &ldquo;Sayın Ecevit 2 kez bana gelip Fazilet&#39;in kapatılmamasını ve Anayasa Mahkemesi (AYM) &uuml;yelerine telkinde bulunmamı istedi, ikisinde de reddettim ve aramızda b&uuml;y&uuml;k gerginlik oldu. Bu gerginlik s&uuml;rerken, Anayasa kitap&ccedil;ığı olayı yaşandı. Asıl neden, Ecevit&#39;in FP konusundaki isteğiydi.&rdquo;</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Kurulu terk etmesinin ardından başbakanlıkta kurmaylarıyla bir araya gelen B&uuml;lent Ecevit, basının karşısına &ccedil;ıktığında şu s&ouml;zleri sarf etti: &quot;H&uuml;k&uuml;met g&ouml;revinin başındadır, bu olay ekonomi programının işleyişini engellemeyecektir. Sayın Cumhurbaşkanı&#39;nın ekonomide karşılaşılabilecek problemlerde b&uuml;y&uuml;k sorumluluğu vardır.&quot;</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Borsa d&uuml;şt&uuml;, repo faizleri fırladı, d&ouml;viz &ouml;n&uuml;n&uuml; alamayacak şekilde y&uuml;kseldi, y&uuml;z binlerce insan işsiz kaldı ve krizin t&uuml;m faturası B&uuml;lent Ecevit&#39;e kesildi.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Başbakanlık merdivenlerine fırlatılan bu ikonik yazarkasa fırlatma fotoğrafı da d&ouml;neme damgasını vurdu. Krizin ardından 2002 yılında yapılan se&ccedil;imlerde DSP meclise giremedi ve B&uuml;lent Ecevit aktif siyaseti bıraktı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Uğradığı silahlı saldırı sonucu yaşamını yitiren Danıştay 2. Daire &Uuml;yesi Mustafa Y&uuml;cel &Ouml;zbilgin&#39;in cenazesinde beyin kanaması ge&ccedil;irdi ve 5 Kasım 2006 g&uuml;n&uuml; aramızdan ayrıldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Protestoların g&ouml;lgesinde kalan ve d&ouml;nemin atmosferinde sert r&uuml;zgarlar esmesine neden olan cenaze t&ouml;reninde beyin kanaması ge&ccedil;iren ve GATA&#39;ya kaldırılan B&uuml;lent Ecevit 172 g&uuml;n boyunca bitkisel hayatta kaldı. 81 yaşında hayata g&ouml;zlerini yuman Karaoğlan&#39;ın cenazesine binlerce insan katıldı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">81 yıllık yaşamına pek &ccedil;ok başarı sığdırdı, eleştirilere rağmen doğru bildiği yoldan şaşmadı, yalnızca T&uuml;rkiye ve halkı i&ccedil;in &ccedil;alıştı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Ortanın Solu (1966),  Atat&uuml;rk ve Devrimcilik (1970),  Bizim İki G&uuml;c&uuml;m&uuml;z Var: Halk ve Hak (1976), Toplum Siyaset Y&ouml;netim (1976),  Bağımsızlık ve &Ouml;zg&uuml;rl&uuml;k (1984),  Toplumsal K&uuml;lt&uuml;r&uuml;n T&uuml;rk Siyasal Yaşamına Etkisi (1989),  Değişen D&uuml;nya ve T&uuml;rkiye (1990),  Mithat Paşa ve T&uuml;rk Ekonomisinin Tarihsel S&uuml;reci (1993),  K&ouml;rfez Bunalımının &Ouml;ncesi ve Sonrası (2003),  Kıbrıs Ger&ccedil;eği ve Irak Sorunu (2003) kitaplarını yazdı, pek &ccedil;ok şiire imzasını attı, klasik eserleri &ccedil;evirerek T&uuml;rk&ccedil;eye kazandırdı, Avrupa ve Amerika&#39;daki &uuml;niversitelerde dersler verdi. </span></span></span></p>\r\n\r\n<p><span style=\"font-size:11.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\">Eğitimi, k&uuml;lt&uuml;r&uuml;, terbiyesi ve T&uuml;rkiye halkına aşkıyla &ouml;rnek bir siyaset&ccedil;iydi. Ruhu şad olsun...</span></span></span></p>', 'Kıbrıs Fatihi Oldu, Abdullah Öcalan\'ın Yakalanmasını Sağladı, ABD’ye Karşı Onur Mücadelesi Verdi.', 'turk-siyasetinin-beyaz-guvercini-bulent-ecevit_img_314109.jpg', '', 1, 2, NULL, NULL, NULL, NULL, '2020-11-05 20:10:47', '2020-11-05 20:10:47', NULL),
(2, 'Fotoğraftaki İnce Bir Detayla Aldattığını Anlayan Kadın', 'Fotoğraftaki İnce Bir Detayla Aldattığını Anlayan Kadın', 'fotograftaki-ince-bir-detayla-aldattigini-anlayan-kadin', '1', '<p>Sydney Kinsch adında kadın, &ccedil;arpıcı dedektifliği sayesinde d&ouml;rt yıllık sevgilisinin onu aldatışını yakalıyor. Bir ara T&uuml;rkiye&#39;de de Snapchat furyası d&ouml;n&uuml;yordu. Amerika halen kaldığı yerden devam ediyor. Akıllı kız Sydney sevgilisiyle telefon g&ouml;r&uuml;şmesi yaparken gelen fotoğrafta k&uuml;&ccedil;&uuml;k bir ayrıntıyı fark ediyor. G&uuml;neş g&ouml;zl&uuml;ğ&uuml;n&uuml;n hezimetine uğrayan gen&ccedil; adam yakayı b&ouml;yle ele veriyor... G&ouml;zl&uuml;ğ&uuml;n camından yansıyan g&ouml;r&uuml;nt&uuml; de bacaklarını uzatan bir kadın g&ouml;r&uuml;l&uuml;yor. Sydney anında gen&ccedil; adamı arayarak sorgulamaya başlıyor. direnemeyen gen&ccedil; adam acı itirafı yapıyor. Sydney&#39;in a&ccedil;ıklaması şu şekilde;</p>\r\n\r\n<p>&quot;Fotoğrafı yolladıktan sonra onu aradım ve g&ouml;nderdiğin şeyin farkında olup olmadığını sordum hi&ccedil;bir fikri yoktu. Yansımayı g&ouml;sterdiğimde ise benim deli olduğumu, kızın bir arkadaşının sevgilisi olduğunu iddia etti. Ama sonradan &ouml;ğrendim ki beni o ay 5 farklı kişiyle aldatmış.&quot;</p>\r\n\r\n<p>Aynı zamanda Sydney diğer hemcinslerine de fikir vermeden ge&ccedil;emiyor. &quot;Sevgilinizin g&ouml;zl&uuml;k yansımasını her zaman kontrol edin!&quot;.&nbsp;TikTok&#39;taki paylaşımı binlerce yorum ve etkileşim alan Sydney&#39;e diğer kadınlardan da benzer hikayeler gelmeye &ccedil;oktan başladı. Aynı şekilde yakalanan &ccedil;ok sayıda gen&ccedil; adam var.</p>\r\n\r\n<p>&quot;Ben de sevgilimin beni aldattığını cam yansımasından anlamıştım&quot; diyen başka bir kadının yanı sıra başka bir kadın da &quot;Ben de g&ouml;zl&uuml;k yansımasından yan koltuktaki kadın &ccedil;antasını g&ouml;r&uuml;p anlamıştım!&quot; diye ekleme yapıyor. Sizde aynı şekilde bir durumla karşılaştınız mı? L&uuml;tfen bizimle paylaşın!</p>', 'Teknolojinin nimetleriyle sevgilinizin sizi aldatıp aldatmadığını anlamak artık çok kolay. Haberin devamında ele veren ince ayrıntıya şaşıracaksınız...', 'fotograftaki-ince-bir-detayla-aldattigini-anlayan-kadin_img_497710.jpg', '', 1, 33, NULL, NULL, NULL, NULL, '2020-11-05 18:19:12', '2020-11-05 18:19:12', NULL),
(1, 'Hangi Semtler Riskli, Hangileri Güvenli? Her An Yaşanabilecek Büyük Depremin Senaryoları Burada', 'Hangi Semtler Riskli, Hangileri Güvenli? Her An Yaşanabilecek Büyük Depremin Senaryoları Burada', 'hangi-semtler-riskli-hangileri-guvenli-her-an-yasanabilecek-buyuk-depremin-senaryolari-burada', '1', '<p>Uzmanlar gelişen araştırma tekniklerinin tutarlılığı sebebiyle depremlerin yerleri ve şiddetleri konusunda son 100 yılda neredeyse hi&ccedil; yanılmadılar, İstanbul i&ccedil;in de tahminleri en az 7 şiddetinde bir deprem.</p>\r\n\r\n<p>D&uuml;nyanın en şiddetli depremi olarak ge&ccedil;en &nbsp;1960 Şili Depremi&#39;nin 9.5 şiddetinde olduğunu, &uuml;lke &ccedil;apında onarılması zor hasarlar yarattığını d&uuml;ş&uuml;necek olursak 7 şiddetinde bir depremi hayli &ouml;nemsemek gerekiyor.</p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Depremin ger&ccedil;ekleşmesi i&ccedil;in uzmanlar 2021-2029 aralığını tahmin etmiş olsalar da 2021 yılı ve ardından gelen birka&ccedil; yıl bu ihtimalin en kuvvetli olduğu zaman aralığı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Bunun yanında deprem t&uuml;m İstanbul&#39;da aynı şiddette hissedilmeyecek, orası kesin. 17 Ağustos depremini hatırlayacak olursak bu tezin ne kadar doğru olduğunu anlayabiliriz. Deprem İstanbul&#39;un Avcılar gibi belli semtlerini daha şiddetli etkilemişti ve bu durumun sebebin yapıların sağlam olmayışından ziyade deprem dalgalarının bu b&ouml;lgeye sı&ccedil;ramasıydı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Beklenen İstanbul Depremi&#39;nde de benzer bir sı&ccedil;rama olacağı &ouml;ng&ouml;r&uuml;lse de bu sefer şiddetli etkinin nerede olacağı belirsiz.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Tahminler deprem sonrası kıyıların daha yoğun etkileneceğine yoğunlaşıyor, bunu s&ouml;yleyebiliriz. Ayrıca İstanbul&#39;un yakın &ccedil;evresi depremden yoğun etkilenecek fakat Adapazarı, Yalova gibi uzak &ccedil;evrede kalan komşuları g&ouml;rece daha g&uuml;venli olacak.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">İstanbul&#39;un hangi semtleri ne &ouml;l&ccedil;&uuml;de deprem durumunda riskli konumda?</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Deprem sonrasında oluşacak olayların senaryosunu fiziki risklerle tanımlarken can kaybı, fiziksel yaralanma, i&ccedil;me ve atık su sistemlerinin g&ouml;receği zararları dahil ettiğimizde ortaya yukarıdaki harita &ccedil;ıkıyor.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Binaların sağlamlığını dışarıda bırakarak sadece fay hattının incelenmesiyle ortaya &ccedil;ıkan bu haritaya g&ouml;re kırmızı renkle ifade edilen Avcılar, Kadık&ouml;y, Maltepe ve Pendik &ccedil;evresindeki semtler depremde en b&uuml;y&uuml;k şiddeti g&ouml;ğ&uuml;sleyecek. Mahmutbey ve Beşiktaş&#39;tan başlayan hat ise kuzeye doğru gidildik&ccedil;e yaşanacak şiddetin azalacağını g&ouml;steriyor.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Ayrıca raporlara g&ouml;re deprem sonrası Fatih bu kıstaslara g&ouml;re en fazla etkilenecek semt, hatta K&uuml;&ccedil;&uuml;k&ccedil;ekmece&#39;nin tam iki katı kayıp bekleniyor.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Fatih&#39;in ardından Bah&ccedil;elievler, Avcılar, K&uuml;&ccedil;&uuml;k&ccedil;ekmece ve Bakırk&ouml;y geliyor. Bu b&ouml;lgelerde risklerin &uuml;stesinden gelebilecek yapılar aslında İstanbul&#39;un da kaderini belirleyecek.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Ardından &Ccedil;atalca, &Ccedil;ekmek&ouml;y, Arnavutk&ouml;y ve Beşiktaş geliyor. </span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">17 Ağustos 1999 depreminde 18 bin olduğu g&ouml;z &ouml;n&uuml;ne alındığında B&uuml;y&uuml;k İstanbul Depremi&#39;nde de kaybın bu sayılara benzer olmasından endişe ediliyor. Gereken &ouml;nlemler alındığında t&uuml;m İstanbul&#39;un hi&ccedil;bir zarar g&ouml;rmeden bu depremi atlatması i&ccedil;in &ccedil;alışmalar s&uuml;r&uuml;yor.</span></span></span></p>', 'Beklenen büyük deprem 16 milyon nüfuslu İstanbul\'da olacak ve çevre illerden de hissedilecek.', 'hangi-semtler-riskli-hangileri-guvenli-her-an-yasanabilecek-buyuk-depremin-senaryolari-burada_img_63105.jpg', '', 1, 20, NULL, NULL, NULL, NULL, '2020-11-05 19:54:56', '2020-11-05 19:54:56', NULL),
(12, 'Sihirli Annem\'in Ceren\'i Gizem Güven Enkaz Altından Kurtarıldığını Açıkladı', 'Sihirli Annem\'in Ceren\'i Gizem Güven Enkaz Altından Kurtarıldığını Açıkladı', 'sihirli-annemin-cereni-gizem-guven-enkaz-altindan-kurtarildigini-acikladi', '1', '<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">30 Ekim Cuma g&uuml;n&uuml; İzmir&#39;de yaşanan ve b&uuml;y&uuml;k k&uuml;&ccedil;&uuml;k demeden bir&ccedil;ok vatandaşımızı aramızdan alan depremin yarası hem bizler hem de depremzedeler i&ccedil;in kolay kolay kapanmayacak.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Kapanmayacak &ccedil;&uuml;nk&uuml; ge&ccedil;mişte yaşanan bir&ccedil;ok depremin yaraları da halen iyileşmedi. Bir girdap gibi i&ccedil;ine &ccedil;eken kaderimiz olan depremler &ccedil;oğumuzda travmalar yarattı fakat yine de bir şekilde yaşama tutunuyoruz, &ccedil;alışıyoruz.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Yarası halen daha iyileşmeyen o k&ouml;t&uuml; anları hatırlayan insanlardan biri de oyunculuğa k&uuml;&ccedil;&uuml;k yaşlarda başlayan Sihirli Annem dizisinin Ceren&#39;i Gizem G&uuml;ven.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">G&uuml;ven, İzmir depreminin ardından annesine sarılırken &ccedil;ekilen fotoğrafın yer aldığı 1999 yılına ait haberi Instagram hesabından paylaştı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Ardından hen&uuml;z 5 yaşındayken enkaz altında kaldığını ve o anları asla unutamadığını a&ccedil;ıkladı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">&Ccedil;ok k&ouml;t&uuml; anıları olduğunu ifade eden G&uuml;ven, depreme misafirliğe gittikleri evde yakalandıklarını ve annesiyle birlikte enkaz altından &ccedil;ıkarıldıklarını anlattı.</span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Gizem G&uuml;ven, bu travmaya rağmen hayatta bir&ccedil;ok başarıya imza atmış. K&uuml;&ccedil;&uuml;k yaşlarda Sihirli Annem gibi pop&uuml;ler bir dizide oynayarak yoluna devam etmiş. Şimdi aşık olduğu adamla kurduğu &ccedil;ok g&uuml;zel bir yuvası var.</span></span></span></p>', 'İzmir Depreminin Ardından Sihirli Annem\'in Ceren\'i Gizem Güven 17 Ağustos 1999\'da Enkaz Altından Kurtarıldığını Açıkladı', 'sihirli-annemin-cereni-gizem-guven-enkaz-altindan-kurtarildigini-acikladi_img_769498.jpg', '', 1, 4, NULL, NULL, NULL, NULL, '2020-11-05 20:21:54', '2020-11-05 20:21:54', NULL),
(6, 'Ciciş Kardeşler Esra-Ceyda Ersoy\'a Adanalı Sevgililerinden Gelen Hediyeler', 'Ciciş Kardeşler Esra-Ceyda Ersoy\'a Adanalı Sevgililerinden Gelen Hediyeler', 'cicis-kardesler-esra-ceyda-ersoya-adanali-sevgililerinden-gelen-hediyeler', '1', '<p>Pop&uuml;ler kızlar Ciciş Kardeşler Esra ve Ceyda yeni başladıkları Adanalı sevgilileriyle muhteşem hızlı bir aşk yaşıyor. Sevgililerinin aldıkları dudak u&ccedil;uklatan hediyeleri sosyal medya hesaplarından paylaşan Ciciş Kardeşler herkesi kıskandırmayı başardı.</p>\r\n\r\n<p>Esprili bir şekilde kendilerine alınan hediyelerin maliyetini &ccedil;aktırmadan dile getiren &ccedil;ılgın kardeşler, hediyeleri satıp parasıyla ev alacaklarını duyurdular.</p>\r\n\r\n<p>Attıkları her adım b&uuml;y&uuml;k ses getiren &uuml;nl&uuml; kızlar uzun zamandır sesleri duyulmuyordu. Bu d&ouml;n&uuml;şleri muhteşem oldu ve kendilerine alınan hediyeleri iki kardeşte gururla paylaştı.</p>\r\n\r\n<p>Olduk&ccedil;a y&uuml;ksek fiyatlarda gezen pırlanta y&uuml;z&uuml;klerinin fiyatlarını da &ccedil;ekinmeden paylaşan kızlar, bir hediyenin 120 bin, diğerinin ise 80 bin dolar civarında olduğunu a&ccedil;ıkladı.</p>\r\n\r\n<p>Nedense zengin sevgililerini sır gibi saklayan kızlar şimdilik onları a&ccedil;ıklamak istemiyor. B&ouml;yle bir hediyenin alıcısı bizce de gizlenmeli. Siz en son nasıl bir hediye almıştınız? L&uuml;tfen bizimle paylaşın...</p>', 'Kendilerine Adanalı zengin sevgili bulan kardeşler, kendilerine alınan hediyelerle herkesin ağzını açık bıraktı!', 'cicis-kardesler-esra-ceyda-ersoya-adanali-sevgililerinden-gelen-hediyeler_img_780796.jpg', '', 1, 1, NULL, NULL, NULL, NULL, '2020-11-05 19:31:58', '2020-11-05 19:31:58', NULL);

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
(1, 'Son Dakika Haberleri icnflt.com', 'icnflt.com', 'blog sitesi', 'blog sitesi', 'https://www.icnflt.com', 'https://www.icnflt.com/assets', '', '', '', '', '', '', '', '', NULL);

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
