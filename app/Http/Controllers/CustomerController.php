<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\customer;
use App\cicilan;
class CustomerController extends Controller
{
    public function index(){
        $data = customer::all();
        return view('customer/index',compact('data'));
    }
    public function create(){
        return view('customer/add_form');
    }
    public function store(Request $request){
        $data = new customer();
        $data->nama = $request->var_name;
        $data->kontak = $request->var_kontak;
        $data->alamat = $request->var_alamat;
        $data->save();
        $id = $data->id_customer;
        $data1 = new cicilan();
        $data1->id_customer = $id;
        $data1->save();

        return redirect()->route('customer.index');
    }
}
