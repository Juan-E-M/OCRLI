<?php

namespace App\Http\Controllers;

use App\Models\equipo_humano;
use App\Models\medio_criterio;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Type\Integer;

class MedioCriterioController extends Controller{

    /**
     * Constructor
     */
    public function __construct() {
        $this->middleware('auth');
    }
    public function obtenerMedios($idRegistro, $idCriterio): Factory| View| Application {
        try {
            $medios = medio_criterio::where('idRegistro', '=', $idRegistro)
                ->where('idCriterio', '=', $idCriterio)->get();
            return view('licencias/brecha/table_form', ['medios'=> $medios, 'idRegistro'=>$idRegistro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Registra un nuevo Medio del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function registrarMedio(Request $request): JsonResponse {
        try {
            $newMedio= array(
                'idCriterio'=>$request->idCriterio,
                'medio'=>$request->medio,
                'idRegistro'=>$request->idRegistro
            );
            DB::table('medio_criterio')->insert($newMedio);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /**
     * Actualiza un Medio del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function actualizarMedio(Request $request): JsonResponse {
        try {
            $updateMedio = array(
                'medio'=>$request->medio
            );
            medio_criterio::whereId($request->idMedio)->update($updateMedio);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /**
     * Elimina un Medio del equipo humano
     * @param Request $request
     * @return JsonResponse
     */
    public function eliminarMedio($idMedio): JsonResponse {
        try {
            medio_criterio::whereId($idMedio)->delete();
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
