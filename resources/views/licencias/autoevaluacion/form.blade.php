<form class="row g-3" method="post" style="margin-bottom: 0" id="formExamen">
    <input type="hidden" id="_token" name="_token" value="<?php echo csrf_token(); ?>">
    <input type="hidden" id="idRegistro" name="idRegistro" value="{{ $idRegistro }}">
    @foreach($examenRespuestas as $pregunta)
        <div class="col-md-11">
            <textarea type="text" class="form-control" id="brecha" name="brecha"
                      disabled rows="2">{{ $pregunta->pregunta }}</textarea>
        </div>
        <div class="col-md-1">
            <select class="form-select" id="{{ $pregunta->idExamen }}" name="{{ $pregunta->idExamen }}">
                <option value="N" @if($pregunta->valor == 'N') selected @endif > </option>
                <option value="V" @if($pregunta->valor == 'V') selected @endif >V</option>
                <option value="F" @if($pregunta->valor == 'F') selected @endif >F</option>
            </select>
        </div>
    @endforeach
    <hr/>
    <div class="modal-footer" style="margin-top: 15px">
        <button type="button" id="Guardar" class="btn btn-success" onclick="EnviarExamen(event)">
            <i class="fa fa-floppy-o"></i> Enviar
        </button>
    </div>
</form>

<script>
    function EnviarExamen(e) {
        e.preventDefault();
        let formExamen =  $('#formExamen').serializeArray();
        Swal.fire({
            title: "¿Seguro que desea terminar el examen? Luego no podra modificarlo",
            showDenyButton: true,
            icon: 'question',
            confirmButtonText: 'Guardar',
            denyButtonText: 'Cancelar',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "post",
                    url: '{{ route('enviarExamen') }}',
                    async: false,
                    data: formExamen,
                    success: function (result) {
                        if (result.success) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Examen enviado.',
                                showConfirmButton: true
                            }).then((confirm) => {
                                if (confirm.isConfirmed) {
                                    $('#detalle').load('{{ route('obtenerNivelacion', $idRegistro) }}');
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
        })
    }
</script>
