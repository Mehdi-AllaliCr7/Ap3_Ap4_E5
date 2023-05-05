<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Entraineur;
use App\Models\Joueur;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = Auth::user();

        $id= $user->idAdherent;

        if (Entraineur::find($id)){
            return redirect(route('entrainements.index'));
        }
        else if (Joueur::find($id)){
            return redirect(route('entrainementsJoueur.index'));
        }
        else {
            return view('home');
        }
        
    }
}
