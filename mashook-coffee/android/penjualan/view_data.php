<?php
include_once('connection.php');
class usr{}

$username = $_POST["username"];
$query = "SELECT * FROM jual where username='$username' ORDER BY no_nota DESC limit 1";
$result = mysqli_query($koneksi,$query);
$row = mysqli_fetch_array($result);
while(!empty($row))
{
    $response = new usr();
 	$response->no_nota = $row['no_nota'];
 	$response->tanggal = $row['tanggal'];
 	$response->kembalian = $row['kembalian'];
 	$response->pembayaran = $row['pembayaran'];
 	$response->total_biaya = $row['total_biaya'];
 	$response->status = $row['status'];
 	die(json_encode($response));
}
mysqli_close($koneksi);
?>