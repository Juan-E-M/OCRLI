<?php

namespace App\Http\Controllers;

use App\Models\brechas_planificacion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\DB;

class BrechasPlanificacionController extends Controller {

    /**
     * Constructor
     */
    public function __construct() {
        $this->middleware('auth');
    }

    public function obtenerPlanificacionBrechas($idRegistro): Factory| View| Application {
        try {
            $brecha = brechas_planificacion::where('idRegistro','=', $idRegistro)->get()->first();
            $factores = DB::table('factor')->get();
            $nivelesBrecha = DB::table('nivel_brecha')->get();
            // CALCULAR
            $numeroCriteriosBase = 509;
            $numeroCriterios = $numeroCriteriosBase + DB::table('medio_criterio')
                    ->where('idRegistro', '=', $idRegistro)
                    ->count();

            $numeroMediosCompletos = DB::table('medio')
                    ->join('brecha_criterio', 'brecha_criterio.idCriterio', 'medio.id_criterio')
                    ->where('idRegistro', '=', $idRegistro)
                    ->where('idNivelBrecha', '=', 1)
                    ->select('idCriterio')
                    ->count();

            // COUNTS
            $medios_25 = DB::table('medio')
                ->join('brecha_criterio', 'brecha_criterio.idCriterio', 'medio.id_criterio')
                ->where('idRegistro', '=', $idRegistro)
                ->where('idNivelBrecha', '=', 2)
                ->select('idCriterio')
                ->count();

            $medios_50 = DB::table('medio')
                ->join('brecha_criterio', 'brecha_criterio.idCriterio', 'medio.id_criterio')
                ->where('idRegistro', '=', $idRegistro)
                ->where('idNivelBrecha', '=', 3)
                ->select('idCriterio')
                ->count();

            $medios_75 = DB::table('medio')
                ->join('brecha_criterio', 'brecha_criterio.idCriterio', 'medio.id_criterio')
                ->where('idRegistro', '=', $idRegistro)
                ->where('idNivelBrecha', '=', 4)
                ->select('idCriterio')
                ->count();

            $medios_99 =  DB::table('medio')
                ->join('brecha_criterio', 'brecha_criterio.idCriterio', 'medio.id_criterio')
                ->where('idRegistro', '=', $idRegistro)
                ->where('idNivelBrecha', '=', 5)
                ->select('idCriterio')
                ->count();
            $brechaMar = $numeroMediosCompletos + $medios_25 + $medios_50 + $medios_75 + $medios_99;
            $brechaTot = $numeroCriterios;
            if($brechaMar == 0)
                $brechaPor = 0;
            else
                $brechaPor = number_format((float)($numeroMediosCompletos/$brechaMar) * 100, 2, '.', '');
            return view('licencias/form_brecha', ['brecha'=>$brecha, 'idRegistro'=>$idRegistro,
                'factores'=>$factores, 'nivelesBrecha'=>$nivelesBrecha, 'brechaTot' => $brechaTot,
                'brechaMar'=>$brechaMar, 'brechaPor'=>$brechaPor, 'medios_completos'=>$numeroMediosCompletos,
                'medios_25' => $medios_25, 'medios_50'=>$medios_50, 'medios_75' => $medios_75, 'medios_99' => $medios_99]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }
    /*
   * View registro
   */
    public function guardarFase2(Request $request) {
        try {
            $newFase2 = array(
                'idDimension'=>$request->idDimension,
                'idFactor'=>$request->idFactor,
                'idEstandar'=>$request->idEstandar,
                'idCriterioEvaluacion'=>$request->idCriterioEvaluacion,
                'idMedioSugerido'=>$request->idMedioSugerido,
                'medio'=>$request->medio,
                'identificacionBrecha'=>$request->identificacionBrecha,
                'brecha'=>$request->brecha,
                'idRegistro' => $request->idRegistro
            );
            $id = DB::table('brechas_planificacion')->insertGetId($newFase2);
            return response()->json(array('success' => true, 'idRegistro' => $id), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    /*
    * View registro
    */
    public function actualizarFase2(Request $request) {
        try {
            $updateFase2 = array(
                'idDimension'=>$request->idDimension,
                'idFactor'=>$request->idFactor,
                'idEstandar'=>$request->idEstandar,
                'idCriterioEvaluacion'=>$request->idCriterioEvaluacion,
                'idMedioSugerido'=>$request->idMedioSugerido,
                'medio'=>$request->medio,
                'identificacionBrecha'=>$request->identificacionBrecha,
                'brecha'=>$request->brecha
            );
            brechas_planificacion::whereId('idRegistro', $request->idBrecha)->update($updateFase2);
            return response()->json(array('success' => true), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
