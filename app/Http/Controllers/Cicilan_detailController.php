<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\cicilan_detail;
use DB;
use App\cicilan;
use App\keuangan;
use App\keuangan_detail;
class Cicilan_detailController extends Controller
{
    public function store(Request $request){
     
        $data   = new cicilan_detail();
        $data->id_cicilan = $request->var_id;
        $data->bayar = $request->var_bayar;
        $data->save();
        $data1 = cicilan::find($request->var_id);
        $total = DB::table('cicilan_detail')->where('id_cicilan','=',$request->var_id)->sum('bayar');
        $data1->total_bayar = $total;
        $data1->save();   

        $data2 = new keuangan_detail();
        $data2->id_customer = $data1->id_customer;
        $data2->id_cicilan = $request->var_id;
        $data2->total = $request->var_bayar;
        $data2->jenis = "Pemasukan";
        $data2->save();

        $data3 = keuangan::find(1);
        $data3->pemasukan = $data3->pemasukan+$request->var_bayar;
        $data3->balance = $data3->pemasukan - $data3->pengeluaran;
        $data3->save();
        return redirect()->route('cicilan.index');
    }
}
