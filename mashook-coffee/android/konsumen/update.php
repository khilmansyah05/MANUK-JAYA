<?php
include_once "koneksi.php";

class usr{}
$xuser = $_POST["xuser"];
$username = $_POST["username"];
$password = $_POST["password"];
$confirm_password = $_POST["confirm_password"];

if ((empty($username))) {
 	$response = new usr();
 	$response->success = 0;
 	$response->message = "Kolom username tidak boleh kosong";
 	die(json_encode($response));
} else if ((empty($password))) {
 	$response = new usr();
 	$response->success = 0;
 	$response->message = "Kolom password tidak boleh kosong";
 	die(json_encode($response));
} else if ((empty($confirm_password)) || $password != $confirm_password) {
 	$response = new usr();
 	$response->success = 0;
 	$response->message = "Konfirmasi password tidak sama";
 	die(json_encode($response));
} else {
	if (!empty($username) && $password == $confirm_password){
 		$num_rows = mysqli_num_rows(mysqli_query($con, "SELECT * FROM konsumen WHERE username='".$username."'"));

 		if ($num_rows == 0 || $xuser == $username){
 			$query = mysqli_query($con, "UPDATE konsumen SET username='$username',password=md5('$password') WHERE username='$xuser'");

 			if ($query){
 				$response = new usr();
 				$response->success = 1;
 				$response->message = "Username & Password berhasil diperbarui";
 				die(json_encode($response));

 			} else {
 				$response = new usr();
 				$response->success = 0;
 				$response->message = "Username sudah ada";
 				die(json_encode($response));
 			}
 		} else {
 			$response = new usr();
 			$response->success = 0;
 			$response->message = "Username sudah ada";
 			die(json_encode($response));
 		}
 	}
}

mysqli_close($con);

?>	