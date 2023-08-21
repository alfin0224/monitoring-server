<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckRole
{

    // public function handle(Request $request, Closure $next, $role_id)
    // {
    //     if ($request->user()->role_id === $role_id) {
    //         return $next($request);
    //     }


    //     abort(403, 'Acess Denied! '.$role_id);
    // }

    public function handle(Request $request, Closure $next, ...$roles)
    {
        $userRole = $request->user()->role_id;

        // Memeriksa apakah peran pengguna sesuai dengan yang diharapkan
        if (in_array($userRole, $roles)) {
            return $next($request);
        }

        // Jika tidak sesuai, lemparkan error atau redirect
        abort(403, 'Access Denied');
    }
}
