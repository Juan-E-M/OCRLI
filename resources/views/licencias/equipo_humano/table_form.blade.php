<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b>Equipo Humano</b></h5>
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalEquipoHumano"
                data-idintegrante="0">
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
                    <th scope="col">Nombres y Apellidos</th>
                    <th scope="col">Cargo</th>
                    <th scope="col">Funciones principales</th>
                    <th scope="col">Correo electrónico</th>
                    <th scope="col">Número célular</th>
                    <th scope="col">Acciones</th>
                </tr>
                </thead>
                <tbody>
                @foreach($integrantes as $integrante)
                    <tr id="tr_{{ $integrante->id }}" >
                        <td>{{ $integrante->id }}</td>
                        <td>{{ $integrante->nombresApellidos }}</td>
                        <td>{{ $integrante->cargo }}</td>
                        <td>{{ $integrante->funcionesPrincipales }}</td>
                        <td>{{ $integrante->correoElectronico }}</td>
                        <td>{{ $integrante->numeroCelular }}</td>
                        <td>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#modalEquipoHumano"
                                    data-idintegrante="{{ $integrante->id }}"
                                    data-nombres="{{ $integrante->nombresApellidos }}"
                                    data-cargo="{{ $integrante->cargo }}"
                                    data-funciones="{{ $integrante->funcionesPrincipales }}"
                                    data-correo="{{ $integrante->correoElectronico }}"
                                    data-numero="{{ $integrante->numeroCelular }}">
                                <i class="fa fa-pencil" data-toggle="tooltip" title="Editar"></i>
                            </button>
                            <button type="button" class="btn btn-danger" onclick="EliminarIntegrante(event, {{ $integrante->id }})">
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

<div class="modal fade" id="modalEquipoHumano" tabindex="-1" aria-labelledby="modalEquipoHumanoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar nuevo integrante</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row g-3" style="margin-bottom: 0">
                        <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
                        <input type="hidden" id="idIntegrante" name="idIntegrante" value="0">
                        <div class="col-md-6">
                            <label for="nombresApellidos" class="form-label">Nombres y Apellidos</label>
                            <input type="text" class="form-control" id="nombresApellidos" name="nombresApellidos">
                        </div>
                        <div class="col-md-6">
                            <label for="cargo" class="form-label">Cargo</label>
                            <input type="text" class="form-control" id="cargo" name="cargo">
                        </div>
                        <div class="col-md-6">
                            <label for="funcionesPrincipales" class="form-label">Funciones principales</label>
                            <input type="text" class="form-control" id="funcionesPrincipales" name="funcionesPrincipales">
                        </div>
                        <div class="col-md-6">
                            <label for="correoElectronico" class="form-label">Correo electrónico</label>
                            <input type="text" class="form-control" id="correoElectronico" name="correoElectronico">
                        </div>
                        <div class="col-md-6">
                            <label for="numeroCelular" class="form-label">Número célular</label>
                            <input type="text" class="form-control" id="numeroCelular" name="numeroCelular"
                                   placeholder="Ingresa información">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal"> Cerrar</button>
                <button type="button" class="btn btn-success" onclick="GuardarIntegrante(event)"> Guardar</button>
            </div>
        </div>
    </div>
</div>


<script>
    idI = parseInt($('#idIntegrante').val());

    $('#modalEquipoHumano').on('shown.bs.modal', function (e) {
        const idIntegrante = $(e.relatedTarget).data('idintegrante').toString();
        const nombresApellidos = $(e.relatedTarget).data('nombres');
        const cargo = $(e.relatedTarget).data('cargo');
        const funcionesPrincipales = $(e.relatedTarget).data('funciones');
        const correoElectronico = $(e.relatedTarget).data('correo');
        const numeroCelular = $(e.relatedTarget).data('numero');

        if (idIntegrante !== '0') {
            $(e.currentTarget).find('input[id="idIntegrante"]').val(idIntegrante);
            $(e.currentTarget).find('input[id="nombresApellidos"]').val(nombresApellidos);
            $(e.currentTarget).find('input[id="cargo"]').val(cargo);
            $(e.currentTarget).find('input[id="funcionesPrincipales"]').val(funcionesPrincipales);
            $(e.currentTarget).find('input[id="correoElectronico"]').val(correoElectronico);
            $(e.currentTarget).find('input[id="numeroCelular"]').val(numeroCelular);
        }
    })

    $('#modalEquipoHumano').on('hidden.bs.modal', function (e) {
        $(e.currentTarget).find('input[id="idIntegrante"]').val("0");
        $(e.currentTarget).find('input[id="nombresApellidos"]').val("");
        $(e.currentTarget).find('input[id="cargo"]').val("");
        $(e.currentTarget).find('input[id="funcionesPrincipales"]').val("");
        $(e.currentTarget).find('input[id="correoElectronico"]').val("");
        $(e.currentTarget).find('input[id="numeroCelular"]').val("");
    })

    function EliminarIntegrante(e, idEquipoHumano){
        if ({{ $idRegistro }} === 0) {
            Swal.fire({
                title: "¿Desea eliminar el integrante?",
                showDenyButton: true,
                icon: 'question',
                confirmButtonText: 'Aceptar',
                denyButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#tr_' + idEquipoHumano).remove();
                }
            });
        }
        else {
            e.preventDefault();
            let urlDelete = "{{ route('eliminarEquipoHumano', ':idEquipoHumano') }}";
            urlDelete = urlDelete.replace(':idEquipoHumano', idEquipoHumano);

            Swal.fire({
                title: "¿Desea eliminar el integrante?",
                showDenyButton: true,
                icon: 'question',
                confirmButtonText: 'Aceptar',
                denyButtonText: 'Cancelar',
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "post",
                        url: urlDelete,
                        async: false,
                        success: function (result) {
                            if (result.success) {
                                $('#seccionEquipoHumano').load('{{ route('obtenerEquipoHumano',  $idRegistro) }}');
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: 'Integrante eliminado correctamente.',
                                    showConfirmButton: true
                                });
                            }
                        },
                        error: function (error) {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Ocurrio un error durante al momento de eliminar el integrante.',
                                showConfirmButton: true
                            });
                            console.log(error)
                        }
                    });
                }
            });
        }
    }

    function GuardarIntegrante(e) {
        e.preventDefault();
        let idIntegrante = $('#idIntegrante').val();
        if ({{ $idRegistro }} === 0) {
            if (idIntegrante === '0') {
                let bodyRow = "<tr id='tr_" + idI + "'>" +
                            "<td>" + idI + "</td>" +
                            "<td>" + $('#nombresApellidos').val() + "</td>" +
                            "<td>" + $('#cargo').val() + "</td>" +
                            "<td>" + $('#funcionesPrincipales').val() + "</td>" +
                            "<td>" + $('#correoElectronico').val() + "</td>" +
                            "<td>" + $('#numeroCelular').val() + "</td>" +
                            "<td>" +
                                "<button type='button' class='btn btn-primary' data-bs-toggle='modal'" +
                                    "data-bs-target='#modalEquipoHumano'" +
                                    "data-idintegrante='" + idI + "'" +
                                    "data-nombres='" + $('#nombresApellidos').val() + "'" +
                                    "data-cargo='" + $('#cargo').val() + "'" +
                                    "data-funciones='" + $('#funcionesPrincipales').val() + "'" +
                                    "data-correo='" + $('#correoElectronico').val() + "'" +
                                    "data-numero='" + $('#numeroCelular').val() + "'" +
                                    "data-idtipo='" + $('#nombresApellidos').val() + "'>" +
                                        "<i class='fa fa-pencil' data-toggle='tooltip' title='Editar'></i>" +
                                "</button>" +
                                "<button type='button' class='btn btn-danger' onclick='EliminarIntegrante(event, " + idI + ")'>" +
                                    "<i class='fa fa-trash' data-toggle='tooltip' title='Eliminar'></i>" +
                                "</button>" +
                            "</td>" +
                         "</tr>";
                let tableBody = $("table tbody");
                tableBody.append(bodyRow);
                idI = idI +1;
                $('#modalEquipoHumano').modal('toggle');
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Integrante guardado correctamente.',
                    showConfirmButton: true
                })
            }
            else {
                if ($('#tr_' + idIntegrante).length) {
                    let bodyTd =
                        "<td>" + idIntegrante + "</td>" +
                        "<td>" + $('#nombresApellidos').val() + "</td>" +
                        "<td>" + $('#cargo').val() + "</td>" +
                        "<td>" + $('#funcionesPrincipales').val() + "</td>" +
                        "<td>" + $('#correoElectronico').val() + "</td>" +
                        "<td>" + $('#numeroCelular').val() + "</td>" +
                        "<td>" +
                        "<button type='button' class='btn btn-primary' data-bs-toggle='modal'" +
                        "data-bs-target='#modalEquipoHumano'" +
                        "data-idintegrante='" + idIntegrante + "'" +
                        "data-nombres='" + $('#nombresApellidos').val() + "'" +
                        "data-cargo='" + $('#cargo').val() + "'" +
                        "data-funciones='" + $('#funcionesPrincipales').val() + "'" +
                        "data-correo='" + $('#correoElectronico').val() + "'" +
                        "data-numero='" + $('#numeroCelular').val() + "'" +
                        "data-idtipo='" + $('#nombresApellidos').val() + "'>" +
                        "<i class='fa fa-pencil' data-toggle='tooltip' title='Editar'></i>" +
                        "</button>" +
                        "<button type='button' class='btn btn-danger' onclick='EliminarIntegrante(event, " + idIntegrante + ")'>" +
                        "<i class='fa fa-trash' data-toggle='tooltip' title='Eliminar'></i>" +
                        "</button>" +
                        "</td>";
                    $('#tr_' + idIntegrante).html(bodyTd);
                    $('#modalEquipoHumano').modal('toggle');
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Integrante guardado correctamente.',
                        showConfirmButton: true
                    });
                }
            }
        }
        else {
            let urlPost = '{{ route('actualizarEquipoHumano') }}';
            let mensaje = "¿Desea modificar el integrante?";
            if (idIntegrante === '0') {
                urlPost = '{{ route('registrarEquipoHumano') }}'
                mensaje = "¿Desea registrar el integrante?";
            }
            const araryData = {
                idIntegrante: $('#idIntegrante').val(),
                nombresApellidos: $('#nombresApellidos').val(),
                cargo: $('#cargo').val(),
                funcionesPrincipales: $('#funcionesPrincipales').val(),
                correoElectronico: $('#correoElectronico').val(),
                numeroCelular: $('#numeroCelular').val(),
                idRegistro: {{ $idRegistro }},
                _token: $('#token').val(),
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
                                $('#seccionEquipoHumano').load('{{ route('obtenerEquipoHumano',  $idRegistro) }}');
                                $('#modalEquipoHumano').modal('toggle');
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: 'Integrante guardado correctamente.',
                                    showConfirmButton: true
                                });
                            }
                        },
                        error: function (error) {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Ocurrio un error durante al momento de guardar el integrante.',
                                showConfirmButton: true
                            });
                            console.error(error)
                        }
                    });
                }
            });
        }
    }
</script>
