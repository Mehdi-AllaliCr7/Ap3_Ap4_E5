<?php

namespace App\Http\Middleware;

use Closure;

class AdherentMiddleware
{
    public function handle($request, Closure $next)
    {
        if ($request->user() && $request->user()->getType() === 'adherent') {
            return $next($request);
        }

        return redirect('/entrainementsJoueurs');
    }
}
