@extends('app/theme')
@section('content')
    <div class="content">
        
        <table class="table" style="width:100%">
            <thead>
                <tr>
                    <th>Total Budget</th>
                    <th>Total Pengeluaran</th>
                    <th>Total Pemasukan</th>
                </tr>
            </thead>
            <tbody>
            @foreach ($data as $row)
                <tr>
                    {{--  <td>{{ date('d F Y', strtotime($row->tgl))}}</td>  --}}
                    <td>{{  "Rp " . number_format($row->balance,2,',','.')  }}</td>
                    <td>{{  "Rp " . number_format($row->pengeluaran,2,',','.')  }}</td>
                    <td>{{  "Rp " . number_format($row->pemasukan,2,',','.')  }}</td>
                </tr>
            @endforeach
            </tbody>
        </table><br><br>
        <input type="hidden" value="{{ $no = 1 }}">
        <table class="table" style="width:100%">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Total Budget</th>
                        <th>Jenis</th>
                        <th>Tgl</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                @foreach ($data1 as $row)
                    <tr>
                        <td>{{ $no++}} </td>
                        <td>{{  "Rp " . number_format($row->total,2,',','.')  }}</td>
                        <td>{{  $row->jenis  }}</td>
                        <td>{{ date('d F Y', strtotime($row->created_at))}}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                                data-isi="{{ $row->id_detail }}" value="{{ $row->jenis }}">
                                Detail
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

    </div>
    
<script>
    $('#exampleModal').on('show.bs.modal', function (e) {
      var button = $(e.relatedTarget)
      var id = button.data('isi')
      var nama = button.val();
      var no = 1;
      $.get('{{ url('detail_modal')}}/' + id,function (data) {
          console.log(id);
          console.log(data);
          $('.de').html(data);
        });
      var modal = $(this)
      modal.find('.modal-title').text('Detail Pembayaran ' + nama)
    })
    
  </script>
@endsection
