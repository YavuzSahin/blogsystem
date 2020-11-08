<?php include_once "template/header.php";?>
<article class="card">
        <amp-img alt="<?=$pageInfo->baslik;?>"
                 src="<?=$site->url;?>/upload/resized/<?=$pageInfo->resim;?>"
                 width="640"
                 height="457"
                 layout="responsive"
                 srcset="<?=$site->url;?>/upload/resized/<?=$pageInfo->resim;?> 640w,
                <?=$site->url;?>/upload/resized/<?=$pageInfo->resim;?> 320w">
        </amp-img>
        <h1><?=$pageInfo->baslik;?></h1>
        <p><?php echo iconv('latin5','utf-8',strftime(' %d %B %Y ',strtotime(date($pageInfo->eklenme_tarihi))));?></p>
        <div class="content">
            <?=$pageInfo->icerik;?>
        </div>
    <div class="tag-lists">
        <span>Etiketler: </span>
        <?php
        $etiketler = explode(',', $pageInfo->etiketler);
        foreach ($etiketler as $etiket){
            echo etiketGetirUrl(str_replace(', ', '', $etiket));
        }
        ?>
    </div><!-- tag lists -->
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
</article>
<?php include_once "template/footer.php";?>

