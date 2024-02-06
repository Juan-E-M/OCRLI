<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Exception;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'telefono' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }

    /**
     * @return JsonResponse
     */
    public function registrarUsuario(): JsonResponse {
        try {
            /*$usuario = [
                'name' => request()['nombres'],
                'email' => request()['email'],
                'password' => request()['contrasenia'],
                'telefono' => request()['telefono'],
                'esAdmin' => request()['esAdmin'],
                'cambioPassword' => 0,
            ];
            //$this->validator($usuario);
            $this->create($usuario);*/
            
            $user = new user();
            $user->name = request()['nombres'];
            $user->email = request()['email'];
            $user->password = Hash::make(request()['contrasenia']);
            $user->telefono = request()['telefono'];
            $user->esAdmin = request()['esAdmin'];
            $user->save();
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
