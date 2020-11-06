<?php

$config = [
    'host'		=> 'localhost',
    'driver'	=> 'mysql',
    'database'	=> 'icnflt_blog',
    'username'	=> 'icnflt_user',
    'password'	=> 'SenolOcak1020**',
    'charset'	=> 'utf8',
    'collation'	=> 'utf8_general_ci',
    'prefix'	 => ''
];

$db = new \Buki\Pdox($config);
