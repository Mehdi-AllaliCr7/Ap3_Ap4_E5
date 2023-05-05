<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lieu extends Model
{
    use HasFactory;

    protected $table = "Lieu";
    protected $primaryKey = "idLieu";
    public $timestamp = "false";
    protected $fillable = ['nomLieu'];

    public function Evenement(){
        return $this->hasMany('App\Models\Evenement',  'idLieu');
    }


}
