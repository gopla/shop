@extends('app/theme')
@section('content')
    <div class="content">
        <div class="card-body col-md-5">
            <form action="{{ route('pembelian.store') }}" method="post">
                {{ csrf_field() }}
                <div class="form-group">
                    <label for="var_cat">Customer</label>
                    <select class="form-control" name="var_customer" required>
                        <option value="">Pilih Customer</option>
                        @foreach ($customer as $id_customer=>$nama)
                        <option value="{{ $id_customer }}">{{ $nama }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="var_nama">Nama Barang</label>
                    <input type="text" name="var_nama" class="form-control" id="var_name" placeholder="Nama Barang" required>
                </div>
                <div class="form-group">
                    <label for="var_tgl">Tgl Pembelian</label>
                    <input type="date" name="var_tgl" class="form-control" id="var_name" placeholder="Nama Barang" required>
                </div>
                <div class="form-group">
                    <label for="var_cost">Harga Beli</label>
                    <input type="text" name="var_cost" class="form-control" id="var_name" placeholder="Harga Beli" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
@endsection