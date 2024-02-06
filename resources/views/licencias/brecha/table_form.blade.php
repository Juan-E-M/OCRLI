<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b>Medios</b></h5>
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalMedios"
                data-idmedio="0">
            <i class="fa fa-plus-square"></i> <span>Agregar</span>
        </button>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <hr/>
            <table class="table table-striped table-hover" id="tableIntegrantes">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Detalle</th>
                    <th scope="col">Acciones</th>
                </tr>
                </thead>
                <tbody>
                @foreach($medios as $medio)
                    <tr id="tr_{{ $medio->id }}" >
                        <td>{{ $medio->id }}</td>
                        <td>{{ $medio->medio }}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#modalMedios"
                                    data-idmedio="{{ $medio->id }}"
                                    data-medio="{{ $medio->medio }}">
                                <i class="fa fa-pencil" data-toggle="tooltip" title="Editar"></i>
                            </button>
                            <button type="button" class="btn btn-danger" onclick="EliminarMedio(event, {{ $medio->id }})">
                                <i class="fa fa-trash" data-toggle="tooltip" title="Eliminar"></i>
                            </button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="modalMedios" tabindex="-1" aria-labelledby="modalMediosLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar nuevo medio</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row g-3" style="margin-bottom: 0">
                        <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
                        <input type="hidden" id="idMedio" name="idMedio" value="0">
                        <div class="col-md-12">
                            <label for="medio" class="form-label">Medio</label>
                            <input type="text" class="form-control" id="medio" name="medio">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal"> Cerrar</button>
                <button type="button" class="btn btn-success" onclick="GuardarMedio(event)"> Guardar</button>
            </div>
        </div>
    </div>
</div>


<script>
    $('#modalMedios').on('shown.bs.modal', function (e) {
        const idMedio = $(e.relatedTarget).data('idmedio').toString();
        const medio = $(e.relatedTarget).data('medio');

        if (idMedio !== '0') {
            $(e.currentTarget).find('input[id="idMedio"]').val(idMedio);
            $(e.currentTarget).find('input[id="medio"]').val(medio);
        }
    })

    $('#modalMedios').on('hidden.bs.modal', function (e) {
        $(e.currentTarget).find('input[id="idMedio"]').val("0");
        $(e.currentTarget).find('input[id="medio"]').val("");
    })


    function EliminarMedio(e, idMedio){
        e.preventDefault();

        let urlRefresh = '{{ route('obtenerMedios', [$idRegistro, ':idCriterio']) }}';
        urlRefresh = urlRefresh.replace(':idCriterio', $('#idCriterioEvaluacion').val());

        let urlDelete = "{{ route('eliminarMedio', ':idMedio') }}";
        urlDelete = urlDelete.replace(':idMedio', idMedio);

        Swal.fire({
            title: "¿Desea eliminar el medio?",
            showDenyButton: true,
            icon: 'question',
            confirmButtonText: 'Aceptar',
            denyButtonText: 'Cancelar',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "post",
                    url: urlDelete,
                    data: { _token: $('#token').val() },
                    async: false,
                    success: function (result) {
                        if (result.success) {
                            $('#seccionMedios').load(urlRefresh);
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Medio eliminado correctamente.',
                                showConfirmButton: true
                            });
                        }
                    },
                    error: function (error) {
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            title: 'Ocurrio un error durante al momento de eliminar el medio.',
                            showConfirmButton: true
                        });
                        console.log(error)
                    }
                });
            }
        });
    }

    function GuardarMedio(e) {
        let urlRefresh = '{{ route('obtenerMedios', [$idRegistro, ':idCriterio']) }}';
        urlRefresh = urlRefresh.replace(':idCriterio', $('#idCriterioEvaluacion').val());

        e.preventDefault();
        let idMedio = $('#idMedio').val();
        let urlPost = '{{ route('actualizarMedio') }}';
        let mensaje = "¿Desea modificar el medio?";
        if (idMedio === '0') {
            urlPost = '{{ route('registrarMedio') }}'
            mensaje = "¿Desea registrar el medio?";
        }
        const araryData = {
            idMedio: idMedio,
            idCriterio: $('#idCriterioEvaluacion').val(),
            medio: $('#medio').val(),
            idRegistro: {{ $idRegistro }},
            _token: $('#token').val()
        };

        Swal.fire({
            title: mensaje,
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
                            $('#seccionMedios').load(urlRefresh);
                            $('#modalMedios').modal('toggle');
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Medio guardado correctamente.',
                                showConfirmButton: true
                            });
                        }
                    },
                    error: function (error) {
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            title: 'Ocurrio un error durante al momento de guardar el medio.',
                            showConfirmButton: true
                        });
                        console.error(error)
                    }
                });
            }
        });
    }
</script>
