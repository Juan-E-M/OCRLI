<?php

namespace App\Http\Controllers;

use App\Models\brecha_criterio;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BrechaCriterioController extends Controller {

    /**
    * Constructor
    */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     *
     * @param $idRegistro
     * @return object|null
     */
    public function obtenerBrechaCriterios($idRegistro): ?object {
        try {
            return DB::table('brecha_criterio')->where('idRegistro', '=', $idRegistro)
                ->where('idNivelBrecha', '!=',1)
                ->join('medio', 'medio.id', '=', 'brecha_criterio.idCriterio')
                ->join('criterio', 'criterio.id', '=', 'medio.id_criterio')
                ->select('brecha_criterio.id AS id',
                    'medio.id AS idCriterio',
                    'medio.detalle AS detalleM',
                    'criterio.detalle AS detalleC')
                ->get();
        }
        catch (Exception $exception) {
            return null;
        }
    }

    /**
     * Registra los datos de una institucion que se acreditara
     * @param Request $request
     * @return JsonResponse
     */
    public function registrarBrechaCriterio(Request $request): JsonResponse {
        try {
            $criterio = DB::table('brecha_criterio')
                ->where('idCriterio', '=', $request->idMedio)
                ->where('idRegistro', '=', $request->idRegistro)->get()->first();

            $brechaCriterio = array(
                'idCriterio'=>$request->idMedio,
                'idNivelBrecha'=>$request->idNivelBrecha,
                'idRegistro'=>$request->idRegistro
            );
            if (empty($criterio))
                DB::table('brecha_criterio')->insert($brechaCriterio);
            else
                brecha_criterio::whereId($criterio->id)->update($brechaCriterio);
            //
            // CALCULAR
            //
            $mediosBase = DB::table('medio')
                ->where('id_criterio', '=', $request->idCriterio)
                ->count();
            $mediosTotales = $mediosBase + DB::table('medio_criterio')
                    ->where('idRegistro', '=', $request->idRegistro)
                    ->where('idCriterio', '=', $request->idCriterio)
                    ->count();
            $mediosMarcados = DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->count();
            // COUNTS
            $medios_completos =  DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->where('brecha_criterio.idNivelBrecha', '=', 1)
                ->count();

            $medios_25 = DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->where('brecha_criterio.idNivelBrecha', '=', 2)
                ->count();

            $medios_50 = DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->where('brecha_criterio.idNivelBrecha', '=', 3)
                ->count();

            $medios_75 = DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->where('brecha_criterio.idNivelBrecha', '=', 4)
                ->count();

            $medios_99 =  DB::table('brecha_criterio')
                ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                ->where('medio.id_criterio', '=', $request->idCriterio)
                ->where('brecha_criterio.idRegistro', '=', $request->idRegistro)
                ->where('brecha_criterio.idNivelBrecha', '=', 5)
                ->count();
                
            $brechaPorc = number_format(($medios_completos/$mediosTotales) * 100, 2, '.', '');

            return response()->json(array('success' => true, 'mediosTotales' => $mediosTotales,
                'mediosMarcados'=>$mediosMarcados, 'brechaPorc'=>$brechaPorc, 'medios_completos'=>$medios_completos,
                'medios_25' => $medios_25, 'medios_50'=>$medios_50, 'medios_75' => $medios_75, 'medios_99' => $medios_99), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
    
    public function obtenerResultados($idRegistro, $idCriterio) {
          // CALCULAR
        $mediosBase = DB::table('medio')->where('id_criterio', '=', $idCriterio)
                ->count();

        $mediosTotales = $mediosBase + DB::table('medio_criterio')
                ->where('idRegistro', '=', $idRegistro)
                ->where('idCriterio', '=', $idCriterio)
                ->count();

        $mediosMarcados = DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->count();
        // COUNTS
        $medios_completos =  DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->where('brecha_criterio.idNivelBrecha', '=', 1)
            ->count();

        $medios_25 = DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->where('brecha_criterio.idNivelBrecha', '=', 2)
            ->count();

        $medios_50 = DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->where('brecha_criterio.idNivelBrecha', '=', 3)
            ->count();

        $medios_75 = DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->where('brecha_criterio.idNivelBrecha', '=', 4)
            ->count();

        $medios_99 =  DB::table('brecha_criterio')
            ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
            ->where('medio.id_criterio', '=', $idCriterio)
            ->where('brecha_criterio.idRegistro', '=', $idRegistro)
            ->where('brecha_criterio.idNivelBrecha', '=', 5)
            ->count();

        $brechaPorc = number_format(($medios_completos/$mediosTotales) * 100, 2, '.', '');

        return view('licencias/form_brecha_resultados', ['mediosTotales' => $mediosTotales,
            'mediosMarcados'=>$mediosMarcados, 'brechaPorc'=>$brechaPorc, 'medios_completos'=>$medios_completos,
            'medios_25' => $medios_25, 'medios_50'=>$medios_50, 'medios_75' => $medios_75, 'medios_99' => $medios_99]);
    }
}
