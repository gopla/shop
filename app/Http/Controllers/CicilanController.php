<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\cicilan;
use App\cicilan_detail;
class CicilanController extends Controller
{
    public function index(){
        $data = cicilan::all();
        return view('cicilan/index',compact('data'));
    }
    
    public function detail($id){
        $data = cicilan_detail::where('id_cicilan','=',$id)->get();
        return view('cicilan/detail', compact('data'));
    }

}
