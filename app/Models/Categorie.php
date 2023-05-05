<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categorie extends Model
{
    use HasFactory;

    protected $table = "Categorie";
    protected $primaryKey = "idCategorie";
    public $timestamp = "false";
    protected $fillable = ['nomCategorie'];

    public function joueur(){
        return $this->hasMany('App\Models\Joueur', 'idAdherent');
    }
    
    public function calendrierEntrainement(){
        return $this->hasMany('App\Models\CalendrierEntrainement', 'idCalendrier');
    }
}
