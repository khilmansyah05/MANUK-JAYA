<?php
define('HOSTNAME', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', '');
define('DB_SELECT', 'kopi');
$koneksi = new
mysqli(HOSTNAME,USERNAME,PASSWORD,DB_SELECT) or die
(mysqli_errno());
?>