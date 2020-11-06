<?php
include_once './config.php';
$config = [
    'host'		=> 'localhost',
    'driver'	=> 'mysql',
    'database'	=> db_name,
    'username'	=> db_user,
    'password'	=> db_pass,
    'charset'	=> 'utf8',
    'collation'	=> 'utf8_general_ci',
    'prefix'	 => ''
];

$db = new \Buki\Pdox($config);
