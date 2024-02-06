<?php

namespace App\Http\Controllers;

use App\Models\autoevaluacion;
use App\Models\examen_respuestas;
use App\Models\nivelacion;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class AutoevaluacionController extends Controller{
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function getEvaluacion($idRegistro): Factory| View| Application {
        try {
            $examen = DB::table('examen')->get();
            $evaluacion = DB::table('autoevaluacion')->where('idRegistro','=', $idRegistro)->get();

            $examenRespuestas = [];
            for($i=0; $i<$examen->count() ;$i++) {
                $respuesta = new examen_respuestas();
                $respuesta->idExamen=$examen[$i]->id;
                $respuesta->pregunta=$examen[$i]->pregunta;
                if ($evaluacion->count() > 0)
                    $respuesta->valor=$evaluacion[$i]->respuesta;
                $examenRespuestas[] = $respuesta;
            }
            return view('licencias/autoevaluacion/form', ['idRegistro'=>$idRegistro,
                'examenRespuestas'=>$examenRespuestas]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function enviarExamen(Request $request) : JsonResponse {
        try {
            $iterador = 0;
            $idPregunta = 1;
            $idRegistro = 0;
            $resultado = 0;
            foreach ($request->all() as $pregunta) {
                if ($iterador == 1)
                    $idRegistro = $pregunta;
                if ($iterador >= 2) {
                    $newPregunta = array(
                        'idPregunta' => $idPregunta,
                        'respuesta' => $pregunta,
                        'idRegistro' => $idRegistro
                    );
                    DB::table('autoevaluacion')->insert($newPregunta);
                    $idPregunta++;
                }
                $iterador++;
            }
            $examen = DB::table('examen')->get();
            $evaluacion = DB::table('autoevaluacion')->where('idRegistro','=', $idRegistro)->get();
            for ($i = 0; $i < $examen->count(); $i++) {
                if ($examen[$i]->resultado != 'N') {
                    if ($evaluacion[$i]->respuesta == $examen[$i]->resultado)
                        $resultado++;
                    else
                        $resultado--;
                }
            }
            $nivelacion = array(
                'tomoExamen'=>true,
                'resultado'=>$resultado,
                'idRegistro' => $idRegistro
            );
            DB::table('nivelacion')->insert($nivelacion);
            return response()->json(array('success' => true, 'resultado'=> $resultado), 200);
        }
        catch (Exception $exception) {
            return response()->json(array('success' => false, 'error' => $exception->getMessage()), 500);
        }
    }
}
