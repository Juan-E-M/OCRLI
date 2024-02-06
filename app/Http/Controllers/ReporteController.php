<?php

namespace App\Http\Controllers;

use App\Models\brechas_planificacion;
use App\Models\ejecucion_planificacion;
use App\Models\equipo_humano;
use App\Models\registro;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReporteController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function obtenerReporteResultados($idRegistro) {
        try {
            $registro = registro::whereId($idRegistro)->get()->first();
            return view('reportes/resultados', ['registro' => $registro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    public function obtenerEquipoHumanoReporte($idRegistro) {
        try {
            $integrantes = equipo_humano::whereId($idRegistro)->get();
            return view('reportes/equipo_humano', ['integrantes' => $integrantes]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    public function obtenerReporteResultadosBrecha($idRegistro) {
        try {
            $brechas = [];
            $criterios = DB::table('criterio')->get();
            foreach ($criterios as $criterio) {
                $mediosRes = [];
                $medios = DB::table('medio')->where('id_criterio', '=', $criterio->id)
                     ->select('id')->get();
                foreach ($medios as $medio) {
                    $mediosRes [] = $medio->id;
                }
                
                $mediosBase = DB::table('medio')->where('id_criterio', '=', $criterio->id)
                    ->count();

                $mediosTotales = $mediosBase + DB::table('medio_criterio')
                    ->where('idRegistro', '=', $idRegistro)
                    ->where('idCriterio', '=', $criterio->id)
                    ->count();

                $mediosMarcados = DB::table('brecha_criterio')
                    ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                    ->where('medio.id_criterio', '=', $criterio->id)
                    ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                    ->count();
                    
                if ($mediosMarcados != 0) {
                    // COUNTS
                    $medios_completos =  DB::table('brecha_criterio')
                        ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                        ->where('medio.id_criterio', '=', $criterio->id)
                        ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                        ->where('brecha_criterio.idNivelBrecha', '=', 1)
                        ->count();
    
                    $medios_25 = DB::table('brecha_criterio')
                        ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                        ->where('medio.id_criterio', '=', $criterio->id)
                        ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                        ->where('brecha_criterio.idNivelBrecha', '=', 2)
                        ->count();
    
                    $medios_50 = DB::table('brecha_criterio')
                        ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                        ->where('medio.id_criterio', '=', $criterio->id)
                        ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                        ->where('brecha_criterio.idNivelBrecha', '=', 3)
                        ->count();
    
                    $medios_75 = DB::table('brecha_criterio')
                        ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                        ->where('medio.id_criterio', '=', $criterio->id)
                        ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                        ->where('brecha_criterio.idNivelBrecha', '=', 4)
                        ->count();
    
                    $medios_99 =  DB::table('brecha_criterio')
                        ->join('medio', 'medio.id', 'brecha_criterio.idCriterio')
                        ->where('medio.id_criterio', '=', $criterio->id)
                        ->where('brecha_criterio.idRegistro', '=', $idRegistro)
                        ->where('brecha_criterio.idNivelBrecha', '=', 5)
                        ->count();
                    
                    $brechaPorc = number_format(100 - (($medios_completos/$mediosTotales) * 100), 2, '.', '');
                    //
                    $nueva_brecha = new reporte_brecha();
                    $nueva_brecha->nombre_criterio = $criterio->detalle;
                    $nueva_brecha->brechaTot = $mediosTotales;
                    $nueva_brecha->brechaMar = $mediosMarcados;
                    $nueva_brecha->brechaPor = $brechaPorc;
                    $nueva_brecha->medios_completos = $medios_completos;
                    $nueva_brecha->medios_25 = $medios_25;
                    $nueva_brecha->medios_50 = $medios_50;
                    $nueva_brecha->medios_75 = $medios_75;
                    $nueva_brecha->medios_99 = $medios_99;
                    //
                    $brechas []= $nueva_brecha;
                }
                
            }
            // CALCULAR

            return view('reportes/brecha', ['brechas' => $brechas]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    public function obtenerPlanOperacionalReporte($idRegistro) {
        try {
            $brechas = [];
            $criterios = (new BrechaCriterioController)->obtenerBrechaCriterios($idRegistro);
            foreach($criterios as $criterio)
            {
                $brechaBD = ejecucion_planificacion::where('idRegistro','=', $idRegistro)
                    ->where('idBrechaCriterio','=', $criterio->id)->get()->first();
                if (!is_null($brechaBD)) {
                    $brecha = new brechas();
                    $brecha->detalleC = $criterio->detalleC;
                    $brecha->detalleM = $criterio->detalleM;
                    $brecha->actividad = $brechaBD->actividad;
                    $brecha->quien = $brechaBD->quien;
                    $brecha->como = $brechaBD->como;
                    $brecha->fechaInicio = $brechaBD->fechaInicio;
                    $brecha->fechaFin = $brechaBD->fechaFin;
                    $brecha->donde = $brechaBD->donde;
                    $brecha->requerimiento = $brechaBD->requerimiento;
                    $brecha->hitoSeguimiento = $brechaBD->hitoSeguimiento;
                    $brecha->entregableHito = $brechaBD->entregableHito;
                    $brechas[] = $brecha;
                }

            }
            return view('reportes/plan_operacional', ['brechas'=>$brechas]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
        
    }

    public function obtenerPlanOperacionalBodyReporte($idRegistro, $idBrechaCriterio) {
        try {
            $brecha = ejecucion_planificacion::where('idRegistro','=', $idRegistro)
                ->where('idBrechaCriterio','=', $idBrechaCriterio)->get()->first();
            return view('reportes/plan_operacional_body', ['brecha'=>$brecha]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }
}
