<?php
include "koneksi_ip.php";
if (isset($_GET['id'])) {
$username = $_GET['id'];
} else {
die ("Error. NO Id Selected! ");
}
?>

<html>
<head><title>Delete Konsumen</title>
</head>
<body>

<?php
//proses delete Konsumen
if (!empty($username) && $username != "") {
$query = "DELETE FROM konsumen WHERE username='$username'";
$sql = mysqli_query ($conn,$query);
if ($sql) {
echo "<h2><font color=blue>Konsumen telah berhasil dihapus</font></h2>";
} else {
echo "<h2><font color=red>Konsumen gagal dihapus</font></h2>";
}
echo "Klik <a href='index_admin.php?page=displaykonsumen'>di sini</a> untuk kembali ke halaman display Konsumen";
} else {
die ("Access Denied");
}
?>
</body>
</html>
