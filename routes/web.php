<?php

use App\Http\Controllers\LicenciaController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\AutoevaluacionController;
use App\Http\Controllers\AuxController;
use App\Http\Controllers\BrechaCriterioController;
use App\Http\Controllers\BrechasPlanificacionController;
use App\Http\Controllers\EjecucionPlanificacionController;
use App\Http\Controllers\EquipoHumanoController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MedioCriterioController;
use App\Http\Controllers\NivelacionController;
use App\Http\Controllers\RegistroController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


/*
 *
 * LOGIN
 * */
Route::get('/', [LoginController::class, 'getLogin'])->name('null');
Route::get('login', [LoginController::class, 'getLogin'])->name('getLogin');
Route::post('login', [LoginController::class, 'login'])->name('login');
Route::post('logout', [LoginController::class, 'logout'])->name('logout');


/*
 *
 * HOME
 * */
Route::get('/home', [HomeController::class, 'index'])->name('home');


/*
 *
 * INDEX
 * */
Route::get('licencias', [LicenciaController::class, 'index'])->name('acs.index');
Route::get('licencias/registrar', [LicenciaController::class, 'obtenerFormTabs'])->name('acs.registrar');
Route::get('licencias/registrar/{idRegistro}', [LicenciaController::class, 'continuarRegistro'])
    ->name('licencias.continuarRegistro');
Route::get('licencias/{idRegistro}', [LicenciaController::class, 'editar'])->name('acs.editar');
Route::get('licencias/eliminar/{idRegistro}', [LicenciaController::class, 'eliminar'])->name('acs.eliminar');


/*
 *
 * REGISTRO
 * */
Route::get('getRegistro/{idRegistro}', [RegistroController::class, 'getRegistro'])->name('getRegistro');
Route::post('guardarRegistro', [RegistroController::class, 'guardarRegistro'])->name('guardarRegistro');
Route::post('actualizarRegistro', [RegistroController::class, 'actualizarRegistro'])->name('actualizarRegistro');


/*
 *
 * EQUIPO HUMANO
 * */
Route::get('obtenerEquipoHumano/{idRegistro}', [EquipoHumanoController::class, 'obtenerEquipoHumano'])
    ->name('obtenerEquipoHumano');
Route::post('registrarEquipoHumano', [EquipoHumanoController::class, 'registrarEquipoHumano'])
    ->name('registrarEquipoHumano');
Route::post('actualizarEquipoHumano', [EquipoHumanoController::class, 'actualizarEquipoHumano'])
    ->name('actualizarEquipoHumano');
Route::get('eliminarEquipoHumano/{idRegistro}', [EquipoHumanoController::class, 'eliminarEquipoHumano'])
    ->name('eliminarEquipoHumano');


/*
 *
 * Nivelacion
 * */
Route::get('obtenerNivelacion/{idRegistro}', [NivelacionController::class, 'obtenerNivelacion'])
    ->name('obtenerNivelacion');


/*
 *
 * Planificacion Brechas
 * */
Route::get('obtenerPlanificacionBrechas/{idRegistro}', [BrechasPlanificacionController::class, 'obtenerPlanificacionBrechas'])
    ->name('obtenerPlanificacionBrechas');


/*
 *
 * Ejecucion
 * */
Route::get('obtenerEjecucionOperacional/{idRegistro}', [EjecucionPlanificacionController::class, 'obtenerEjecucionOperacional'])
    ->name('obtenerEjecucionOperacional');
Route::get('obtenerBrechaPorCriterio/{idRegistro}/{idBrechaCriterio}', [EjecucionPlanificacionController::class, 'obtenerBrechaPorCriterio'])
    ->name('obtenerBrechaPorCriterio');
Route::post('guardarEjecucionOperacional', [EjecucionPlanificacionController::class, 'guardarEjecucionOperacional'])
    ->name('guardarEjecucionOperacional');
Route::post('actualizarEjecucionOperacional', [EjecucionPlanificacionController::class, 'actualizarEjecucionOperacional'])
    ->name('actualizarEjecucionOperacional');


/*
 *
 * USUARIOS
 */
Route::get('getUsuarios', [UserController::class, 'getUsuarios'])->name('getUsuarios');
Route::post('registrarUsuario', [UserController::class, 'registrarUsuario'])->name('registrarUsuario');
Route::post('actualizarUsuario', [UserController::class, 'actualizarUsuario'])->name('actualizarUsuario');
Route::post('eliminarUsuario', [UserController::class, 'eliminarUsuario'])->name('eliminarUsuario');
Route::post('actualizarPassword', [ResetPasswordController::class, 'actualizarPassword'])->name('actualizarPassword');


/*
 *
 * AUX
 */
Route::get('getFactores/{idDimension}', [AuxController::class, 'getFactores'])->name('getFactores');
Route::get('getEstandares/{idFactor}', [AuxController::class, 'getEstandares'])->name('getEstandares');
Route::get('getCriterios/{idEstandar}', [AuxController::class, 'getCriterios'])->name('getCriterios');
Route::get('getMedios/{idCriterio}/{idRegistro}', [AuxController::class, 'getMedios'])->name('getMedios');


/*
 *
 * BRECHAS
 */
Route::get('obtenerBrechaCriterios/{idRegistro}', [BrechaCriterioController::class, 'obtenerBrechaCriterios'])
    ->name('obtenerBrechaCriterios');
Route::post('registrarBrechaCriterio', [BrechaCriterioController::class, 'registrarBrechaCriterio'])
    ->name('registrarBrechaCriterio');
Route::get('obtenerBrechaCriteriosEjecucion/{idRegistro}/{id}', [BrechaCriterioController::class, 'obtenerBrechaCriteriosEjecucion'])
    ->name('obtenerBrechaCriteriosEjecucion');
Route::get('obtenerResultados/{idRegistro}/{idCriterio}', [BrechaCriterioController::class, 'obtenerResultados'])
    ->name('obtenerResultados');


/*
 *
 * MEDIOS
 */
Route::get('obtenerMedios/{idRegistro}/{idCriterio}', [MedioCriterioController::class, 'obtenerMedios'])
    ->name('obtenerMedios');
Route::post('registrarMedio', [MedioCriterioController::class, 'registrarMedio'])
    ->name('registrarMedio');
Route::post('actualizarMedio', [MedioCriterioController::class, 'actualizarMedio'])
    ->name('actualizarMedio');
Route::post('eliminarMedio/{idMedio}', [MedioCriterioController::class, 'eliminarMedio'])
    ->name('eliminarMedio');


/*
 *
 * EVALUACION
 */
Route::get('getEvaluacion/{idRegistro}', [AutoevaluacionController::class, 'getEvaluacion'])
    ->name('getEvaluacion');
Route::post('enviarExamen', [AutoevaluacionController::class, 'enviarExamen'])
    ->name('enviarExamen');
    
    
    /*
 *
 * REPORTE
 */
Route::get('obtenerReporteResultados/{idRegistro}', [ReporteController::class, 'obtenerReporteResultados'])
    ->name('obtenerReporteResultados');
Route::get('obtenerEquipoHumanoReporte/{idRegistro}', [ReporteController::class, 'obtenerEquipoHumanoReporte'])
    ->name('obtenerEquipoHumanoReporte');
Route::get('obtenerReporteResultadosBrecha/{idRegistro}', [ReporteController::class, 'obtenerReporteResultadosBrecha'])
    ->name('obtenerReporteResultadosBrecha');
Route::get('obtenerPlanOperacionalReporte/{idRegistro}', [ReporteController::class, 'obtenerPlanOperacionalReporte'])
    ->name('obtenerPlanOperacionalReporte');
Route::get('obtenerPlanOperacionalBodyReporte/{idRegistro}/{idCriterio}', [ReporteController::class, 'obtenerPlanOperacionalBodyReporte'])
    ->name('obtenerReporteResultadosBrecha');
