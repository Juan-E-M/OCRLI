<div class="col-md-6">
    <label for="mediosTotales" class="form-label">Numero de medios totales</label>
    <input type="text" class="form-control" id="mediosTotales" name="mediosTotales"
           value="{{ $mediosTotales }}" disabled>
    <label for="mediosMarcados" class="form-label" style="margin-top: 5px">Numero de medios marcados</label>
    <input type="text" class="form-control" id="mediosMarcados" name="mediosMarcados"
           value="{{ $mediosMarcados }}" disabled>
    <label for="brechaPorc" class="form-label" style="margin-top: 5px">Brecha %</label>
    <input type="text" class="form-control" id="brechaPorc" name="brechaPorc"
           value="{{ $brechaPorc }} %" disabled>
</div>
<div class="col-md-6">
    <label for="idMedioSugerido" class="form-label">Resultado</label>
    <ul class="list-group" id="resultadosUl">
        <li class='list-group-item' id="liCompleto">Completos: {{ $medios_completos }}</li>
        <li class='list-group-item' id="li25">Hasta 25% completo: {{ $medios_25 }}</li>
        <li class='list-group-item' id="li50">Hasta 50% completo : {{ $medios_50 }}</li>
        <li class='list-group-item' id="li75">Hasta 75% completo : {{ $medios_75 }}</li>
        <li class='list-group-item' id="li99">Hasta 99% completo : {{ $medios_99 }}</li>
    </ul>
</div>
