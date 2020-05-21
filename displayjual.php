<?php
date_default_timezone_set('Asia/Jakarta');
	include "koneksi_ip.php"
?>
<HTML>
<HEAD>
<TITLE>Menampilkan Daftar Penjualan</TITLE>

</HEAD>
<BODY>
<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Transactions</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index_admin.php">Home</a></li>
						<li><i class="fa fa-laptop"></i>Penjualan</li>						  	
					</ol>
				</div>
			</div>              
			  <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Daftar Penjualan
                          </header>
                          <form name="cari" method="POST">
							Tanggal : <input type="date" name="tgl1" > s/d <input type="date" name="tgl2">
							<input type="submit" name="cari" value="cari">
						  </form>
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> No. Nota</th>
                                 <th><i class="icon_mail_alt"></i> Username</th>
                                 <th><i class="icon_calendar"></i> Tanggal</th>
                                 <th><i class="icon_mobile"></i> Total Biaya</th>
								 <th><i class="icon_mobile"></i> Pembayaran</th>
								 <th><i class="icon_mobile"></i> Kembalian</th>
								 <th><i class="icon_mobile"></i> Bukti Pembayaran</th>
                              </tr>



<?php
if(isset($_POST["cari"]))
{	//date('Y-m-d', strtotime($tanggal))
	$tgl1=date('Y-m-d',strtotime($_POST["tgl1"]));
	$tgl2=date('Y-m-d',strtotime($_POST["tgl2"]));
	//echo "$tgl1";
	$query = "SELECT * FROM jual where date(tanggal)>=date('$tgl1') and date(tanggal)<=date('$tgl2') order by no_nota asc";
	if($tgl1=="1970-01-01")
	{
		$query = "SELECT * FROM jual order by no_nota asc";
	}
}
	else
	{
    $query = "SELECT * FROM jual order by no_nota asc";
	}
  $sql = mysqli_query ($conn,$query);
  //echo "<a href='tambahbarang.php'>Add</a>";
 	while ($hasil = mysqli_fetch_array ($sql)) {
		$no_nota = $hasil['no_nota'];
		$username = $hasil['username'];
		$tanggal = $hasil['tanggal'];
		$total_biaya = $hasil['total_biaya'];
		$pembayaran = $hasil['pembayaran'];
		$kembalian= $hasil['kembalian'];
		$bukti_tf= $hasil['bukti_tf'];
	//tampilkan barang
		echo "<tr>
		<td align='center'>$no_nota</td>
		<td align='left' >$username</td>
		<td align='left'>$tanggal</td>
		<td align='right'>$total_biaya</td>
		<td align='right'>$pembayaran</td>
		<td align='right'>$kembalian</td>";
		if(!is_null($bukti_tf)) {
		echo "<td align='left'><img width='100' height='100' src='android/penjualan/img/$bukti_tf'></td>";
		}
		else {
		    echo "<td></td>";
		}
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
