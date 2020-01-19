@extends('template/app')
@section('content')
    <div class="content">
        <div class="row">
            
            <div class="col-md-12">
                <a href="{{ route('customer.create') }}" class="btn btn-success">
                    <span>
                        <i class="fa fa-plus" aria-hidden="true"></i>
                        Tambah Data Customer
                    </span>
                </a>
            </div>
            
            <div class="col-md-12">
                <div class="card border border-success">
                    <div class="card-header">
                        <strong class="card-title">Data Customer</strong>
                    </div>
                    <div class="card-body">
                        <input type="hidden" value="{{ $no = 1 }}">
                        <table class="table" style="width:100%" id="myTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama</th>
                                    <th>Kontak</th>
                                    <th>Alamat</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($data as $row)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $row->nama }}</td>
                                    <td>{{ $row->kontak }}</td>
                                    <td>{{ $row->alamat }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
@endsection
