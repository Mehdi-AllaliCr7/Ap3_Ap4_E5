<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reunions extends Model
{
    use HasFactory;

    protected $table = "Reunions";
    protected $primaryKey = "idReunion";
    public $timestamp = "false";
    protected $fillable = ['objet'];

    public function Entraineur(){
        return $this->belongsToMany('App\Models\Entraineur', 'Plannifier', 'idRéunion', 'idAdherent');
    }

    



}
