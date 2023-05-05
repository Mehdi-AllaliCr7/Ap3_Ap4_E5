<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CalendrierEntrainement extends Model
{
    use HasFactory;
    
    protected $table = "CalendrierEntrainement";
    protected $primaryKey = "idCalendrier";
    public $timestamps = false;
    protected $fillable = ['dateCalendrier', 'heureCalendrier', 'seance', 'idCategorie'];

    public function Adherent(){
        return $this->belongsToMany('App\Models\Adherent', 'Participer', 'idCalendrier', 'idAdherent')
        ->withPivot('absence');
    }

    public function Entraineur(){
        return $this->belongsToMany('App\Models\Entraineur', 'Organiser', 'idCalendrier', 'idAdherent');
    }

    public function Joueur(){
        return $this->hasMany('App\Models\Joueur', 'EntrainementsJoueur', 'idCalendrier', 'idAdherent');
    }

    public function categorie(){
        return $this->belongsTo(CalendrierEntrainement::class, 'idCalendrier');
    }
    
}
