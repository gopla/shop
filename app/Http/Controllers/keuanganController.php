<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\keuangan;
use App\keuangan_detail;
class keuanganController extends Controller
{
    public function index(){
        $data   = keuangan::all();
        $data1  = keuangan_detail::all();
        return view('keuangan/index',compact('data','data1'));
    }

    public function detail($id){
        $data = keuangan_detail::where('id_detail','=',$id)->get();
        return view('keuangan/detail', compact('data'));
    }

}
