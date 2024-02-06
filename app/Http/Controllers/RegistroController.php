<?php

namespace App\Http\Controllers;

use App\Models\equipo_humano;
use App\Models\registro;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RegistroController extends Controller {

    /**
     * Constructor
     */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Retorna la vista de registro de acreditacion
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function getRegistro($idRegistro): Factory| View| Application {
        try {
            $registro = registro::whereId($idRegistro)->get()->first();
            return view('licencias/form_registro', ['registro'=>$registro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Registra los datos de una institucion que se acreditara
     * @param Request $request
     * @return JsonResponse
     */
    public function guardarRegistro(Request $request): JsonResponse {
        try {
            $newRegistro = array(
                'institucion'=>$request->institucion,
                'programa'=>$request->programa,
                'ubicacionGeografica'=>$request->ubicacionGeografica,
                'RUC'=>$request->RUC,
                'paginaWebInstitucion'=>$request->paginaWebInstitucion,
                'paginaWebPrograma'=>$request->paginaWebPrograma,
                'observaciones'=>$request->observaciones,
                'fechaInicio'=>$request->fechaInicio,
                'fechaAutoevaluacion'=>$request->fechaAutoevaluacion,
                'fechaEnvio'=>$request->fechaEnvio,
                'idUsuario'=>Auth::id()
            );
            $id = DB::table('registro')->insertGetId($newRegistro);
            return response()->json(array('success' => true, 'idRegistro' => $id, 'redirect' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /**
     * Actualiz los datos de una institucion que se acreditara
     * @param Request $request
     * @return JsonResponse
     */
    public function actualizarRegistro(Request $request): JsonResponse {
        try {
            $updateRegistro = array(
                'institucion'=>$request->institucion,
                'programa'=>$request->programa,
                'ubicacionGeografica'=>$request->ubicacionGeografica,
                'RUC'=>$request->RUC,
                'paginaWebInstitucion'=>$request->paginaWebInstitucion,
                'paginaWebPrograma'=>$request->paginaWebPrograma,
                'observaciones'=>$request->observaciones,
                'fechaInicio'=>$request->fechaInicio,
                'fechaAutoevaluacion'=>$request->fechaAutoevaluacion,
                'fechaEnvio'=>$request->fechaEnvio
            );
            registro::whereId($request->idRegistro)->update($updateRegistro);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
