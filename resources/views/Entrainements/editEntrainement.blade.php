@extends('template')
@section('content')
<h1>Modification d'un entrainement</h1><br>

 <form method="post" action="{{route('entrainements.update', $entrainement->idCalendrier)}}">
@csrf
@method("put")
    <div class="row">
        <div class="col-md-5">
            <div class="form-group row">
                <label for="seance" class="col-sm-6"><h4>Intitulé de l'entrainement </h4></label>
                <input type="text" class="form-control col-sm-6" name="seance" value="{{$entrainement->seance}}" required>
            </div>

            <div class="form-group row">
                <label for="date" class="col-sm-6"><h4>Date de l'entrainement</h4></label>
                <input type="date" name="dateCalendrier" value="{{$entrainement->dateCalendrier}}">
            </div>

            <div class="form-group row">
                <label for="time" class="col-sm-6"><h4>Heure de l'entrainement</h4></label>
                <input type="time" name=heureCalendrier value="{{$entrainement->heureCalendrier}}"> 
            </div>

            <div class="form-group row">
                <h4 class="col-sm-6">Categorie joueur</h4>

                <select name="Categorie">
                    @foreach ($lesCategories as $c)
                    <option value="{{$c->idCategorie}}">{{$c->nomCategorie}}</option>
                    @endforeach				
                </select><br><br>
            </div>

            <div class="btn"> 
  <button class="btn btn-primary" type="submit" >Envoyer</button>
</div>




        </div>
    </div>


</form>

@endsection