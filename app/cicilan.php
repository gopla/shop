<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cicilan extends Model
{
    protected $table = "cicilan";
    protected $primaryKey = "id_cicilan";

    public function customer(){
        return $this->belongsTo('App\customer','id_customer');
    }
}
