@extends('layouts.app')

@section('content')
<div class="content-grid">
    <div class="card" style="overflow-y: scroll; height: 100%">
        <div class="card-body">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="btn btn-success" onclick="guardarPDF()" id="guardarPDF">
                            <i class="fa fa-file-pdf"></i> <span> Descargar</span>
                        </button>
                    </div>
                    <hr/>
                    <div class="modal-body" style="margin-top: 30px" id="contenidoReporte">
                        <form class="row g-3" method="post" style="margin-bottom: 0">
                            <div class="col-md-3">
                                <img src="{{ asset('img/ocRli.jpg') }}" width="200px" height="70px" alt="LogoReporte">
                            </div>
                            <div class="col-md-6" style="text-align: center; font-size: 20px">
                                <b>REPORTE DE RESULTADOS</b>
                            </div>
                            <div class="col-md-3" style="text-align: right">
                                Autor: Rodrigo Manrique Tejada<br>
                                rodrigomt@entiendepiu.com<br>
                                +51 338742242
                            </div>
                            <hr/>
                            <div class="col-md-12" style="background-color: #B4C6E7; font-size: 15px; padding: 3px">
                                <b>DATOS GENERALES</b>
                            </div>
                            <div class="col-md-6">
                                <label for="institucion" class="form-label">Institucion</label>
                                <input type="text" class="form-control" id="institucion" name="institucion"
                                       value="{{ $registro->institucion }}"
                                       placeholder="Ingresa información">
                            </div>
                            <div class="col-md-6">
                                <label for="programa" class="form-label">Programa</label>
                                <input type="text" class="form-control" id="programa" name="programa"
                                       value="{{ $registro->programa }}"
                                       placeholder="Ingresa información">
                            </div>
                            <div class="col-md-6">
                                <label for="ubicacionGeografica" class="form-label">Ubicación geográfica</label>
                                <input type="text" class="form-control" id="ubicacionGeografica" name="ubicacionGeografica"
                                       value="{{ $registro->ubicacionGeografica }}"
                                       placeholder="Ingresa información">
                            </div>
                            <div class="col-md-6">
                                <label for="RUC" class="form-label">RUC</label>
                                <input type="text" class="form-control" id="RUC" name="RUC"
                                       value="{{ $registro->RUC }}"
                                       placeholder="Ingresa información">
                            </div>
                            <div class="col-md-6">
                                <label for="paginaWebInstitucion" class="form-label">Página web institucion</label>
                                <input type="text" class="form-control" id="paginaWebInstitucion" name="paginaWebInstitucion"
                                       value="{{ $registro->paginaWebInstitucion }}"
                                       placeholder="Ingresa información">
                            </div>
                            <div class="col-md-6">
                                <label for="paginaWebPrograma" class="form-label">Página web programa</label>
                                <input type="text" class="form-control" id="paginaWebPrograma" name="paginaWebPrograma"
                                       value="{{ $registro->paginaWebPrograma }}"
                                       placeholder="Ingresa información">
                            </div>
                            <hr/>
                            <div class="row g-2" id="seccionEquipoHumanoReporte">
                                <script>
                                    $.get('/obtenerEquipoHumanoReporte/' + {{ $registro->id }}, function(response){
                                        $('#seccionEquipoHumanoReporte').html(response);
                                    });
                                </script>
                            </div>
                            <hr/>
                            <div class="col-md-12">
                                <label for="observaciones" class="form-label">Observaciones</label>
                                <textarea class="form-control" id="observaciones" name="observaciones" rows="2"
                                          placeholder="Ingresa información">{{ $registro->observaciones }}</textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="fechaInicio" class="form-label">Fecha inicio</label>
                                <input type="date" class="form-control" id="fechaInicio" name="fechaInicio"
                                       value="{{ $registro->fechaInicio }}" min="1900-01-01" max="2030-12-31"
                                       placeholder="dd-mm-yyyy">
                            </div>
                            <div class="col-md-6">
                                <label for="fechaAutoevaluacion" class="form-label">Fecha autoevaluación</label>
                                <input type="date" class="form-control" id="fechaAutoevaluacion" name="fechaAutoevaluacion"
                                       value="{{ $registro->fechaAutoevaluacion }}" min="1900-01-01" max="2030-12-31"
                                       placeholder="dd-mm-yyyy">
                            </div>
                            <div class="col-md-6">
                                <label for="fechaEnvio" class="form-label">Fecha envío</label>
                                <input type="date" class="form-control" id="fechaEnvio" name="fechaEnvio"
                                       value="{{ $registro->fechaEnvio }}" min="1900-01-01" max="2030-12-31"
                                       placeholder="dd-mm-yyyy">
                            </div>
                            <hr/>
                            <div class="col-md-12" style="background-color: #B4C6E7; font-size: 15px; padding: 3px">
                                <b>DIAGÓSTICO</b>
                            </div>
                            <div class="row g-2" id="seccionBrechaReporte">
                                <script>
                                    $.get('/obtenerReporteResultadosBrecha/' + {{ $registro->id }}, function(response){
                                        $('#seccionBrechaReporte').html(response);
                                    });
                                </script>
                            </div>
                            <hr/>
                            <div class="col-md-12" style="background-color: #B4C6E7; font-size: 15px; padding: 3px">
                                <b>PLAN OPERACIONAL</b>
                            </div>
                            <div class="row g-2" id="seccionPlanReporte">
                                <script>
                                    $.get('/obtenerPlanOperacionalReporte/' + {{ $registro->id }}, function(response){
                                        $('#seccionPlanReporte').html(response);
                                    });
                                </script>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

<script>
    function guardarPDF(){
        console.log("entrio")
        let documento = new JsPDF('p', 'mm', [297, 220]);

        let docWidth = documento.internal.pageSize.getWidth();

        console.log("entrio 2")
        documento.html(document.querySelector('#contenidoReporte'), {
            callback: function(doc) {
                doc.save("ReporteResultados.pdf");
            },
            autoPaging: 'text',
            margin: [10, 10, 10, 10],
            width: docWidth - 20,
            windowWidth: 1000,
        });
    }
</script>
