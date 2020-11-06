<?php
require_once '../vendor/autoload.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/config.php';
$config = [
    'host'		=> 'localhost',
    'driver'	=> 'mysql',
    'database'	=> db_name,
    'username'	=> db_user,
    'password'	=> db_pass,
    'charset'	=> 'utf8',
    'collation'	=> 'utf8_general_ci',
    'prefix'	 => ''
];

$db         = new \Buki\Pdox($config);
$collation  = "utf8_general_ci";
$charset    = "utf8";
if(!isset($_GET['step'])){header('location:?step=1');}
?>
<!DOCTYPE html>
<html lang="tr-TR">
<head>
    <meta charset="utf-8">
    <title>Blog Sistemi Kurulum</title>
    <!-- Mobile Specific Metas
    ================================================== -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 mt-10">
                <div class="card" style="margin-top: 20px;font-size: 13px;">
                    <div class="card-header">
                        <h4>Veritabanı Bilgileri</h4>
                    </div>
                    <div class="card-body">
                        <p class="mt-10 mb-10">Blog sistemi otomatik kurulumu için sizden istenen bilgileri eksik giriniz.</p><br>
                        <?php
                            switch ($_GET['step']){
                                case'1':
                        ?>
                                <form action="setup.php?step=2" method="post">
                                    <div class="form-group">
                                        <label>Veritabanı Adı</label>
                                        <input type="text" name="dbname" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Veritabanı Kullanıcı Adı</label>
                                        <input type="text" name="dbuser" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Veritabanı Kullanıcı Şifresi</label>
                                        <input type="text" name="dbpass" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-success">Kaydet!</button>
                                    </div>
                                </form>
                        <?php
                                    break;
                                case'2':
                                    $dbname     = $_POST['dbname'];
                                    $dbuser     = $_POST['dbuser'];
                                    $dbpass     = $_POST['dbpass'];
                                    $contentsDecoded = ['dbname'=>$dbname, 'dbuser'=>$dbuser, 'dbpass'=>$dbpass];

                                    $jsonData       = json_encode($contentsDecoded);
                                    file_put_contents('../configdate.json', $jsonData);



                                    $sql        = $db->query("ALTER DATABASE " . db_name . " CHARACTER SET " .$charset. " COLLATE " . $collation . ";")->exec();
                                    echo "Database karakter seti başarıyla güncellendi..<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `etiket` (`id` int(11) NOT NULL,`baslik` varchar(200) NOT NULL,`url` varchar(200) NOT NULL,`aciklama` varchar(200) NOT NULL,`eklenme_tarihi` datetime DEFAULT NULL,`guncellenme_tarihi` datetime DEFAULT NULL,`silinme_tarihi` datetime DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Etiket Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `kategori` (`id` int(10) NOT NULL,`baslik` varchar(200) NOT NULL,`baslik_ic` varchar(200) NOT NULL,`ust_kategori` int(10) NOT NULL,`aciklama` varchar(200) NOT NULL,`url` varchar(200) NOT NULL,`eklenme_tarihi` datetime NOT NULL,`guncellenme_tarihi` datetime NOT NULL,`silinme_tarihi` datetime DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Kategori Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `sayfa` (`id` int(20) NOT NULL,`baslik` varchar(140) NOT NULL,`baslik_ic` varchar(140) NOT NULL,`url` varchar(200) NOT NULL,`kategori` varchar(200) NOT NULL,`icerik` text NOT NULL,`aciklama` varchar(185) NOT NULL,`resim` varchar(300) NOT NULL,`etiketler` varchar(300) NOT NULL,`yazar` int(20) NOT NULL,`okunma` int(200) NOT NULL,`sabit` int(1) DEFAULT NULL,`slider` int(1) DEFAULT NULL,`sponsorlu` int(1) DEFAULT NULL,`anasayfa` int(1) DEFAULT NULL,`eklenme_tarihi` datetime NOT NULL,`guncellenme_tarihi` datetime NOT NULL,`silinme_tarihi` datetime DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Sayfa Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `site` (`id` int(1) NOT NULL,`baslik` varchar(200) NOT NULL,`baslik_ic` varchar(50) NOT NULL,`aciklama` varchar(200) NOT NULL,`kelime` varchar(200) NOT NULL,`url` varchar(200) NOT NULL,`cdnurl` varchar(200) NOT NULL,`facebook` varchar(200) NOT NULL,`instagram` varchar(200) NOT NULL,`google` varchar(200) NOT NULL,`twitter` varchar(200) NOT NULL,`linkedin` varchar(200) NOT NULL,`pinterest` varchar(200) NOT NULL,`medium` varchar(200) NOT NULL,`email` varchar(200) NOT NULL,`youtube` varchar(200) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Site Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `uye` (`id` int(30) NOT NULL,`kullanici` varchar(200) NOT NULL,`sifre` varchar(200) NOT NULL,`isim` varchar(200) NOT NULL,`eposta` varchar(200) NOT NULL,`yetki` int(1) NOT NULL,`rutbe` int(2) NOT NULL,`aktif` int(1) NOT NULL,`il` int(11) DEFAULT '5',`dogum_tarihi` date DEFAULT NULL,`eklenme_tarihi` datetime NOT NULL,`guncellenme_tarihi` datetime NOT NULL,`silinme_tarihi` datetime DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Admin Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "CREATE TABLE `yorum` (`id` int(20) NOT NULL,`icerik_id` int(20) NOT NULL,`isim` varchar(200) NOT NULL,`eposta` varchar(200) NOT NULL,`yorum` text NOT NULL,`onay` int(1) NOT NULL,`eklenme_tarihi` datetime NOT NULL,`onaylanma_tarihi` datetime DEFAULT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Yorum Tablosu Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "ALTER TABLE `etiket`ADD PRIMARY KEY (`id`);";
                                    $table      .= "ALTER TABLE `kategori`ADD PRIMARY KEY (`id`);";
                                    $table      .= "ALTER TABLE `sayfa`ADD PRIMARY KEY (`id`);";
                                    $table      .= "ALTER TABLE `site`ADD PRIMARY KEY (`id`);";
                                    $table      .= "ALTER TABLE `uye`ADD PRIMARY KEY (`id`);";
                                    $table      .= "ALTER TABLE `yorum`ADD PRIMARY KEY (`id`);";
                                    $sql        = $db->query($table)->exec();
                                    echo "Tablo Indexleri Oluşturuldu<br>";
                                    /*--------*/
                                    $table      = "ALTER TABLE `etiket` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;";
                                    $table      .= "ALTER TABLE `kategori` MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;";
                                    $table      .= "ALTER TABLE `sayfa` MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;";
                                    $table      .= "ALTER TABLE `site` MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;";
                                    $table      .= "ALTER TABLE `uye` MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;";
                                    $table      .= "ALTER TABLE `yorum`MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;";
                                    $sql        = $db->query($table)->exec();
                                    echo "Tablo Increment Değeleri Oluşturuldu<br>";



                                    /*
                                     * İçerikler ve default değerler ekleniyor.
                                     * */
                                    $table      = "INSERT INTO `etiket` (`id`, `baslik`, `url`, `aciklama`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES (1, 'default', 'default', 'default', '2020-11-05 15:28:47', '2020-11-05 15:28:47', NULL);";
                                    $table      .= "INSERT INTO `kategori` (`id`, `baslik`, `baslik_ic`, `ust_kategori`, `aciklama`, `url`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES (1, 'Genel', 'Genel', 0, '', 'genel', '2020-11-05 15:25:56', '2020-11-05 21:08:45', NULL), (2, 'Başka Bir Kategori', 'Başka Bir Kategori', 0, 'Başka Bir Kategori', 'baska-bir-kategori', '2020-11-05 19:00:58', '2020-11-05 19:00:58', NULL);";
                                    $table      .= "INSERT INTO `site` (`id`, `baslik`, `baslik_ic`, `aciklama`, `kelime`, `url`, `cdnurl`, `facebook`, `instagram`, `google`, `twitter`, `linkedin`, `pinterest`, `medium`, `email`, `youtube`) VALUES (1, 'Blog Adı', 'Blog Adı', 'blog sitesi', 'blog sitesi', 'domain', 'domain/assets', '', '', '', '', '', '', '', '', NULL);";
                                    $table      .= "INSERT INTO `uye` (`id`, `kullanici`, `sifre`, `isim`, `eposta`, `yetki`, `rutbe`, `aktif`, `il`, `dogum_tarihi`, `eklenme_tarihi`, `guncellenme_tarihi`, `silinme_tarihi`) VALUES (1, 'admin', '95d45733aa1f4803ccdc3d44dcbc01044240b2ff', 'Blog Sistemi', 'info@blogsitesi.com', 1, 1, 1, 34, '2000-10-01', '2019-02-24 00:00:00', '2019-02-24 00:00:00', NULL);";
                                    $sql        = $db->query($table)->exec();

                                    echo "İçerikler ve default değerler eklendi<br>";
                                    break;
                                default:
                                    echo '<div class="alert alert-danger">Geçersiz Bir İşlem Yürütüldü.</div>';
                                    break;
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
