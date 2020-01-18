
             <input type="hidden" value="{{ $no = 1 }}">
            @foreach ($data as $row)
                <tr>
                    <td>{{ "Rp " . number_format($row->bayar,2,',','.') }}</td>
                    <td>{{ date('d F Y', strtotime($row->created_at))}}</td>
                    <td>{{ $no++ }}</td>
                </tr>  
                
            @endforeach