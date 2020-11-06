<?php

$inp            = file_get_contents('../configdate.json');
$tempArray      = json_decode($inp, true);
print_r($tempArray);

$dbname = "";
$dbuser = "";
$dbpass = "";
define('db_name', $dbname);
define('db_user', $dbuser);
define('db_pass', $dbpass);