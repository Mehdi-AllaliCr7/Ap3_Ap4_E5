@extends('template')
@section('content')
<h1>Modification d'un Joueur</h1><br>

 <form method="post" action="{{route('Joueurs.update', $Un_Joueur->pluck('idAdherent')->first())}}">
@csrf
@method("put")
    <div class="row">
        <div class="col-md-5">
            <div class="form-group row">
                <label for="seance" class="col-sm-6"><h4>Nom </h4></label>
                <input type="text" class="form-control col-sm-6" name="nomAdherent" value="{{$Un_Joueur->pluck('nomAdherent')->first()}}" required>
            </div>

            <div class="form-group row">
                <label for="date" class="col-sm-6"><h4>Prenom</h4></label>
                <input type="text" name="prenomAdherent" value="{{$Un_Joueur->pluck('prenomAdherent')->first()}}">
            </div>

            <div class="form-group row">
                <label for="time" class="col-sm-6"><h4>Age</h4></label>
               
                <input type="date" name="Age" value="{{ $Un_Joueur->pluck('Age')->first() }}"> 
            </div>

            <div class="form-group row">
                <label for="seance" class="col-sm-6"><h4>email </h4></label>
                <input type="text" name="email" value="{{$Un_Joueur->pluck('email')->first()}}" required>
            </div>

            <div class="form-group row">
                <label for="date" class="col-sm-6"><h4>Numero</h4></label>
                <input type="number" name="numero" value="{{$Un_Joueur->pluck('numero')->first()}}">
            </div>


            <div class="form-group row">
                <label for="time" class="col-sm-6"><h4>Poste</h4></label>
                <input type="text" name=poste value="{{$Un_Joueur->pluck('poste')->first()}}"> 
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