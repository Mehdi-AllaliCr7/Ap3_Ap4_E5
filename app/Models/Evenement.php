<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Evenement extends Model
{
    use HasFactory;
    protected $table = "Evenement_";
    protected $primaryKey = "idEvenement_";
    public $timestamp = "false";
    protected $fillable = ['nomEvenement', 'dateEvenement', 'resultat'];

    public function Adherent(){
        return $this->belongsToMany('App\Models\Evenement', 'Reserver', 'idEvenement_', 'idAdherent');
    }

    public function Categorie(){
        return $this->belongsTo(Lieu::class, 'idLieu');
    }


}
