@extends('template/app')
@section('content')
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card border border-primary">
                    <div class="card-header">
                        <strong class="card-title">Data Customer</strong>
                    </div>
                    <div class="card-body">
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
                                <label for="var_alamat">Alamat</label>
                                <textarea type="text" name="var_alamat" class="form-control" id="var_name" placeholder="Alamat Customer"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection