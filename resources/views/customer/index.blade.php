@extends('app/theme')
@section('content')
    <div class="content">
        <a href="{{ route('customer.create') }}"><button class="btn btn-success">
            + tambah data customer
        </button>
        </a>
        <input type="hidden" value="{{ $no = 1 }}">
        <br><br><br>
        <table class="table" style="width:100%" id="customer">
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
    
@endsection
