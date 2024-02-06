<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b>Equipo Humano</b></h5>
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
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
