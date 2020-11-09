<?php
    ob_start();
    require_once 'vendor/autoload.php';
    require_once 'controller/database.php';
    require_once 'controller/function-forsite.php';
    use MatthiasMullie\Minify;
    ini_set('mbstring.language','Turkish');
    setlocale(LC_TIME, "Turkish"); //ba?ka bir dil içinse burada belirteceksin.
    setlocale(LC_ALL,'Turkish'); //ba?ka bir dil içinse burada belirteceksin.
    setlocale(LC_MONETARY, 'tr_TR');

    $site = $db->table('site')->where('id', 1)->get();
    $page = basename($_SERVER['SCRIPT_FILENAME'], '.php');
    $actual_link        = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $actual_link_amp    = "https://$_SERVER[HTTP_HOST]/amp$_SERVER[REQUEST_URI]";
    if($actual_link==$site->url.'/index.html'){
        header("HTTP/1.1 301 Moved Permanently");
        header("Location: ".$site->url);
        exit();
    }
    if($page=='index'){
        $siteBaslik     = $site->baslik;
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
<!DOCTYPE html>
<html lang="tr-TR">
<head>
    <link rel="canonical" href="<?=$actual_link;?>"/>
    <link rel="amphtml" href="<?=$actual_link_amp;?>">

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta name="description" content="<?=$siteAciklama;?>">
    <meta name="author" content="<?=$site->baslik_ic;?>">
    <title><?=$siteBaslik;?></title>
    <!-- Mobile Specific Metas
    ================================================== -->

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--Favicon-->
    <link rel="shortcut icon" href="<?=$site->cdnurl;?>/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<?=$site->cdnurl;?>/images/favicon.ico" type="image/x-icon">

    <!-- CSS
    ================================================== -->

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/bootstrap.min.css">

    <!-- IconFont -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/iconfonts.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/font-awesome.min.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/owl.theme.default.min.css">
    <!-- magnific -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/magnific-popup.css">


    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/animate.css">

    <!-- Template styles-->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/style.css">
    <!-- Responsive styles-->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/responsive.css">

    <!-- Colorbox -->
    <link rel="stylesheet" href="<?=$site->cdnurl;?>/css/colorbox.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="<?=$site->cdnurl;?>/js/html5shiv.js"></script>
    <script src="<?=$site->cdnurl;?>/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="trending-bar trending-light d-md-block">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-md-9 text-center text-md-left">
                <p class="trending-title"><i class="tsicon fa fa-bolt"></i> Popüler İçerikler</p>
                <div id="trending-slide" class="owl-carousel owl-theme trending-slide">
                    <?php
                        $populars = $db->table('sayfa')->orderBy('okunma', 'DESC')->getAll();
                        foreach ($populars as $popular){
                    ?>
                    <div class="item">
                        <div class="post-content">
                            <h2 class="post-title title-small">
                                <a href="<?=$site->url;?>/<?=$popular->url;?>.html"><?=$popular->baslik;?></a>
                            </h2>
                        </div><!-- Post content end -->
                    </div><!-- Item 1 end -->
                    <?php } ?>
                </div><!-- Carousel end -->
            </div><!-- Col end -->
            <div class="col-md-3 text-md-right text-center">
                <div class="ts-date">
                    <i class="fa fa-calendar-check-o"></i> <?php echo iconv('latin5','utf-8',strftime(' %d %B %Y, %A ',strtotime(date('d-m-Y'))));?>
                </div>
            </div><!-- Col end -->
        </div><!--/ Row end -->
    </div><!--/ Container end -->
</div><!--/ Trending end -->

<!-- Header start -->
<header id="header" class="header">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-md-12 col-sm-12 text-center">
                <div class="logo">
                    <a href="<?=$site->url;?>/">
                        <h1><?=$site->baslik_ic;?></h1>
                    </a>
                </div>
            </div><!-- logo col end -->
        </div><!-- Row end -->
    </div><!-- Logo and banner area end -->
</header><!--/ Header end -->

<div class="main-nav clearfix is-ts-sticky">
    <div class="container">
        <div class="row justify-content-between">
            <nav class="navbar navbar-expand-lg col-lg-10">
                <div class="site-nav-inner float-left">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
                        <span class="fa fa-bars"></span>
                    </button>
                    <!-- End of Navbar toggler -->
                    <div id="navbarSupportedContent" class="collapse navbar-collapse navbar-responsive-collapse">
                        <ul class="nav navbar-nav">
                            <li class="nav-item active">
                                <a href="<?=$site->url;?>"><i class="fa fa-home"></i> Anasayfa</a>
                            </li>

                            <li class="nav-item dropdown mega-dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Güncel İçerikler <i class="fa fa-angle-down"></i></a>
                                <!-- responsive dropdown -->
                                <ul class="dropdown-menu" role="menu">
                                    <?php
                                    $categories = $db->table('kategori')->getAll();
                                    foreach ($categories as $category){
                                    ?>
                                    <li><a href="<?=$site->url;?>/kategori/<?=$category->url;?>.html"><?=$category->baslik;?></a></li>
                                    <?php } ?>
                                </ul>
                                <!-- responsive dropdown end -->
                                <div class="dropdown-menu mega-menu-content clearfix">
                                    <div class="menu-tab">
                                        <div class="row">
                                            <ul class="nav nav-tabs flex-column col-2" data-toggle="tab-hover">
                                                <?php
                                                $i=1;
                                                foreach ($categories as $category){
                                                ?>
                                                <li class="nav-item">
                                                    <a class="animated fadeIn <?php if($i==1){?>active<?php } ?>" href="#<?=$category->url;?>" data-toggle="tab">
											  			<span class="tab-head">
															<span class="tab-text-title"><?=$category->baslik;?></span>
														</span>
                                                    </a>
                                                </li>
                                                <?php $i++;} ?>
                                            </ul>

                                            <div class="tab-content col-10">
                                                <?php
                                                $y=1;
                                                foreach ($categories as $category){
                                                ?>
                                                <div class="tab-pane fade show <?php if($y==1){?>active<?php } ?>" id="<?=$category->url;?>">
                                                    <div class="row">
                                                        <?php
                                                        $categoryContents = $db->table('sayfa')->where('kategori', $category->id)->orderBy('eklenme_tarihi', 'DESC')->limit(4)->getAll();
                                                        foreach ($categoryContents as $categoryContent){
                                                        ?>
                                                        <div class="col-md-3">
                                                            <div class="post-block-style clearfix">
                                                                <div class="post-thumb">
                                                                    <a href="#"><img class="img-fluid" src="<?=$site->url;?>/upload/resized/<?=$categoryContent->resim;?>" alt="<?=$categoryContent->baslik;?>" /></a>
                                                                </div>
                                                                <div class="post-content">
                                                                    <h2 class="post-title title-small">
                                                                        <a href="<?=$site->url;?>/<?=$categoryContent->url;?>.html"><?=$categoryContent->baslik;?></a>
                                                                    </h2>
                                                                </div><!-- Post content end -->
                                                            </div><!-- Post Block style end -->
                                                        </div>
                                                        <?php } ?>
                                                    </div>
                                                </div><!-- Tab pane 1 end -->
                                                <?php $y++;} ?>
                                            </div> <!-- Tab pane 2 end -->
                                        </div>
                                    </div><!-- Menu tab end -->
                                </div><!-- Mega menu end -->
                            </li><!-- Tab menu end -->
                            <?php
                            $i=1;
                            foreach ($categories as $category){?>
                            <li class="nav-item">
                                <a href="<?=$site->url;?>/<?=kategoriUrl($category->id);?>" >
                                    <?=$category->baslik;?>
                                    </a>
                                </li>
                                <?php $i++;} ?>

                        </ul><!--/ Nav ul end -->
                    </div><!--/ Collapse end -->

                </div><!-- Site Navbar inner end -->
            </nav><!--/ Navigation end -->

            <div class="col-lg-2 text-right nav-social-wrap">


                <div class="nav-search">
                    <a href="#search-popup" class="xs-modal-popup">
                        <i class="icon icon-search1"></i>
                    </a>
                </div><!-- Search end -->

                <div class="zoom-anim-dialog mfp-hide modal-searchPanel ts-search-form" id="search-popup">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="xs-search-panel">
                                <form class="ts-search-group">
                                    <div class="input-group">
                                        <input type="search" class="form-control" name="s" placeholder="Arama Kelimesi" value="">
                                        <button class="input-group-btn search-button">
                                            <i class="icon icon-search1"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!-- End xs modal -->
            </div>
        </div><!--/ Row end -->
    </div><!--/ Container end -->
</div><!-- Menu wrapper end -->

