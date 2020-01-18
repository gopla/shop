<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class pembelian extends Model
{
    protected $table = "pembelian";
    protected $primaryKey = "id_pembelian";

    public function detail(){
        return $this->belongsTo('App\pembelian_detail', 'id_pembelian');
    }
    public function customer(){
        return $this->belongsTo('App\customer','id_customer');
    }
}
