<?php

require_once 'vendor/autoload.php';
require_once 'controller/database.php';

if($_GET['p']){
    switch ($_GET['p']) {
        case 'work':
            $id 	= $_POST['commentid'];
            $isim 	= $_POST['name'];
            $email	= $_POST['email'];
            $yorum 	= $_POST['comment'];

            $data 	= [
                'isim'				=> $isim,
                'icerik_id'			=> $id,
                'eposta'			=> $email,
                'yorum'				=> $yorum,
                'onay'				=> 0,
                'eklenme_tarihi'	=> date('Y-m-d H:i:s'),
                'onaylanma_tarihi'	=>date('Y-m-d H:i:s'),
            ];
            $r = $db->table('yorum')->insert($data);
            if($r){
                $e = ['status'=>'success'];
            }else{
                $e = ['status'=>'failed'];
            }

            print_r(json_encode($e, TRUE));
            break;
    }
}
