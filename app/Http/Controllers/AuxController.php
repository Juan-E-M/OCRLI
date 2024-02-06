<?php

namespace App\Http\Controllers;

use App\Models\registro;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\DB;

class AuxController extends Controller {
    public function getFactores($idDimension) {
        try {
            $factores = DB::table('factor')
                ->where('id_dimension', '=', $idDimension)->get();
            return response()->json(array('success' => true, 'factores' => $factores), 200);
        }
        catch (Exception $exception){
            return response()->json(array('success' => false,
                'error' => $exception->getMessage()), 500);
        }
    }

    public function getEstandares($idFactor) {
        try {
            $estandares = DB::table('estandar')
                ->where('id_factor', '=', $idFactor)->get();
            return response()->json(array('success' => true, 'estandares' => $estandares), 200);
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    public function getCriterios($idEstandar) {
        try {
            $criterios = DB::table('criterio')
                ->where('id_estandar', '=', $idEstandar)->get();
            return response()->json(array('success' => true, 'criterios' => $criterios), 200);
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }

    public function getMedios($idCriterio, $idRegistro) {
       try {
            $rawSql = "(SELECT brecha_criterio.idNivelBrecha FROM brecha_criterio
                                WHERE brecha_criterio.idCriterio = medio.id AND brecha_criterio.idRegistro = :idRegistro) AS nivel";
            $rawSql = str_replace(':idRegistro', $idRegistro, $rawSql);
            $medios = DB::table('medio')
                ->select('medio.id',
                    'medio.detalle',
                    DB::raw($rawSql)
                )
                ->orderBy('medio.id', 'ASC')
                ->where('id_criterio', '=', $idCriterio)->get();

            return response()->json(array('success' => true, 'medios' => $medios), 200);
        }
        catch (Exception $exception){
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
