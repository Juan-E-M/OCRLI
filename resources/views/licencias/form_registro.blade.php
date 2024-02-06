<form class="row g-3" method="post" style="margin-bottom: 0" id="formRegistro">
    <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
    <input type="hidden" id="idRegistro" name="idRegistro" value="{{  $registro ? $registro->id : 0 }}">
    <div class="col-md-6">
        <label for="institucion" class="form-label">Institucion</label>
        <input type="text" class="form-control" id="institucion" name="institucion"
               value="{{ $registro ? $registro->institucion : "" }}"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="programa" class="form-label">Programa</label>
        <input type="text" class="form-control" id="programa" name="programa"
               value="{{ $registro ? $registro->programa : "" }}"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="ubicacionGeografica" class="form-label">Ubicación geográfica</label>
        <input type="text" class="form-control" id="ubicacionGeografica" name="ubicacionGeografica"
               value="{{ $registro ? $registro->ubicacionGeografica : "" }}"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="RUC" class="form-label">RUC</label>
        <input type="text" class="form-control" id="RUC" name="RUC"
               value="{{ $registro ? $registro->RUC : "" }}"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="paginaWebInstitucion" class="form-label">Página web institucion</label>
        <input type="text" class="form-control" id="paginaWebInstitucion" name="paginaWebInstitucion"
               value="{{ $registro ? $registro->paginaWebInstitucion : "" }}"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="paginaWebPrograma" class="form-label">Página web programa</label>
        <input type="text" class="form-control" id="paginaWebPrograma" name="paginaWebPrograma"
               value="{{ $registro ? $registro->paginaWebPrograma : "" }}"
               placeholder="Ingresa información">
    </div>
    <hr/>
    <div class="row g-2" id="seccionEquipoHumano">
        <script>
            $.get('/obtenerEquipoHumano/' + {{ $registro ? $registro->id : 0 }}, function(response){
                $('#seccionEquipoHumano').html(response);
            });
        </script>
    </div>
    <hr/>
    <div class="col-md-12">
        <label for="observaciones" class="form-label">Observaciones</label>
        <textarea class="form-control" id="observaciones" name="observaciones" rows="2"
                  placeholder="Ingresa información">{{ $registro ? $registro->observaciones : "" }}</textarea>
    </div>
    <div class="col-md-6">
        <label for="fechaInicio" class="form-label">Fecha inicio</label>
        <input type="date" class="form-control" id="fechaInicio" name="fechaInicio"
               value="{{ $registro ? $registro->fechaInicio : "" }}" min="1900-01-01" max="2030-12-31"
               placeholder="dd-mm-yyyy">
    </div>
    <div class="col-md-6">
        <label for="fechaAutoevaluacion" class="form-label">Fecha autoevaluación</label>
        <input type="date" class="form-control" id="fechaAutoevaluacion" name="fechaAutoevaluacion"
               value="{{ $registro ? $registro->fechaAutoevaluacion : "" }}" min="1900-01-01" max="2030-12-31"
               placeholder="dd-mm-yyyy">
    </div>
    <div class="col-md-6">
        <label for="fechaEnvio" class="form-label">Fecha envío</label>
        <input type="date" class="form-control" id="fechaEnvio" name="fechaEnvio"
               value="{{ $registro ? $registro->fechaEnvio : "" }}" min="1900-01-01" max="2030-12-31"
               placeholder="dd-mm-yyyy">
    </div>
    <hr/>
    <div class="modal-footer" style="margin-top: 15px">
        <button type="button" id="Guardar" class="btn btn-success" onclick="GuardarRegistro(event)">
            <i class="fa fa-save"></i> Guardar
        </button>
    </div>
</form>

<script>
    function GuardarRegistro(e) {
        $("#formRegistro").validate({
            rules: {
                institucion : { required: true },
                programa: { required: true },
                ubicacionGeografica: { required: true },
                RUC: { required: true },
                fechaInicio: { required: true },
                fechaAutoevaluacion: { required: true },
                fechaEnvio: { required: true }
            },
            messages: {
                institucion:{
                    required: "El campo Institucion es obligatorio."
                },
                programa:{
                    required: "El campo Programa es obligatorio."
                },
                ubicacionGeografica:{
                    required: "El campo Ubicacion geográfica es obligatorio."
                },
                RUC:{
                    required: "El campo RUC es obligatorio."
                },
                fechaInicio:{
                    required: "El campo Fecha inicio es obligatorio."
                },
                fechaAutoevaluacion:{
                    required: "El campo Fecha autoevaluacion es obligatorio."
                },
                fechaEnvio:{
                    required: "El campo Fecha envio es obligatorio."
                }
            }
        });
        // POST
        if ($("#formRegistro").valid()) {
            e.preventDefault();
            let idRegistro = $('#idRegistro').val();

            let urlPost = '{{ route('actualizarRegistro') }}';
            if (idRegistro === '0') {
                urlPost = '{{ route('guardarRegistro') }}';
            }

            const integrantes = [];
            $("table > tbody > tr").each(function () {
                integrantes.push({
                    'nombresApellidos': $(this).find('td').eq(1).text(),
                    'cargo': $(this).find('td').eq(2).text(),
                    'funcionesPrincipales': $(this).find('td').eq(3).text(),
                    'correoElectronico': $(this).find('td').eq(4).text(),
                    'numeroCelular': $(this).find('td').eq(5).text(),
                })
            });

            const araryData = {
                idRegistro: $('#idRegistro').val(),
                institucion: $('#institucion').val(),
                programa: $('#programa').val(),
                ubicacionGeografica: $('#ubicacionGeografica').val(),
                RUC: $('#RUC').val(),
                paginaWebInstitucion: $('#paginaWebInstitucion').val(),
                paginaWebPrograma: $('#paginaWebPrograma').val(),
                observaciones: $('#observaciones').val(),
                fechaInicio: $('#fechaInicio').val(),
                fechaAutoevaluacion: $('#fechaAutoevaluacion').val(),
                fechaEnvio: $('#fechaEnvio').val(),
                _token: $('#token').val(),
            };

            Swal.fire({
                title: "¿Desea guardar los cambios?",
                showDenyButton: true,
                icon: 'question',
                confirmButtonText: 'Guardar',
                denyButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "post",
                        url: urlPost,
                        async: false,
                        data: araryData,
                        success: function (result) {
                            if (result.success) {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: 'Documento guardado correctamente.',
                                    showConfirmButton: true
                                });
                                if (result.redirect) {
                                    if (idRegistro === '0') {
                                        if (integrantes.length > 0) {
                                        
                                            const araryIntegrantes = {
                                                _token: $('#token').val(),
                                                idRegistro: result.idRegistro,
                                                integrantes: integrantes
                                            }
                                            $.ajax({
                                                type: "post",
                                                url: '{{ route('registrarEquipoHumano') }}',
                                                async: false,
                                                data: araryIntegrantes,
                                                success: function (resultI) {
                                                    if (resultI.success) {
                                                        let url = '{{route("licencias.continuarRegistro", ':idRegistro')}}';
                                                        url = url.replace(':idRegistro', result.idRegistro);
                                                        window.location.href = url;
                                                    }
                                                },
                                                error: function (error) {
                                                    console.error(error)
                                                }
                                            });
                                        }
                                        else {
                                            let url = '{{route("licencias.continuarRegistro", ':idRegistro')}}';
                                            url = url.replace(':idRegistro', result.idRegistro);
                                            window.location.href = url;
                                        }
                                    }
                                }
                            }
                        },
                        error: function (error) {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Ocurrio un error durante al momento de guardar el documento.',
                                showConfirmButton: true
                            })
                            console.error(error)
                        }
                    });
                }
            });
        }
    }
</script>
