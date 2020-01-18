@extends('app/theme')
@section('content')
    <div class="content">
        <input type="hidden" value="{{ $no = 1 }}">
        <br><br><br>
        <table class="table" style="width:100%" id="customer">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nama</th>
                    <th>Total Cicilan</th>
                    <th>Total Bayar</th>
                    <th>Sisa</th>
                    <th></th>
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
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                            data-isi="{{ $row->id_cicilan }}" value="{{ $row->customer->nama }}">
                            Detail
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#add"
                            data-isi="{{ $row->id_cicilan }}">
                            Bayar
                        </button>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"aria-hidden="true">
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
        
    </div>

<script>
    $('#exampleModal').on('show.bs.modal', function (e) {
      var button = $(e.relatedTarget)
      var id = button.data('isi')
      var nama = button.val();
      var no = 1;
      $.get('{{ url('detail')}}/' + id,function (data) {
          console.log(id);
          console.log(data);
          $('.de').html(data);
        });
      var modal = $(this)
      modal.find('.modal-title').text('Detail Pembayaran ' + nama)
    })
    $('#add').on('show.bs.modal', function (e) {
        var button = $(e.relatedTarget)
        var id = button.data('isi')
        $('#sikil').append("<input type=hidden name=var_id value="+id+"> </form>");
      })
  </script>
@endsection
