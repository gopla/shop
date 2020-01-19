@extends('template/app')
@section('content')
    <div class="content"> 
        <div class="row">
            <div class="col-md-12">
                <div class="card border border-success">
                    <div class="card-header">
                        <strong class="card-title">Data Cicilan</strong>
                    </div>
                    <div class="card-body">
                        <input type="hidden" value="{{ $no = 1 }}">
                        <table class="table" style="width:100%" id="myTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama</th>
                                    <th>Total Cicilan</th>
                                    <th>Total Bayar</th>
                                    <th>Sisa</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach ($data as $row)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $row->customer->nama }}</td>
                                    <td>{{ "Rp " . number_format($row->total_cicilan,2,',','.') }}</td>
                                    <td>{{ "Rp " . number_format($row->total_bayar,2,',','.') }}</td>
                                    <td>{{ "Rp " . number_format($row->total_cicilan-$row->total_bayar,2,',','.') }}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detailCicilModal"
                                            data-isi="{{ $row->id_cicilan }}" value="{{ $row->customer->nama }}">
                                            Detail
                                        </button>
                                    
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#add"
                                            data-isi="{{ $row->id_cicilan }}">
                                            Bayar
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



        <div class="modal fade" id="detailCicilModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Submit Masukan Paket </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-stripped">
                <thead>
                    <tr>
                    <th>Jml Bayar</th>
                    <th>Tgl Bayar</th>
                    <th>Cicilan Ke</th>
                    </tr>
                </thead>
                <tbody class="de">

                </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            </div>
        </div>
        </div>

        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Masukkan Jumlah Pembayaran</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="{{ route('cicilan_detail.store') }}" method="post">
                    <div class="modal-body">
                            {{ csrf_field() }}
                            <div class="form-group">
                                    <label for="var_bayar">Nominal</label>
                                    <input type="text" name="var_bayar" class="form-control" id="var_bayar" placeholder="Masukkan nominal pembayaran">
                            </div>
                    </div>
                    <div class="modal-footer" id="sikil">
                        <button type="submit" class="btn btn-danger">Submit</button>
                    </div>
                </div>
            </div>
        </div>
@endsection
