@extends('app/theme')
@section('content')

  
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-6">
        <div class="card card-stats">
          <div class="card-header card-header-warning card-header-icon">
            <div class="card-icon">
              <i class="material-icons">group</i>
            </div>
            <p class="card-category">Customer</p>
            <h3 class="card-title">
              @php
                  $konek = mysqli_connect("localhost","root","","ls");
                  $jml    = mysqli_query($konek,"select count(id_customer) from customer");
                  while($i=mysqli_fetch_row($jml)){
                    echo $i[0];
                  }
              @endphp
            </h3>
          </div>
          <div class="card-footer">
            <div class="stats">
                <i class="material-icons">table_chart</i>Lihat detail
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-6">
        <div class="card card-stats">
          <div class="card-header card-header-success card-header-icon">
            <div class="card-icon">
              <i class="material-icons">store</i>
            </div>
            <p class="card-category">Balance</p>
            <h4 class="card-title">
              @php
              $budget    = mysqli_query($konek,"select * from budget");
              while($a=mysqli_fetch_array($budget)){
                echo "Rp " . number_format($a['balance'],2,',','.');
              }
              @endphp
            </h4>
          </div>
          <div class="card-footer">
            <div class="stats">
              <i class="material-icons">date_range</i>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-6">
        <div class="card card-stats">
          <div class="card-header card-header-danger card-header-icon">
            <div class="card-icon">
              <i class="material-icons">table_chart</i>
            </div>
            <p class="card-category">Produk</p>
            <h3 class="card-title">
              @php
                  $produk = mysqli_query($konek,"select count(id_pembelian) from pembelian");
                  while($b = mysqli_fetch_array($produk)){
                    echo $b[0];
                  }
              @endphp
            </h3>
          </div>
          <div class="card-footer">
            <div class="stats">
              <i class="material-icons">local_offer</i>Lihat Detail
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
@endsection