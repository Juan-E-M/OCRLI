<form class="row g-3" method="post" style="margin-bottom: 0" id="formEjecucion">
    <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
    <input type="hidden" id="idEjecucionPlan" name="idEjecucionPlan" value="0">
    <div class="col-md-12">
        <label for="idBrechaCriterio" class="form-label">Ejecucion/Medio</label>
        <select class="form-select" id="idBrechaCriterio" name="idBrechaCriterio">
            <option value="0" selected>Seleccione una opción</option>
            @foreach($criterios as $criterio)
                <option value="{{ $criterio->id }}">{{ $criterio->detalleC }} / {{ $criterio->detalleM }}</option>
            @endforeach
        </select>
    </div>
    <hr/>
    <div class="col-md-6">
        <label for="actividad" class="form-label">Actividad</label>
        <input type="text" class="form-control" id="actividad" name="actividad"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="quien" class="form-label">¿Quién?</label>
        <input type="text" class="form-control" id="quien" name="quien"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="como" class="form-label">¿Cómo?</label>
        <input type="text" class="form-control" id="como" name="como"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-6">
        <label for="fechaInicio" class="form-label">Fecha de inicio</label>
        <input type="date" class="form-control" id="fechaInicio" name="fechaInicio"
               min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy">
    </div>
    <div class="col-md-6">
        <label for="fechaFin" class="form-label">Fecha de fin</label>
        <input type="date" class="form-control" id="fechaFin" name="fechaFin"
               min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy">
    </div>
    <div class="col-md-6">
        <label for="donde" class="form-label">¿Dónde?</label>
        <input type="text" class="form-control" id="donde" name="donde"
               placeholder="Ingresa información">
    </div>
    <div class="col-md-12">
        <label for="requerimiento" class="form-label">Requerimiento</label>
        <textarea type="text" class="form-control" id="requerimiento" name="requerimiento"></textarea>
    </div>
    <div class="col-md-6">
        <label for="hitoSeguimiento" class="form-label">Hito de seguimiento</label>
        <input type="text" class="form-control" id="hitoSeguimiento" name="hitoSeguimiento"
               placeholder="Ingresa fechas de seguimiento-reunión">
    </div>
    <div class="col-md-6">
        <label for="entregableHito" class="form-label">Entregable de hito</label>
        <input type="text" class="form-control" id="entregableHito" name="entregableHito"
               placeholder="Ingresa lo que se entregará en el hito">
    </div>
    <hr/>
    <div class="modal-footer" style="margin-top: 15px">
        <button type="button" id="Guardar" class="btn btn-success" onclick="GuardarRegistro(event)">
            <i class="fa fa-save"></i> Guardar
        </button>
    </div>
</form>
<script>
    $('#idBrechaCriterio').change(function() {
        Limpiar();
        let url = '{{ route('obtenerBrechaPorCriterio', [':idRegistro', ':idBrechaCriterio']) }}';
        url = url.replace(':idRegistro', {{ $idRegistro }});
        url = url.replace(':idBrechaCriterio', $('#idBrechaCriterio').val());
        $.ajax({
            url: url,
            type:'get',
            dataType:'json',
            success:function (response) {
                if (response.success === true) {
                    if (response.brecha != null) {
                        $('#idEjecucionPlan').val(response.brecha.id);
                        $('#actividad').val(response.brecha.actividad);
                        $('#quien').val(response.brecha.quien);
                        $('#como').val(response.brecha.como);
                        $('#fechaInicio').val(response.brecha.fechaInicio);
                        $('#fechaFin').val(response.brecha.fechaFin);
                        $('#donde').val(response.brecha.donde);
                        $('#requerimiento').val(response.brecha.requerimiento);
                        $('#hitoSeguimiento').val(response.brecha.hitoSeguimiento);
                        $('#entregableHito').val(response.brecha.entregableHito);
                    }
                }
            },
            error: function (response){
                console.error(response);
            }
        })
    });

    function Limpiar(){
        $('#idEjecucionPlan').val("0");
        $('#actividad').val("");
        $('#quien').val("");
        $('#como').val("");
        $('#fechaInicio').val("");
        $('#fechaFin').val("");
        $('#donde').val("");
        $('#requerimiento').val("");
        $('#hitoSeguimiento').val("");
        $('#entregableHito').val("");
    }

    function GuardarRegistro(e) {
        $("#formEjecucion").validate({
            rules: {
                actividad : { required: true },
                quien: { required: true },
                como: { required: true },
                fechaInicio: { required: true },
                fechaFin: { required: true },
                donde: { required: true },
                requerimiento: { required: true },
                hitoSeguimiento: { required: true },
                entregableHito: { required: true }
            },
            messages: {
                actividad:{
                    required: "El campo Actividad es obligatorio."
                },
                quien:{
                    required: "El campo Quien es obligatorio."
                },
                como:{
                    required: "El campo Como geográfica es obligatorio."
                },
                fechaInicio:{
                    required: "El campo Fecha inicio es obligatorio."
                },
                fechaFin:{
                    required: "El campo Fecha fin es obligatorio."
                },
                donde:{
                    required: "El campo Donde es obligatorio."
                },
                requerimiento:{
                    required: "El campo Requerimiento es obligatorio."
                },
                hitoSeguimiento:{
                    required: "El campo Hito Seguimiento es obligatorio."
                },
                entregableHito:{
                    required: "El campo Entregable Hito es obligatorio."
                }
            }
        });
        // POST
        if ($("#formEjecucion").valid()) {
            e.preventDefault();
            let idEjecucionPlan = $('#idEjecucionPlan').val();

            let urlPost = '{{ route('actualizarEjecucionOperacional') }}';
            if (idEjecucionPlan === '0') {
                urlPost = '{{ route('guardarEjecucionOperacional') }}';
            }

            const araryData = {
                idEjecucionPlan: idEjecucionPlan,
                idBrechaCriterio: $('#idBrechaCriterio').val(),
                actividad: $('#actividad').val(),
                quien: $('#quien').val(),
                como: $('#como').val(),
                fechaInicio: $('#fechaInicio').val(),
                fechaFin: $('#fechaFin').val(),
                donde: $('#donde').val(),
                requerimiento: $('#requerimiento').val(),
                hitoSeguimiento: $('#hitoSeguimiento').val(),
                entregableHito: $('#entregableHito').val(),
                idRegistro: {{ $idRegistro }},
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
                                }).then((confirm) => {
                                    if (confirm.isConfirmed) {
                                        if (result.redirect) {
                                            $('#detalle').load('{{ route('obtenerEjecucionOperacional', $idRegistro) }}');
                                        }
                                    }
                                })
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
