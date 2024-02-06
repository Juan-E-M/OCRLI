@extends('layouts.app')

@section('content')
    <link href="{{ asset('css/navbarInterna.css') }}" rel="stylesheet">
    <nav class="navbar navbar-expand-lg bg-light" style="padding:0">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="tab">
                    <button id="butonR" class="tablinks active" onclick="mostrar(1)">Registro</button>
                    <button id="butonF1" class="tablinks" onclick="mostrar(2)"
                            @if($idRegistro == 0) disabled @endif>Fase 1: Nivelación de conocimiento</button>
                    <button id="butonF2" class="tablinks" onclick="mostrar(3)"
                            @if($idRegistro == 0) disabled @endif>Fase 2: Identificación de brechas y planificación</button>
                    <button id="butonF3" class="tablinks" onclick="mostrar(4)"
                            @if($idRegistro == 0) disabled @endif>Fase 3: Ejecución de planificación</button>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-doc">
        <div class="card" style="overflow-y: scroll; height: 100%">
            <div class="card-body" id="divContenedor">
                <div id="detalle">
                    <script>
                        $.get('/getRegistro/' + {{ $idRegistro }}, function(response){
                            $('#detalle').html(response);
                        });
                        document.getElementById("butonR").className = " active";
                    </script>
                </div>
            </div>
        </div>
    </div>
@endsection

<script>
    let lastId="butonR";

    function mostrar(numero) {
        $('#detalle').html("");
        $( "#" + lastId ).removeClass( "active" )
        switch (numero){
            case 1:
                lastId="butonR";
                $.get('/getRegistro/' + {{ $idRegistro }}, function(response){
                    $('#detalle').html(response);
                });
                document.getElementById("butonR").className = " active";
                break;
            case 2:
                lastId="butonF1";
                $.get('/obtenerNivelacion/' + {{ $idRegistro }}, function(response){
                    $('#detalle').html(response);
                });
                document.getElementById("butonF1").className= " active";
                break;
            case 3:
                lastId="butonF2";
                $.get('/obtenerPlanificacionBrechas/' + {{ $idRegistro }}, function(response){
                    $('#detalle').html(response);
                });
                document.getElementById("butonF2").className= " active";
                break;
            case 4:
                lastId="butonF3";
                $.get('/obtenerEjecucionOperacional/' + {{ $idRegistro }}, function(response){
                    $('#detalle').html(response);
                });
                document.getElementById("butonF3").className= " active";
                break;
        }
    }

</script>
