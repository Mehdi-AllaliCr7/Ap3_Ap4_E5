<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdreDuJour extends Model
{
    use HasFactory;

    protected $table = "OrdreDuJour";
    protected $primaryKey = "idOrdre";
    public $timestamp = "false";
    protected $fillable = ['nomOrdre'];

   

}
