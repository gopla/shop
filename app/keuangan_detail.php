<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class keuangan_detail extends Model
{
    protected $table = "budget_detail";
    protected $primaryKey = "id_budget";

    public function customer(){
        return $this->belongsTo('App\customer','id_customer');
    }

    public function detail(){
        return $this->belongsTo('App\cicilan_detail','id_cicilan');
    }
}
