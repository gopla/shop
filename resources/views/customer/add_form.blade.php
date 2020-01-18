@extends('app/theme')
@section('content')
    <div class="content">
        <div class="card-body col-md-5">
            <form action="{{ route('customer.store') }}" method="post">
                {{ csrf_field() }}
                <div class="form-group">
                    <label for="var_name">Nama</label>
                    <input type="text" name="var_name" class="form-control" id="var_name" placeholder="Nama Customer">
                </div>
                <div class="form-group">
                    <label for="var_kontak">Kontak</label>
                    <input type="text" name="var_kontak" class="form-control" id="var_name" placeholder="Kontak/no.HP">
                </div>
                <div class="form-group">
                    <label for="var_alamat">Nama</label>
                    <textarea type="text" name="var_alamat" class="form-control" id="var_name" placeholder="Alamat Customer"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
@endsection