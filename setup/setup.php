<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/config.php';
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

$db         = new \Buki\Pdox($config);
$collation  = "utf8_general_ci";
$charset    = "utf8";

$script_path = "../database";
$sql        = $db->query("ALTER DATABASE " . db_name . " CHARACTER SET " . $charset . " COLLATE " . $collation . ";");

echo "<div>Database karakter seti başarıyla güncellendi..</div><br>";

$command = "mysql --user={".db_user."} --password='{".db_pass."}' "
    . "-h {localhost} -D {".db_name."} < {$script_path}";

$output = shell_exec($command . '/blog.sql');

echo "<div>Database için tablolar oluşturuldu..</div><br>";
