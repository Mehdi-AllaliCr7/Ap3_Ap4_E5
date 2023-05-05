<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Joueur extends Authenticatable
{
    use HasFactory;

    protected $table = "Joueur";
    protected $primaryKey = "idAdherent";
    public $timestamp = "false";
    protected $fillable = ['numero', 'poste'];

    public function adherent(){
        return $this->hasOne(Adherent_::class, 'idAdherent');
    }

    public function categorie(){
        return $this->belongsTo(Categorie::class, 'idCategorie');
    }
    

}
