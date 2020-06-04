<?php
include_once('connection.php');
$no_nota = $_POST['no_nota'];
$gambar = $_POST['gambar'];
$now = DateTime::createFromFormat('U.u',microtime(true)); 
$id = $now->format('YmdHisu');

$upload_folder = "img"; 
$path = $upload_folder."/".$id; 
$respose = array();

if (file_put_contents($path, base64_decode($gambar)) != false)
{
$query = "UPDATE jual SET status='1',bukti_tf='$id' WHERE no_nota='$no_nota'";
$exequery = mysqli_query($koneksi,$query);
if($exequery)
{
$respose['code'] =1;
$respose['message'] = "Bukti berhasil diupload";
}
else
{
$respose['code'] =0;
$respose['message'] = "Bukti gagal diupload";
}
echo json_encode($respose);
}
else
{
echo "something wrong";
}

?>