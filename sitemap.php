<?php
ob_start();
header('Content-type: Application/xml; charset="utf8"', true);
require_once 'vendor/autoload.php';
require_once 'controller/database.php';
require_once 'controller/function-forsite.php';
$site = $db->table('site')->where('id', 1)->get();
?>
<urlset
    xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xsi:schemaLocation="
            http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
<?php
    $categories = $db->table('kategori')->getAll();
    foreach ($categories as $category){
?>
    <url>
        <loc><?=$site->url;?>/kategori/<?=$category->url;?>.html</loc>
        <lastmod><?=$category->guncellenme_tarihi;?></lastmod>
        <changefreq>daily</changefreq>
        <priority>1.00</priority>
    </url>
<?php }  ?>
<?php
    $tags = $db->table('etiket')->getAll();
    foreach ($tags as $tag){
?>
    <url>
        <loc><?=$site->url;?>/etiket/<?=$tag->url;?>.html</loc>
        <lastmod><?=$tag->guncellenme_tarihi;?></lastmod>
        <changefreq>daily</changefreq>
        <priority>1.00</priority>
    </url>
<?php }  ?>
<?php
    $pages = $db->table('sayfa')->getAll();
    foreach ($pages as $page){
?>
    <url>
        <loc><?=$site->url;?>/<?=$page->url;?>.html</loc>
        <lastmod><?=$page->guncellenme_tarihi;?></lastmod>
        <changefreq>daily</changefreq>
        <priority>1.00</priority>
    </url>
<?php }  ?>
</urlset>
