<?php

namespace App\Http\Controllers;

use App\Models\autoevaluacion;
use App\Models\brecha_criterio;
use App\Models\brechas_planificacion;
use App\Models\ejecucion_planificacion;
use App\Models\equipo_humano;
use App\Models\examen_respuestas;
use App\Models\medio_criterio;
use App\Models\nivelacion;
use App\Models\registro;
use Exception;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;

class LicenciaController extends Controller {

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Retorna la grilla de licencias
     * @return Factory|View|Application
     */
    public function index(): Factory| View| Application {
        try {
            $licencias = registro::all();
            return view('licencias/licencia_table', ['licencias'=> $licencias]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Retorna el formulario principal
     * @return Factory|View|Application
     */
    public function obtenerFormTabs(): Factory| View| Application {
        try {
            return view('licencias/licencia_index', ['idRegistro'=> 0]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Retorna el formulario principal con la licencia ingresada
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function continuarRegistro($idRegistro): Factory| View| Application {
        try {
            return view('licencias/licencia_index', ['idRegistro'=> $idRegistro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Retorna el formulario principal con la licencia ingresada
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function editar($idRegistro): Factory| View| Application {
        try {
            return view('licencias/licencia_index', ['idRegistro'=> $idRegistro]);
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }

    /**
     * Retorna el formulario principal con la licencia ingresada
     * @param $idRegistro
     * @return Factory|View|Application
     */
    public function eliminar($idRegistro): Factory| View| Application {
        try {
            autoevaluacion::whereId($idRegistro)->delete();
            brecha_criterio::whereId($idRegistro)->delete();
            brechas_planificacion::whereId($idRegistro)->delete();
            ejecucion_planificacion::whereId($idRegistro)->delete();
            equipo_humano::whereId($idRegistro)->delete();
            medio_criterio::whereId($idRegistro)->delete();
            nivelacion::whereId($idRegistro)->delete();
            registro::whereId($idRegistro)->delete();
            return view('licencias/licencia_index');
        }
        catch (Exception $exception) {
            return view('error', ['error' => $exception->getMessage()]);
        }
    }
}
