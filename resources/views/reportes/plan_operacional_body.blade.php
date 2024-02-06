<div class="col-md-6">
    <label for="actividad" class="form-label">Actividad</label>
    <input type="text" class="form-control" id="actividad" name="actividad"
           placeholder="Ingresa información" value="{{ $brecha ? $brecha->actividad : "" }}">
</div>
<div class="col-md-6">
    <label for="quien" class="form-label">¿Quién?</label>
    <input type="text" class="form-control" id="quien" name="quien"
           placeholder="Ingresa información" value="{{ $brecha ? $brecha->quien : "" }}">
</div>
<div class="col-md-6">
    <label for="como" class="form-label">¿Cómo?</label>
    <input type="text" class="form-control" id="como" name="como"
           placeholder="Ingresa información" value="{{ $brecha ? $brecha->como : "" }}">
</div>
<div class="col-md-6">
    <label for="fechaInicio" class="form-label">Fecha de inicio</label>
    <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" value="{{ $brecha ? $brecha->fechaInicio : "" }}"
           min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy">
</div>
<div class="col-md-6">
    <label for="fechaFin" class="form-label">Fecha de fin</label>
    <input type="date" class="form-control" id="fechaFin" name="fechaFin"
           min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy" value="{{ $brecha ? $brecha->fechaFin : "" }}">
</div>
<div class="col-md-6">
    <label for="donde" class="form-label">¿Dónde?</label>
    <input type="text" class="form-control" id="donde" name="donde"
           placeholder="Ingresa información" value="{{ $brecha ? $brecha->donde : "" }}">
</div>
<div class="col-md-12">
    <label for="requerimiento" class="form-label">Requerimiento</label>
    <textarea type="text" class="form-control" id="requerimiento" name="requerimiento">{{ $brecha ? $brecha->requerimiento : "" }}</textarea>
</div>
<div class="col-md-6">
    <label for="hitoSeguimiento" class="form-label">Hito de seguimiento</label>
    <input type="text" class="form-control" id="hitoSeguimiento" name="hitoSeguimiento"
           placeholder="Ingresa fechas de seguimiento-reunión" value="{{ $brecha ? $brecha->hitoSeguimiento : "" }}">
</div>
<div class="col-md-6">
    <label for="entregableHito" class="form-label">Entregable de hito</label>
    <input type="text" class="form-control" id="entregableHito" name="entregableHito"
           placeholder="Ingresa lo que se entregará en el hito" value="{{ $brecha ? $brecha->entregableHito : "" }}">
</div>


