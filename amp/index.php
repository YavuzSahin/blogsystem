<?php include_once "template/header.php";?>
<?php
$all = $db->table('sayfa')->orderBy('eklenme_tarihi', 'desc')->getAll();
foreach ($all as $single){
?>
<article class="card">
    <a href="<?=$site->url;?>/<?=$single->url;?>.html" title="<?=$single->baslik;?>">
        <amp-img alt="<?=$single->baslik;?>"
                 src="<?=$site->url;?>/upload/resized/<?=$single->resim;?>"
                 width="640"
                 height="457"
                 layout="responsive"
                 srcset="<?=$site->url;?>/upload/resized/<?=$single->resim;?> 640w,
                <?=$site->url;?>/upload/resized/<?=$single->resim;?> 320w">
        </amp-img>
        <h1><?=$single->baslik;?></h1>
        <p><?php echo iconv('latin5','utf-8',strftime(' %d %B %Y ',strtotime(date($single->eklenme_tarihi))));?></p>
    </a>
</article>
<?php } ?>
<?php include_once "template/footer.php";?>

