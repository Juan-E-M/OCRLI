<?php

namespace App\Http\Controllers;

use App\Models\ejecucion_planificacion;
use App\Models\nivelacion;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NivelacionController extends Controller{

    public function __construct() {
        $this->middleware('auth');
    }
    /*
     * Index
     */
    public function obtenerNivelacion($idRegistro): Factory| View| Application {
        try {
            $nivelacion = nivelacion::where('idRegistro','=', $idRegistro)->get()->first();
            $cbcrs = DB::table('factor')->get();
            return view('licencias/form_nivelacion', ['nivelacion'=>$nivelacion, 'idRegistro'=>$idRegistro,
                'cbcrs'=>$cbcrs]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /*
    * View registro
    */
    public function guardarFase1(Request $request) {
        try {
            $newFase3 = array(
                'idDimension'=>$request->idDimension,
                'idFactor'=>$request->idFactor,
                'idEstandar'=>$request->idEstandar,
                'idCriterioEvaluacion'=>$request->idCriterioEvaluacion,
                'resultado'=>$request->resultado,
                'idRegistro' => $request->idRegistro
            );
            $id = DB::table('ejecucion_planificacion')->insertGetId($newFase3);
            return response()->json(array('success' => true, 'idRegistro' => $id), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /*
    * View registro
    */
    public function actualizarFase1(Request $request) {
        try {
            $updateFase3 = array(
                'idDimension'=>$request->idDimension,
                'idFactor'=>$request->idFactor,
                'idEstandar'=>$request->idEstandar,
                'idCriterioEvaluacion'=>$request->idCriterioEvaluacion,
                'resultado'=>$request->resultado
            );
            ejecucion_planificacion::whereId('idRegistro', $request->idNivelacion)->update($updateFase3);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
