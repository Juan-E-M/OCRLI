@foreach($brechas as $brecha)
    <div class="col-md-12">
        <b>{{ $brecha->nombre_criterio }}</b>
    </div>
    <div class="col-md-6">
        <label for="brecha" class="form-label">Numero de medios totales</label>
        <input type="text" class="form-control" id="brecha" name="brecha"
               value="{{ $brecha->brechaTot }}" disabled>
        <label for="brecha" class="form-label" style="margin-top: 5px">Numero de medios marcados</label>
        <input type="text" class="form-control" id="brecha" name="brecha"
               value="{{ $brecha->brechaMar }}" disabled>
        <label for="brechaPor" class="form-label" style="margin-top: 5px">Brecha %</label>
        <input type="text" class="form-control" id="brechaPor" name="brechaPor"
               value="{{ $brecha->brechaPor }} %" disabled>
    </div>
    <div class="col-md-6">
        <label for="resultadosUl" class="form-label">Resultado</label>
        <ul class="list-group" id="resultadosUl">
            <li class='list-group-item' id="liCompleto">Completos: {{ $brecha->medios_completos }}</li>
            <li class='list-group-item' id="li25">Hasta 25% completo: {{ $brecha->medios_25 }}</li>
            <li class='list-group-item' id="li50">Hasta 50% completo : {{ $brecha->medios_50 }}</li>
            <li class='list-group-item' id="li75">Hasta 75% completo : {{ $brecha->medios_75 }}</li>
            <li class='list-group-item' id="li99">Hasta 99% completo : {{ $brecha->medios_99 }}</li>
        </ul>
    </div>
@endforeach
