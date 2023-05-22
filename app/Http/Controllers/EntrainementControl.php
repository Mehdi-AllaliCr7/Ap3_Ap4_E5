<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CalendrierEntrainement;
use App\Models\Categorie;
use App\Models\Joueur;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;



class entrainementControl extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $Les_Entrainements = CalendrierEntrainement::all();
        //dd($Les_Entrainements);
        
        return view("Entrainements.gestionEntrainements", ['Les_Entrainements'=>$Les_Entrainements]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $lesCategories = Categorie::all();
        return view('Entrainements.createEntrainement', ['lesCategories'=>$lesCategories]); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $e = new CalendrierEntrainement();
        $e -> seance = $request ->input('seance');
        $e -> dateCalendrier = $request ->input('dateCalendrier');
        $e -> heureCalendrier = $request ->input('heureCalendrier');
        $e -> idCategorie = $request ->input('dd');

        $e -> save();    
        return redirect ('entrainements');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $Un_Entrainement = CalendrierEntrainement::find($id);
        $Categorie = $Un_Entrainement ->Categorie;
        //$Joueurs = $Un_Entrainement -> Joueur($id);
        $Les_EntrainementsJoueurs = DB::table('EntrainementsJoueurs')
                           ->join('CalendrierEntrainement', 'EntrainementsJoueurs.idCalendrier', '=', 'CalendrierEntrainement.idCalendrier')
                           ->join('Categorie', 'CalendrierEntrainement.idCategorie', '=', 'Categorie.idCategorie')
                           ->join('Adherent_', 'EntrainementsJoueurs.idAdherent', '=' , 'Adherent_.idAdherent' )
                           ->join('Joueur', 'Adherent_.idAdherent', '=', 'Joueur.idAdherent')
                           ->where('EntrainementsJoueurs.idCalendrier', '=', $id)
                            ->get();
                            //dd($Les_EntrainementsJoueurs);
        return view('Entrainements.detailEntrainement', ['Un_Entrainement'=>$Un_Entrainement], ['Les_Joueurs'=>$Les_EntrainementsJoueurs]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $entrainement = CalendrierEntrainement::find($id);
        $lesCategories = Categorie::all();
        //dd($lesCategories); 
        return view('Entrainements.editEntrainement', compact('entrainement','lesCategories'));
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
        $Entrainement = CalendrierEntrainement::find($id);

        $Entrainement ->seance = $request->input('seance');
        $Entrainement ->dateCalendrier = $request->input('dateCalendrier');
        $Entrainement ->heureCalendrier = $request->input('heureCalendrier');
        $Entrainement->idCategorie = $request->input('Categorie');
//dd($Entrainement);
        $Entrainement->save();
        
        return redirect('entrainements');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Entrainement = CalendrierEntrainement::find($id);
        $Entrainement -> delete();
        return redirect('entrainements');

    }
}
