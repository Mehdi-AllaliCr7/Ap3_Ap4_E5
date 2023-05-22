
@extends('template')

@section('content')
<div class="container">
    <div class="row" style="margin:20px;">
        <div class="col-12 ">
            <div class="card">
                <div class="card-header text-dark">
                    <h2>Liste des Joueurs</h2>
                </div>
                <br>
               
                <br>
                <div class="table-responsive">
                            <table class="table text-dark">
                            <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nom</th>
                                        <th>Prenom</th>
                                        <th>Age</th>
                                        <th>Email</th>
                                        <th>Numero</th>
                                        <th>poste</th>
                                        <th>Categorie</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 
                        @foreach ($Les_Joueurs as $e)
                            <tr>
                                <td>
                                {{$e->idAdherent}}
                                </td>

                                <td>
                                {{$e->nomAdherent}}
                                </td>
                                <td>
                                {{$e->prenomAdherent}}
                                </td>
                                <td>
                                {{$e->Age}} 
                                </td>
                                <td>
                                {{$e->email}}
                                </td>
                                <td>
                                {{$e->numero}}
                                </td>
                                <td>
                                {{$e->poste}} 
                                </td>
                                <td>
                                {{$e->nomCategorie}}
                                <td>
                                <!-- <a href="{{route('Joueurs.show',$e->idAdherent)}}" class="btn btn-outline-dark"> Detail </a> -->
                                <a class="btn btn-primary" href="{{ route('Joueurs.edit',$e->idAdherent) }}">Modifier</a>                              
                                </td>
                            </tr>
                        @endforeach

            
        </div>
    </div>
</div>

</tbody>
@endsection