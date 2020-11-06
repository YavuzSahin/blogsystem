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
                    <li><a href="<?=$site->url;?>/<?=kategoriUrl($pageInfo->kategori);?>"><?=kategoriAdi($pageInfo->kategori);?></a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="<?=$site->url;?>/<?=$pageInfo->url;?>.html"><?=$pageInfo->baslik;?></a></li>

                </ol>
            </div>
        </div><!-- row end -->
    </div><!-- container end -->
</div>
<!-- breadcrumb end -->

<section class="main-content pt-0">
    <div class="container">
        <div class="row ts-gutter-30">
            <div class="col-lg-8">
                <div class="single-post">
                    <div class="post-header-area">
                        <h2 class="post-title title-lg"><?=$pageInfo->baslik;?></h2>
                        <ul class="post-meta">
                            <li>
                                <a class="post-cat fashion" href="<?=$site->url;?>/<?=kategoriUrl($pageInfo->kategori);?>"><?=kategoriAdi($pageInfo->kategori);?></a>
                            </li>
                            <li><a href="<?=$site->url;?>/<?=$pageInfo->url;?>.html"><i class="icon icon-clock"></i> <?php echo iconv('latin5','utf-8',strftime(' %d %B %Y ',strtotime(date($pageInfo->eklenme_tarihi))));?></a></li>
                            <li><a href="<?=$site->url;?>/<?=$pageInfo->url;?>.html" class="view"><i class="icon icon-fire"></i> <?=$pageInfo->okunma;?></a></li>
                        </ul>
                    </div><!-- post-header-area end -->
                    <div class="post-content-area">
                        <div class="post-media mb-20">
                            <a href="<?=$site->url;?>/upload/resized/<?=$pageInfo->resim;?>" class="gallery-popup cboxElement">
                                <img src="<?=$site->url;?>/upload/resized/<?=$pageInfo->resim;?>" class="img-fluid" alt="<?=$pageInfo->baslik;?>">
                            </a>
                        </div>
                        <?=$pageInfo->icerik;?>
                        </div><!-- post-content-area end -->
                    <div class="post-footer">
                        <div class="tag-lists">
                            <span>Etiketler: </span><a href="#">fashion</a>
                        </div><!-- tag lists -->
                        <div class="gap-30"></div>
                        <!-- comments start -->
                        <div class="comments-area">
                            <h3 class="block-title"><span>Yorumlar</span></h3>
                            <ul class="comments-list">
                                <?php
                                $pcomments = $db->table('yorum')->where('icerik_id', $pageInfo->id)->where('onay', 1)->orderBy('eklenme_tarihi', 'DESC')->getAll();
                                foreach ($pcomments as $pcomment){
                                ?>
                                <li>
                                    <div class="comment">
                                        <div class="comment-body">
                                            <div class="meta-data">
                                                <span class="comment-author"><?=$pcomment->isim;?></span>
                                                <span class="comment-date"><?php echo iconv('latin5','utf-8',strftime(' %d %B %Y, %A ',strtotime(date($pcomment->eklenme_tarihi))));?></span>
                                            </div>
                                            <div class="comment-content">
                                                <p><?=$pcomment->yorum;?></p>
                                            </div>
                                        </div>
                                    </div><!-- Comments end -->
                                </li><!-- Comments-list li end -->
                                <?php } ?>
                            </ul><!-- Comments-list ul end -->
                        </div><!-- comment end -->
                        <!-- comment form -->
                        <div class="gap-50 d-none d-md-block"></div>
                        <div class="comments-form" style="position: relative;">
                            <h3 class="title-normal">Sende Yorum Yap!</h3>
                            <form method="POST" id="comment-form" name="comment-form" action="<?=$site->url;?>/makecomment">
                                <input type="hidden" name="commentid" value="<?=$pageInfo->id;?>">
                                <div class="sending"> <div class="box"> <div class="border one"></div> <div class="border two"></div> <div class="border three"></div> <div class="border four"></div> <div class="line one"></div> <div class="line two"></div> <div class="line three"></div> </div> Yorumlanıyor..<br>Lütfen Bekleyiniz! </div>
                                <div class="sended"> <div class="successForm"> <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2"> <circle class="path circle" fill="none" stroke="#73AF55" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"></circle> <polyline class="path check" fill="none" stroke="#73AF55" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 "></polyline> </svg> <div class="success">Yorumlandı!<br>Onaylandıktan sonra yorumunuz yayınlanacak.</div> </div> <div class="failedForm"> <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2"> <circle class="path circle" fill="none" stroke="#D06079" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"></circle> <line class="path line" fill="none" stroke="#D06079" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="34.4" y1="37.9" x2="95.8" y2="92.3"></line> <line class="path line" fill="none" stroke="#D06079" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="95.8" y1="38" x2="34.4" y2="92.2"></line> </svg> <div class="error">Sorun Oluştu!<br>Lütfen daha sonra yeniden yorum yapınız!</div> </div> </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>İsim ve Soyisim</label>
                                            <input class="form-control" name="name" id="name" placeholder="İsim ve Soyisim" type="text" required="">
                                        </div>
                                    </div><!-- Col end -->

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>E-Mail Adresin</label>
                                            <input class="form-control" name="email" id="email" placeholder="E-Mail Adresin" type="email" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Yorumun</label>
                                            <textarea class="form-control input-msg required-field" id="message" name="comment" placeholder="Yorumun" rows="10" required=""></textarea>
                                        </div>
                                    </div><!-- Col end -->
                                </div><!-- Form row end -->
                                <div class="clearfix">
                                    <button class="comments-btn btn btn-primary" type="submit">Yorumunu Paylaş</button>
                                </div>
                            </form><!-- Form end -->
                        </div><!-- comment form end -->
                    </div>
                </div><!-- single-post end -->
            </div><!-- col-lg-8 -->
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

        </div><!-- row end -->
    </div><!-- container end -->
</section><!-- category-layout end -->

<?php include_once 'template/static/footer.php';?>
