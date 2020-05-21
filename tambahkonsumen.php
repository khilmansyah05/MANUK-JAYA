<?php
include "koneksi_ip.php";

//proses input konsumen
if (isset($_POST['Edit'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];
	

//insert konsumen
$query = "INSERT INTO konsumen(username,password)
 values('$username',MD5('$password'))";
$sql = mysqli_query ($conn,$query);
if ($sql) {
	echo "<h2><font color=blue>konsumen telah berhasil ditambahkan</font></h2>";
} else {
	echo "<h2><font color=red>konsumen gagal ditambahkan</font></h2>";
}
echo "<meta http-equiv='refresh' content='0;URL=index_admin.php?page=displaykonsumen'>";
}
if (isset($_POST['Reset'])) {
echo "<meta http-equiv='refresh' content='0;URL=index_admin.php?page=displaykonsumen'>";
}
?>

<html>
<head><title>Tambah User</title>
</head>
<body>
<FORM ACTION="" METHOD="POST" NAME="input">
<table cellpadding="0" cellspacing="0" border="0" width="700">
<tr>
<td align="center" colspan="2"><h2>Input User</h2></td>
</tr>
<tr>
<td width="200">Username</td>
<td>: <input type="text" name="username" size="20" value=""></td>
</tr>
<tr>
<td>Password</td>
<td>: <input type="password" name="password" size="20" value=""></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;&nbsp;

<input type="submit" name="Edit" value="Tambah Konsumen">&nbsp;
<input type="submit" name="Reset" value="Cancel"></td>
</tr>
</table>
</FORM>
</body>
</html>
