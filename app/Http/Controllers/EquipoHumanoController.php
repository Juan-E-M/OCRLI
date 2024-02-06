<?php

namespace App\Http\Controllers;

use App\Models\equipo_humano;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Type\Integer;

class EquipoHumanoController extends Controller {

    /**
     * Constructor
     */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Retorna la vista de equipo humano de una acreditacion
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function obtenerEquipoHumano($idRegistro): Factory| View| Application {
        try {
            $integrantes = equipo_humano::where('idRegistro', '=', $idRegistro)->get();
            return view('licencias/equipo_humano/table_form', ['integrantes'=> $integrantes, 'idRegistro'=>$idRegistro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Registra un nuevo integrante del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function registrarEquipoHumano(Request $request): JsonResponse {
        try {
            if ($request->integrantes != null){
                foreach ($request->integrantes as $integrante) {
                    $newIntegrante= array(
                        'nombresApellidos'=>$integrante['nombresApellidos'],
                        'cargo'=>$integrante['cargo'],
                        'funcionesPrincipales'=>$integrante['funcionesPrincipales'],
                        'correoElectronico'=>$integrante['correoElectronico'],
                        'numeroCelular'=>$integrante['numeroCelular'],
                        'idRegistro'=>$request->idRegistro,
                    );
                    DB::table('equipo_humano')->insert($newIntegrante);
                }
            }
            else{
                $newIntegrante= array(
                        'nombresApellidos'=>$request->nombresApellidos,
                        'cargo'=>$request->cargo,
                        'funcionesPrincipales'=>$request->funcionesPrincipales,
                        'correoElectronico'=>$request->correoElectronico,
                        'numeroCelular'=>$request->numeroCelular,
                        'idRegistro'=>$request->idRegistro,
                    );
                    DB::table('equipo_humano')->insert($newIntegrante);
            
            }
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /**
     * Actualiza un integrante del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function actualizarEquipoHumano(Request $request): JsonResponse {
        try {
            $updateIntegrante = array(
                'nombresApellidos'=>$request->nombresApellidos,
                'cargo'=>$request->cargo,
                'funcionesPrincipales'=>$request->funcionesPrincipales,
                'correoElectronico'=>$request->correoElectronico,
                'numeroCelular'=>$request->numeroCelular
            );
            equipo_humano::whereId($request->idIntegrante)->update($updateIntegrante);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /**
     * Elimina un integrante del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function eliminarEquipoHumano(Integer $idEquipoHumano): JsonResponse {
        try {
            equipo_humano::whereId($idEquipoHumano)->delete();
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
