@extends('template')
@section('content')

@foreach ($Les_Entrainements as $e)
<div>
    <div><p> entrainement : <a href="{{route('entrainementsJoueur.show',$e->idCalendrier)}}">   
        {{$e->seance}} </a> <br> 
        -> {{$e->dateCalendrier}} 
        -> {{$e->heureCalendrier}} 
        -> {{$e->categorie->nomCategorie}}</p> </div> 
</div>

@endforeach
@endsection