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
                    <li><?=etiketGetirUrl($pageInfo->id);?></li>
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
            <div class="col-lg-12 col-md-12">
                <h2 class="block-title">
                    <span class="title-angle-shap"><?=$pageInfo->baslik?></span>
                </h2>
                <div class="row ts-gutter-20">
                    <?php
                    $all = $db->table('sayfa')->like('etiketler', '%'.$pageInfo->id.'%')->orderBy('guncellenme_tarihi', 'desc')->getAll();
                    foreach ($all as $single){
                    ?>
                    <div class="col-md-3">
                        <div class="post-block-style">
                            <div class="post-thumb">
                                <a href="#">
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
        </div><!-- Row end -->
    </div><!-- Container end -->
</section><!-- First block end -->


<?php include_once 'template/static/footer.php';?>
