@extends('template')
@section('content')
<h1>Entrainement</h1>


<div class="container">
    <div class="row" style="margin:20px;">
        <div class="col-12 ">
            <div class="card">
                <div class="card-header text-dark">
                    <h2>Liste des Entrainements</h2>
                </div>
               
                <br>
                <div class="table-responsive">
                            <table class="table text-dark">
                            <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Séance</th>
                                        <th>Date</th>
                                        <th>Heure</th>
                                        <th>Categorie</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        @foreach ($Les_EntrainementsJoueurs as $e)
                            <tr>
                                <td>
                                    
                        
                                {{$e->idCalendrier}}
                                </td>

                                <td>
                                {{$e->seance}}
                                </td>
                                <td>
                                {{$e->dateCalendrier}}
                                </td>
                                <td>
                                {{$e->heureCalendrier}} 
                                </td>
                                <td>
                                {{$e->nomCategorie}}
                                </td>
                                <td>      
                                </td>
                            </tr>
                        @endforeach
                   
        </div>
    </div>
</div>

</tbody>
@endsection