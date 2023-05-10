<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Adherent_ extends Authenticatable
{
    use HasFactory;

    protected $table = "Adherent_";
    protected $primaryKey = "idAdherent";
    public $timestamps = false;
    protected $fillable = ['nomAdherent', 'prenomAdherent', 'Age', 'email', 'identifiant', 'mot_de_passe','type'];

    public function entraineur(){
        return $this->hasOne('App\Models\Entraineur', 'idAdherent');
    }

    public function joueur(){
        return $this->hasOne('App\Models\Joueur', 'idAdherent');
    }

    public function calendrierEntrainement(){
        return $this->belongsToMany('App\Models\CalendrierEntrainement','Participer','idAdherent', 'idCalendrier');
    }

    public function evenement(){
        return $this->belongsToMany('App\Models\Evenement', 'Reserver', 'idAdherent', 'idEvenement_');
    }

    public function Tarif(){
        return $this->belongsTo(Tarifs::class, 'idTarif');
    }
    
public function getAuthPassword(){
    return $this->mot_de_passe;
}

public function getType()
{
    return $this->attributes['type'];
}

}


