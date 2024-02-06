@extends('layouts.app')

@section('content')
    <div class="content-grid">
        <div class="card" style="overflow-y: scroll; height: 100%">
            <div class="card-body">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Lista de <b>licencias</b></h3>
                            <a href="{{ route('acs.registrar') }}" class="btn btn-success">
                                <i class="fa fa-plus-square"></i> <span>Agregar</span>
                            </a>
                        </div>
                        <hr/>
                        <div class="modal-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Institucion</th>
                                    <th scope="col">Programa</th>
                                    <th scope="col">RUC</th>
                                    <th scope="col">Pagina Web Institucion</th>
                                    <th scope="col">Pagina Web Programa</th>
                                    <th scope="col">Acciones</th>
                                    <th scope="col">Reporte</th>
                                </tr>
                                </thead>
                                <tbody>
                                    @foreach($licencias as $licencia)
                                        <tr>
                                            <td>{{ $licencia->id }}</td>
                                            <td>{{ $licencia->institucion }}</td>
                                            <td>{{ $licencia->programa }}</td>
                                            <td>{{ $licencia->RUC }}</td>
                                            <td>{{ $licencia->paginaWebInstitucion }}</td>
                                            <td>{{ $licencia->paginaWebPrograma }}</td>
                                            <td>
                                                <a href="{{ route('acs.editar', ['idRegistro' => $licencia->id]) }}"
                                                   class="btn btn-primary">
                                                    <i class="fa fa-pencil" data-toggle="tooltip" title="Edit"></i> Editar
                                                </a>
                                                <a href="{{ route('acs.editar', ['idRegistro' => $licencia->id]) }}" class="btn btn-danger" data-toggle="modal">
                                                    <i class="fa fa-trash" data-toggle="tooltip" title="Delete"></i> Eliminar
                                                </a>
                                            </td>
                                            <td>
                                                <a href="{{ route('obtenerReporteResultados', ['idRegistro' => $licencia->id]) }}" class="btn btn-secondary" data-toggle="modal">
                                                    <i class="fa fa-file" data-toggle="tooltip" title="Delete"></i> Reporte de resultados
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
