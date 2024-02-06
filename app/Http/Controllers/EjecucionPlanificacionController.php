<?php

namespace App\Http\Controllers;

use App\Models\brechas_planificacion;
use App\Models\ejecucion_planificacion;
use App\Models\nivelacion;
use App\Models\registro;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EjecucionPlanificacionController extends Controller {

    public function __construct() {
        $this->middleware('auth');
    }
    /*
     * Index
     */
    public function obtenerEjecucionOperacional ($idRegistro): Factory| View| Application {
        try {
            $criterios = (new BrechaCriterioController)->obtenerBrechaCriterios($idRegistro);
            return view('licencias/form_ejecucion', ['idRegistro'=>$idRegistro, 'criterios'=>$criterios]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }
    /*
         * Index
         */
    public function obtenerBrechaPorCriterio($idRegistro, $idBrechaCriterio): JsonResponse {
        try {
            $brecha = ejecucion_planificacion::where('idRegistro','=', $idRegistro)
                ->where('idBrechaCriterio','=', $idBrechaCriterio)->get()->first();
            return response()->json(array('success' => true, 'brecha' => $brecha), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
    /*
    * View registro
    */
    public function guardarFase3(Request $request) {
        try {
            $newFase1 = array(
                'idBrechaCriterio'=>$request->idBrechaCriterio,
                'actividad'=>$request->actividad,
                'quien'=>$request->quien,
                'como'=>$request->como,
                'fechaInicio'=>$request->fechaInicio,
                'fechaFin'=>$request->fechaFin,
                'donde'=>$request->donde,
                'requerimiento'=>$request->requerimiento,
                'hitoSeguimiento'=>$request->hitoSeguimiento,
                'entregableHito'=>$request->entregableHito,
                'idRegistro'=>$request->idRegistro
            );
            $id = DB::table('ejecucion_planificacion')->insertGetId($newFase1);
            return response()->json(array('success' => true, 'idRegistro' => $id), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /*
    * View registro
    */
    public function actualizarFase3(Request $request) {
        try {
            $updateFase1 = array(
                'actividad'=>$request->actividad,
                'quien'=>$request->quien,
                'como'=>$request->como,
                'fechaInicio'=>$request->fechaInicio,
                'fechaFin'=>$request->fechaFin,
                'donde'=>$request->donde,
                'requerimiento'=>$request->requerimiento,
                'hitoSeguimiento'=>$request->hitoSeguimiento,
                'entregableHito'=>$request->entregableHito
            );
            ejecucion_planificacion::whereId($request->idEjecucionPlan)->update($updateFase1);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
