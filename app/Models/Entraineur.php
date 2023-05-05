<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Entraineur extends Authenticatable
{
    use HasFactory;

    protected $table = "Entraineur";
    protected $primaryKey = "idAdherent";
    public $timestamp = "false";
    protected $fillable = ['formation', 'tauxHorraire'];

    public function adherent(){
        return $this->hasOne(Adherent_::class, 'idAdherent');
    }

    public function calendrierentrainement(){
        return $this->belongsToMany('App\Models\calendrierEntrainement', 'Organiser', 'idAdherent', 'idCalendrier');
    }

    public function Reunion(){
        return $this->belongsToMany('App\Models\Reunions', 'Plannifier', 'idAdherent', 'idRéunion');
    }
    

    

}
