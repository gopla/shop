<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pembelian; 
use App\customer;
use App\cicilan;
use App\keuangan;
use App\keuangan_detail;
use DB;
class PembelianController extends Controller
{
    public function index(){
        $data = pembelian::all();
        return view('pembelian/index',compact('data'));
    }
    public function create(){
        $customer   = customer::pluck('nama','id_customer');
        return view('pembelian/add_form',compact('customer'));
    }
    public function store(Request $request){
        $data = new pembelian();
        $data->id_customer = $request->var_customer;
        $data->nama = $request->var_nama;
        $price = $request->var_cost * 125/100;
        $data->price = $price;
        $data->tgl = $request->var_tgl;
        $data->cost = $request->var_cost;
        $data->save();
        $id = $data->id_pembelian;

        $data1 = cicilan::find($request->var_customer);
        $cicilan = $data1->total_cicilan;
        $total = $price + $cicilan;
        $data1->total_cicilan = $total;
        $data1->save();

        $data2 = new keuangan_detail();
        $data2->id_pembelian = $id;
        $data2->total = $request->var_cost;
        $data2->jenis = "Pengeluaran";
        $data2->id_customer = $request->var_customer;
        $data2->save();
        
        $data3 = keuangan::find(1);
        $spend = $data3->pengeluaran;
        $data3->pengeluaran = $spend + $request->var_cost;
        $data3->balance = $data3->pemasukan - $spend-$request->var_cost;
        $data3->save();

        return redirect()->route('pembelian.index');
    }
}
