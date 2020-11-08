<?php
ob_start();
require_once '../vendor/autoload.php';
require_once '../controller/database.php';
require_once '../controller/function-forsite.php';
use MatthiasMullie\Minify;
ini_set('mbstring.language','Turkish');
setlocale(LC_TIME, "Turkish"); //ba?ka bir dil içinse burada belirteceksin.
setlocale(LC_ALL,'Turkish'); //ba?ka bir dil içinse burada belirteceksin.
setlocale(LC_MONETARY, 'tr_TR');

$site = $db->table('site')->where('id', 1)->get();
$page = basename($_SERVER['SCRIPT_FILENAME'], '.php');
$actual_link        = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$actual_link_amp    = "https://$_SERVER[HTTP_HOST]/amp/$_SERVER[REQUEST_URI]";
if($actual_link==$site->url.'/index.html'){
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: ".$site->url);
    exit();
}
if($page=='index'){
    $siteBaslik     = $site->baslik;
    $siteBaslikic   = $site->baslik_ic;
    $siteAciklama   = $site->aciklama;
    $siteKelime     = $site->kelime;
}elseif($page=='page'){
    if($_GET['url']=='index.html'){header('location:'.$site->url.'/index.html');exit();}
    $pageInfo = $db->table('sayfa')->where('url', $_GET['url'])->get();
    if(empty($pageInfo->id)){header('location:'.$site->url.'/error.html');}
    $db->table('sayfa')->where('id', $pageInfo->id)->update(['okunma'=>$pageInfo->okunma+1]);
    $siteBaslik     = $pageInfo->baslik." - ".$site->baslik_ic;
    $siteAciklama   = $pageInfo->aciklama;
    $siteKelime     = $site->kelime;
}elseif ($page=='category'){
    $pageInfo = $db->table('kategori')->where('url', $_GET['url'])->get();
    $siteBaslik     = $pageInfo->baslik." kategorisi - ".$site->baslik_ic;
    $siteAciklama   = $pageInfo->aciklama;
    $siteKelime     = $site->kelime;
}elseif ($page=='tags'){
    $pageInfo = $db->table('etiket')->where('url', $_GET['url'])->get();
    $siteBaslik     = $pageInfo->baslik." etiketi - ".$site->baslik_ic;
    $siteAciklama   = $pageInfo->aciklama;
    $siteKelime     = $site->kelime;
}elseif ($page=='search'){
    $q = $_GET['q'];
    //$pageInfo = $db->table('etiket')->where('url', $_GET['url'])->get();
    $siteBaslik     = $q." için arama sonuçları - ".$site->baslik_ic;
    $baslik         = $q." için arama sonuçları";
    $siteAciklama   = $q.' araması için saç ekimi forum sitesinde bulunan içerikler.'.$q.' arama sonuçlarına ulaşabilirsiniz.';
    $siteKelime     = $site->kelime;
}elseif ($page=='error'){
    header('HTTP/1.0 404 Not Found');
    $siteBaslik     = "Sayfa Bulunamadı - ".$site->baslik_ic;
    $siteAciklama   = 'aradığınız sayfa saç ekimi forum sunucularımızda bulunamadı. lütfen bağlantınızı kontrol edin.';
    $siteKelime     = $site->kelime;
}
ob_start('compress_page');
?>
<!doctype html>
<html ⚡ lang="tr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <meta name="description" content="<?=$siteAciklama;?>">
    <link rel="preload" as="script" href="https://cdn.ampproject.org/v0.js">
    <link rel="preload" as="script" href="https://cdn.ampproject.org/v0/amp-experiment-0.1.js">
    <link rel="preload" as="script" href="https://cdn.ampproject.org/v0/amp-dynamic-css-classes-0.1.js">

    <link rel="preconnect dns-prefetch" href="https://fonts.gstatic.com/" crossorigin>
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    <script async custom-element="amp-experiment" src="https://cdn.ampproject.org/v0/amp-experiment-0.1.js"></script>
    <script async custom-element="amp-dynamic-css-classes" src="https://cdn.ampproject.org/v0/amp-dynamic-css-classes-0.1.js"></script>
    <script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
    <!-- Import other AMP Extensions here -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style amp-custom>
        /* Add your styles here */
        body{
            font-family: 'Roboto', sans-serif;
            padding: 50px 0 0 0;
        }
        .home-button {
            margin-top: 8px;
        }
        .headerbar {
            font-family: 'Roboto', sans-serif;
            height: 50px;
            position: fixed;
            z-index: 999;
            top: 0;
            width: 100%;
            display: flex;
            align-items: center;
            background-color: #0c5460;
        }
        .site-name {
            font-size: 18px;
            color: #fff;
            margin: auto;
        }
        .site-name a{
            color: #fff;
            font-weight: 900;
            text-decoration: none;
        }
        article.card {
            padding: 10px;
            border: 2px solid #eee;
            border-radius: 5px;
            font-size: 18px;
            margin: 10px 15px;
        }
        article.card a{
            text-decoration: none;
        }
        article.card h1 {
            font-size: 15px;
            color: #0c5460;
            padding: 0;
            margin: 5px 0;
        }
        article.card p {
            font-size: 12px;
            color: #61748d;
            padding: 0;
            margin: 0;
        }
        article.card img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .hamburger {
            padding-left: 10px;
            color: #fff;
            outline: none;
        }
        .sidebar {
            padding: 10px;
            margin: 0;
        }
        .sidebar > li {
            list-style: none;
            margin-bottom: 10px;
            width: 100%;
            /* margin-bottom: 5px; */
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
        }
        .sidebar a {
            text-decoration: none;
            color: #fff;
            font-weight: 600;
        }
        .close-sidebar {
            font-size: 18px;
            padding-left: 0px;
            color: #fff;
            position: absolute;
            right: -17px;
            top: 16px;
            outline: none;
        }
        amp-sidebar {
            --story-page-vh: 1vh;
            position: fixed!important;
            font-size: 18px;
            top: 0;
            max-height: 100vh!important;
            height: 100vh;
            max-width: 200px;
            padding: 20px;
            background-color: #0c5460;
            min-width: 45px!important;
            outline: none;
            overflow-x: visible!important;
            overflow-y: visible!important;
            z-index: 2147483647;
            -webkit-overflow-scrolling: touch;
            will-change: transform;
        }

        .copyright-content{
            background-color: #0b0b0b;
            color: #fff;
            padding: 10px;
            margin-top: 10px;
        }
        .copyright-content a{color: #fff;}
    </style>
    <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>

    <link rel="canonical" href="<?=$actual_link;?>"/>
    <title><?=$siteBaslik;?></title>
    <script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "Webpage",
            "url": "<?=$site->url;?>",
            "name": "<?=$siteBaslik;?>",
            "headline": "<?=$siteBaslikic;?>",
            "description": "<?=$siteAciklama;?>",
            "mainEntityOfPage": {
                "@type": "WebPage",
                "@id": "<?=$site->url;?>"
            },
            "publisher": {
                "@type": "Organization",
                "name": "<?=$site->url;?>",
                "logo": {
                    "url": "<?=$site->url;?>/images/logo.png",
                    "width": 175,
                    "height": 60,
                    "@type": "ImageObject"
                }
            },
            "image": {
                "@type": "ImageObject",
                "url": "<?=$site->url;?>/images/share.png",
                "width": 1200,
                "height": 630
            }
        }
    </script>
</head>
<body>
<header class="headerbar">
    <div role="button" on="tap:sidebar1.toggle" tabindex="0" class="hamburger">☰</div>
    <div class="site-name"><a href="<?=$site->url;?>"><?=$site->baslik_ic;?></a></div>
</header>
<amp-sidebar id="sidebar1" layout="nodisplay" side="left">
    <div role="button" aria-label="close sidebar" on="tap:sidebar1.toggle" tabindex="0" class="close-sidebar">✕</div>
    <ul class="sidebar">
        <?php
        $categories = $db->table('kategori')->getAll();
        foreach ($categories as $category){
            ?>
            <li><a href="<?=$site->url;?>/amp/kategori/<?=$category->url;?>.html"><?=$category->baslik;?></a></li>
        <?php } ?>
    </ul>
</amp-sidebar>