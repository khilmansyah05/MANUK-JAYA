<?php
include "koneksi_ip.php";
if (isset($_GET['id'])) {
$kode = $_GET['id'];
} else {
die ("Error. NO Id Selected! ");
}
?>
<html>
<head><title>Delete Produk</title>
</head>
<body>

<?php
//proses delete produk
if (!empty($kode) && $kode != "") {
$getdata = mysqli_query($conn,"SELECT * FROM produk WHERE kode ='$kode'");
$row = mysqli_fetch_array($getdata);
$query = "DELETE FROM produk WHERE kode='$kode'";
$sql = mysqli_query ($conn,$query);
if ($sql) {
echo "<h2><font color=blue>Produk telah berhasil dihapus</font></h2>";
if(is_file("android/produk/img/$row[gambar]")) {
	unlink("android/produk/img/$row[gambar]");
}
} else {
echo "<h2><font color=red>Produk gagal dihapus</font></h2>";
}
echo "Klik <a href='index_admin.php?page=displayproduk'>di sini</a> untuk kembali ke halaman display produk";
} else {
die ("Access Denied");
}
?>
</body>
</html>