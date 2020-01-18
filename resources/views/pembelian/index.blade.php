@extends('app/theme')
@section('content')
    <div class="content">    
    <a href="{{ route('pembelian.create') }}">
        <button class="btn btn-success">
        + tambah data pembelian
        </button>
    </a>
        <input type="hidden" value="{{ $no = 1 }}">
        <br><br><br>
        <table class="table" style="width:100%" id="customer">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nama barang</th>
                    <th>Customer</th>
                    <th>Tgl Pembelian</th>
                    <th>Total harga</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($data as $row)
                <tr>
                    <td>{{ $no++ }}</td>
                    <td>{{ $row->nama }}</td>
                    <td>{{ $row->customer->nama }}</td>
                    <td>{{ date('d F Y', strtotime($row->tgl))}}</td>
                    <td>{{  "Rp " . number_format($row->price,2,',','.')  }}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
    
@endsection
