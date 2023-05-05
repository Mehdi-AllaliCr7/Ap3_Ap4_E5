@extends('template')

@section('content')
<div class="container">
    <div class="row" style="margin:20px;">
        <div class="col-12 ">
            <div class="card">
                <div class="card-header text-dark">
                    <h2>Liste des Entrainements</h2>
                </div>
                <br>
                <div class="card-body">
                    <a class="btn btn-outline-dark" href="{{route('entrainements.create')}}">Ajouter un nouvel entrainement</a> 
                </div>
                <br>
                <div class="table-responsive">
                            <table class="table text-dark">
                            <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Seance</th>
                                        <th>Date</th>
                                        <th>Heure</th>
                                        <th>categorie</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        @foreach ($Les_Entrainements as $e)
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
                                {{$e->categorie->nomCategorie}}
                                </td>
                                <td>
                                <a href="{{route('entrainements.show',$e->idCalendrier)}}" class="btn btn-outline-dark"> detail </a>
                                <a class="btn btn-primary" href="{{ route('entrainements.edit',$e->idCalendrier) }}">Modifier</a>
                                <form style="display:inline" action="{{route('entrainements.destroy', $e->idCalendrier)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger"> Supprimer</button>

                    </form>
                                </td>
                            </tr>
                        @endforeach

                    <!-- <div><p> entrainement : <a href="{{route('entrainements.show',$e->idCalendrier)}}">   
                        {{$e->seance}} </a> <br> 
                        {{$e->dateCalendrier}} 
                         {{$e->heureCalendrier}} 
                         {{$e->categorie->nomCategorie}}</p> 
                    </div> 
                    </div>  
                
                    <a class="btn btn-primary" href="{{ route('entrainements.edit',$e->idCalendrier) }}">Modifier</a>

                

                    <form action="{{route('entrainements.destroy', $e->idCalendrier)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger"> Supprimer</button>

                    </form>
                    </td>
                    </tr>
                    <br><br><br>

                
            </div> -->
        </div>
    </div>
</div>

</tbody>
@endsection