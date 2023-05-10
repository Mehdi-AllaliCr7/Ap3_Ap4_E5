<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
    
});
//Route::middleware(['auth', 'adherent'])->group(function () {    
    Route::resource('entrainements','App\Http\Controllers\EntrainementControl');
//});

Route::resource('entrainementsJoueur','App\Http\Controllers\EntrainementJoueurController');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
