<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Categorie;

class JoueurController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $Les_Joueurs = DB::table('Adherent_')
        ->join('Joueur', 'Adherent_.idAdherent', '=', 'Joueur.idAdherent')
        ->join('Categorie', 'Joueur.idCategorie', '=', 'Categorie.idCategorie')
        ->get();
                              //dd($Les_Joueurs);
        return view("Joueurs.gestionJoueurs", ['Les_Joueurs'=>$Les_Joueurs]);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Les_Joueurs = DB::table('Adherent_')
        ->join('Joueur', 'Adherent_.idAdherent', '=', 'Joueur.idAdherent')
        ->join('Categorie', 'Joueur.idCategorie', '=', 'Categorie.idCategorie')
        ->where('Adherent_.idAdherent', '=', $id)
        ->get();
                              //dd($Les_Joueurs);
        return view("Joueurs.detailJoueur", ['Un_Joueur'=>$Un_Joueur]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $lesCategories = Categorie::all();
        $Un_Joueur = DB::table('Adherent_')
        ->join('Joueur', 'Adherent_.idAdherent', '=', 'Joueur.idAdherent')
        ->join('Categorie', 'Joueur.idCategorie', '=', 'Categorie.idCategorie')
        ->where('Adherent_.idAdherent', '=', $id)
        ->get();
        //dd($Un_Joueur);
        return view("Joueurs.editJoueur", ['Un_Joueur'=>$Un_Joueur], ['lesCategories'=>$lesCategories]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Joueur = DB::table('Adherent_')
        ->join('Joueur', 'Adherent_.idAdherent', '=', 'Joueur.idAdherent')
        ->join('Categorie', 'Joueur.idCategorie', '=', 'Categorie.idCategorie')
        ->where('Adherent_.idAdherent', '=', $id)
        ->first();
    
    if ($Joueur) {
        DB::table('Adherent_')
            ->where('idAdherent', $Joueur->idAdherent)
            ->update([
                'nomAdherent' => $request->input('nomAdherent'),
                'prenomAdherent' => $request->input('prenomAdherent'),
                'Age' => $request->input('Age'),
                'email' => $request->input('email'),
            ]);
    
        DB::table('Joueur')
            ->where('idAdherent', $Joueur->idAdherent)
            ->update([
                'numero' => $request->input('numero'),
                'poste' => $request->input('poste'),
                'idCategorie' => $request->input('Categorie'),
            ]);
    }
    
    return redirect('Joueurs');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
