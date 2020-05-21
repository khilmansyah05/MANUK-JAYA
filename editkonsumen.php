<?php
include "koneksi_ip.php";
if (isset($_GET['id'])) {
$username = $_GET['id'];
} else {
die ("Error. No Id Selected! ");
}
$query = "SELECT * FROM konsumen WHERE username='$username'";
$sql = mysqli_query ($conn,$query);
$hasil = mysqli_fetch_array ($sql);
$username = $hasil['username'];
$password = $hasil['password'];

//proses edit konsumen
if (isset($_POST['Edit'])) {
	$username = $_POST['husername'];
	$password = $_POST['password'];
	
//update konsumen
$query = "UPDATE konsumen SET username='$username', password=MD5('$password') WHERE username='$username'";
$sql = mysqli_query ($conn,$query);
if ($sql) {
	echo "<h2><font color=blue>konsumen telah berhasil diedit</font></h2>";
} else {
	echo "<h2><font color=red>konsumen gagal diedit</font></h2>";
}
echo "<meta http-equiv='refresh' content='0;URL=index_admin.php?page=displaykonsumen'>";
}
if (isset($_POST['Reset'])) {
echo "<meta http-equiv='refresh' content='0;URL=index_admin.php?page=displaykonsumen'>";
}
?>
<html>
<head><title>Edit  konsumen</title>
</head>
<body>
<FORM ACTION="" METHOD="POST" NAME="input">
<table cellpadding="0" cellspacing="0" border="0" width="700">
<tr>
<td align="center" colspan="2"><h2>Update konsumen</h2></td>
</tr>
<tr>
<td width="200">Username</td>
<td>: <?php echo $username ?></td>
</tr>
<tr>
<td>Password</td>
<td>: <input type="password" name="password" size="32" value=""></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;&nbsp;
<input type="hidden" name="husername" value="<?=$username?>">
<input type="submit" name="Edit" value="Edit konsumen">&nbsp;
<input type="submit" name="Reset" value="Cancel"></td>
</tr>
</table>
</FORM>
</body>
</html>
