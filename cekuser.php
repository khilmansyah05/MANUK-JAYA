<?php
session_start();
include "koneksi_ip.php";
if (isset($_POST['submit'])) {
if (isset($_POST['username'])) {
$userid = $_POST['username'];
$passwd=$_POST['password'];
} else {
die ("Error. No Id Selected! ");
}
if($userid=="")
{
	header("Location:login.php?cannotLogin");
}
else
{ $query = "SELECT * from user WHERE user_id='$userid'";
	$sql = mysqli_query ($conn,$query);
	if($sql)
	{ 	$hasil = mysqli_fetch_array ($sql);
		$username = $hasil['user_id'];
		$userpass = $hasil['password'];
		if($username==$userid && $userpass==MD5($passwd)){
		    $_SESSION['namauser'] = $username;
			header("Location:index_admin.php");
		}
		else
		{	header("Location:login.php?UserPasswordSalah");
		}
	}else{
		header("Location:login.php?CannotLogin");
	}
}
}
else
{header("Location:login.php");
}
?>