<?php
date_default_timezone_set('Asia/Jakarta');
	include "koneksi_ip.php"
?>
<HTML>
<HEAD>
<TITLE>Menampilkan Daftar Detail Penjualan</TITLE>

</HEAD>
<BODY>
<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Transactions</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index_admin.php">Home</a></li>
						<li><i class="fa fa-laptop"></i>Detail Penjualan</li>						  	
					</ol>
				</div>
			</div>              
			  <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Daftar Detail Penjualan
                          </header>
                          <form name="cari" method="POST">
							Tanggal : <input type="date" name="tgl1" > s/d <input type="date" name="tgl2">
							<input type="submit" name="cari" value="cari">
						  </form>
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> No. Nota</th>
                                 <th><i class="icon_mail_alt"></i> Kode</th>
                                 <th><i class="icon_mail_alt"></i> Nama Produk</th>
                                 <th><i class="icon_mobile"></i> Harga</th>
                                 <th><i class="icon_mobile"></i> Qty</th>
								 <th><i class="icon_mobile"></i> Total Harga</th>
								 <th><i class="icon_calendar"></i> Tanggal</th>
                              </tr>



<?php
if(isset($_POST["cari"]))
{	//date('Y-m-d', strtotime($tanggal))
	$tgl1=date('Y-m-d',strtotime($_POST["tgl1"]));
	$tgl2=date('Y-m-d',strtotime($_POST["tgl2"]));
	//echo "$tgl1";
	$query = "SELECT * FROM detailjual d, jual j, produk p where date(tanggal)>=date('$tgl1') and date(tanggal)<=date('$tgl2') and d.no_nota=j.no_nota and d.kode=p.kode order by d.no_nota asc, d.kode asc";
	if($tgl1=="1970-01-01")
	{
		$query = "SELECT * FROM detailjual d, jual j, produk p where d.no_nota=j.no_nota and d.kode=p.kode order by d.no_nota asc, d.kode asc";
	}
}
else
{
    $query = "SELECT * FROM detailjual d, jual j, produk p where d.no_nota=j.no_nota and d.kode=p.kode order by d.no_nota asc, d.kode asc";
}
  $sql = mysqli_query ($conn,$query);
  //echo "<a href='tambahbarang.php'>Add</a>";
 	while ($hasil = mysqli_fetch_array ($sql)) {
		$no_nota = $hasil['no_nota'];
		$kode = $hasil['kode'];
		$nama = $hasil['nama'];
		$harga = $hasil['harga'];
		$qty = $hasil['jumlah'];
		$total_harga = $hasil['total_harga'];
		$tanggal = $hasil['tanggal'];
	//tampilkan barang
		echo "<tr>
		<td align='center'>$no_nota</td>
		<td align='left' >$kode</td>
		<td align='left'>$nama</td>
		<td align='right'>$harga</td>
		<td align='right'>$qty</td>
		<td align='right'>$total_harga</td>
		<td align='right'>$tanggal</td>";
		?>
            	</tr>
	        <?php } ?>
		</tbody>
                        </table>
                      </section>
                  </div>
              </div>
		
		
</BODY>
</HTML>
