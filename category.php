<?php include_once 'template/static/header.php';?>
<!-- breadcrumb -->
<div class="breadcrumb-section" style="padding: 0 !important;">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="<?=$site->url;?>"><?=$site->baslik_ic;?></a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li><a href="<?=$site->url;?>/<?=kategoriUrl($pageInfo->id);?>"><?=$pageInfo->baslik?></a></li>
                </ol>
            </div>
        </div><!-- row end -->
    </div><!-- container end -->
</div>
<!-- breadcrumb end -->
<!-- .section -->
<section class="block-wrapper" style="padding: 0!important;">
    <div class="container">
        <div class="row ts-gutter-30">
            <div class="col-lg-8 col-md-12">
                <h2 class="block-title">
                    <span class="title-angle-shap"><?=$pageInfo->baslik?></span>
                </h2>
                <div class="row ts-gutter-20">
                    <?php
                    $all = $db->table('sayfa')->where('kategori', $pageInfo->id)->orderBy('eklenme_tarihi', 'asc')->getAll();
                    foreach ($all as $single){
                    ?>
                    <div class="col-md-6">
                        <div class="post-block-style">
                            <div class="post-thumb">
                                <a href="<?=$site->url;?>/<?=$single->url;?>.html">
                                    <img class="img-fluid" src="<?=$site->url;?>/upload/resized/<?=$single->resim;?>" alt="">
                                </a>
                                <div class="grid-cat">
                                    <a class="post-cat tech" href="<?=$site->url;?>/<?=kategoriUrl($single->kategori);?>"><?=kategoriAdi($single->kategori);?></a>
                                </div>
                            </div>

                            <div class="post-content">
                                <h2 class="post-title">
                                    <a href="<?=$site->url;?>/<?=$single->url;?>.html"><?=$single->baslik;?></a>
                                </h2>
                                <div class="post-meta mb-7">
                                    <span class="post-date"><i class="fa fa-clock-o"></i> <?php echo iconv('latin5','utf-8',strftime(' %d %B %Y ',strtotime(date($popular->eklenme_tarihi))));?></span>
                                </div>
                            </div><!-- Post content end -->
                        </div>
                    </div><!-- end col -->
                    <?php } ?>
                </div><!-- end row -->
            </div><!-- Content Col end -->
            <div class="col-lg-4">
                <div class="sidebar">
                    <div class="sidebar-widget">
                        <h2 class="block-title block-title-dark">
                            <span class="title-angle-shap lifestyle-color">Kategoriler </span>
                        </h2>
                        <div class="ts-category">
                            <ul class="ts-category-list">
                                <?php
                                foreach ($categories as $category){
                                    ?>
                                    <li>
                                        <a href="<?=$site->url;?>/kategori/<?=$category->url;?>.html" style="background-image: url('<?=$site->url;?>/images/news/category/category1.png')">
                                            <span> <?=$category->baslik;?> </span>
                                            <span class="bar"></span>
                                            <span class="category-count"><?=kategoriYaziSayisi($category->id);?></span>
                                        </a>
                                    </li><!-- end list 1 -->
                                <?php } ?>
                            </ul>
                        </div>
                    </div><!-- widget end -->
                    <div class="sidebar-widget">
                        <h2 class="block-title block-title-dark">
                            <span class="title-angle-shap sports-color">Son Yorumlar </span>
                        </h2>
                        <div class="ts-author-comments">
                            <?php
                            $comments = $db->table('yorum')->where('onay', 1)->orderBy('eklenme_tarihi', 'DESC')->limit(10)->getAll();
                            foreach ($comments as $comment){
                                ?>
                                <div class="row ts-comments-row align-items-center mb-50">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="ts-author-content">
                                            <div class="comment">
                                                <a href="#"><?=$comment->yorum;?></a>
                                            </div>
                                            <div class="ts-author"><?=$comment->isim;?></div>
                                        </div>
                                    </div>
                                </div><!-- ts-comments-row end -->
                            <?php } ?>
                        </div>
                    </div>
                </div><!-- sidebar col end -->

            </div><!-- Row end -->

        </div><!-- Row end -->
    </div><!-- Container end -->
</section><!-- First block end -->

<?php include_once 'template/static/footer.php';?>
