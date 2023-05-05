@extends('template')

@section('content')

<h1>{{$Un_EntrainementJoueur->seance}} </h1>
<ul>
    <li>{{$Un_EntrainementJoueur->dateCalendrier}}</li>
    <li>{{$Un_EntrainementJoueur->heureCalendrier}}</li>
</ul>


@endsection