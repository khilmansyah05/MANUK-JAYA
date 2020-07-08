<?php
	include "koneksi_ip.php"
?>
<HTML>
<HEAD>
<TITLE>Menampilkan Daftar Produk</TITLE>

	
<script language="javascript">
function tanya() {
if (confirm ("Apakah Anda yakin akan menghapus produk ini ????")) {
	return true;
} else {
	return false;
}
}
</script>
</HEAD>
<BODY>
<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Masters</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index_admin.php">Home</a></li>
						<li><i class="fa fa-laptop"></i>Produk</li>						  	
					</ol>
				</div>
			</div>              
			  <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Daftar Produk
                          </header>
                          
                          <table style="table-layout: fixed; border-collapse: collapse; width: 100%;" class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th width='80'><i class="icon_profile"></i> Kode</th>
                                 <th width='140'><i class="icon_mail_alt"></i> Nama Produk</th>
                                 <th width='100'><i class="icon_pin_alt"></i> Harga</th>
                                 <th width='400'><i class="icon_mobile"></i> Deskripsi</th>
								 <th><i class="icon_calendar"></i> Gambar</th>
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>

<?php
    $query = "SELECT * FROM produk order by kode";
  $sql = mysqli_query ($conn,$query);

 	while ($hasil = mysqli_fetch_array ($sql)) {
		$kode = $hasil['kode'];
		$nama = $hasil['nama'];
		$harga = $hasil['harga'];
		$deskripsi = $hasil['deskripsi'];
		$gambar = $hasil['gambar'];
	//tampilkan produk
		echo "<tr>
		<td align='center'>$kode</td>
		<td align='left'>$nama</td>
		<td align='left'>$harga</td>
		<td align='left'>$deskripsi</td>
		<td align='left'><img width='100' height='100' src='android/produk/img/$gambar'></td>";
		?>
		<td>
		                          <div class="btn-group">
                                      <a class="btn btn-primary" href="<?php echo "index_admin.php?page=tambahproduk"?>"><i class="icon_plus_alt2"></i></a>
                                      <a class="btn btn-success" href="<?php echo "index_admin.php?page=editproduk&id=$kode"?>"><i class="icon_check_alt2"></i></a>
                                      <a class="btn btn-danger" onClick='return tanya()' href="<?php echo "index_admin.php?page=hapusproduk&id=$kode"?>"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                              </tr>
	        <?php } ?>
		</tbody>
                        </table>
                      </section>
                  </div>
              </div>
		
		
</BODY>
</HTML>
