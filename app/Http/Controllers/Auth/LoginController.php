<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Exception;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    use AuthenticatesUsers;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function getLogin() {
        try {
            if(Auth::check())
                return view('home', ['mostrarPopUp' => 'No']);
            return view('auth/login');
        }
        catch (Exception $exception){
            return view('error', [ 'error' => $exception->getMessage() ]);
        }
    }

    public function login() {
        try {
            $credentials = [
                'email' => request()['username'],
                'password' => request()['password'],
            ];
            if(Auth::attempt($credentials)){
                if (Auth::user()->cambioPassword == 1)
                    return view('home', ['mostrarPopUp' => 'No']);
                return view('home', ['mostrarPopUp' => 'Si']);
            }
            return view('auth/login');
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    public function logout(Request $request) {
        try {
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect()->route('login');
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
