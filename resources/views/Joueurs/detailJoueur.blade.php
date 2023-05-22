@extends('template')

@section('content')

<h1>{{$Un_Joueur->nomAdherent}}  </h1>
<ul>
    <li>{{$Un_Entrainement->dateCalendrier}}</li>
    <li>{{$Un_Entrainement->heureCalendrier}}</li>
    
    
</ul>


@endsection