@foreach($brechas as $brecha)
    <div class="col-md-12">
        <label for="idBrechaCriterio" class="form-label"><b>Criterio / Medio</b></label>
        <input type="text" class="form-control" id="idBrechaCriterio" name="idBrechaCriterio"
               placeholder="Ingresa información" value="{{ $brecha->detalleC }} / {{ $brecha->detalleM }}" disabled>
        <div class="row g-2" id="seccionPlanBody">
            <div class="col-md-6">
                <label for="actividad" class="form-label">Actividad</label>
                <input type="text" class="form-control" id="actividad" name="actividad"
                       placeholder="Ingresa información" value="{{ $brecha->actividad }}" disabled>
            </div>
            <div class="col-md-6">
                <label for="quien" class="form-label">¿Quién?</label>
                <input type="text" class="form-control" id="quien" name="quien" 
                       placeholder="Ingresa información" value="{{ $brecha->quien }}" disabled>
            </div>
            <div class="col-md-6">
                <label for="como" class="form-label">¿Cómo?</label>
                <input type="text" class="form-control" id="como" name="como"
                       placeholder="Ingresa información" value="{{ $brecha->como }}" disabled>
            </div>
            <div class="col-md-6">
                <label for="fechaInicio" class="form-label">Fecha de inicio</label>
                <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" value="{{ $brecha->fechaInicio }}"
                       min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy" disabled>
            </div>
            <div class="col-md-6">
                <label for="fechaFin" class="form-label">Fecha de fin</label>
                <input type="date" class="form-control" id="fechaFin" name="fechaFin"
                       min="1900-01-01" max="2030-12-31" placeholder="dd-mm-yyyy" value="{{ $brecha->fechaFin }}" disabled>
            </div>
            <div class="col-md-6">
                <label for="donde" class="form-label">¿Dónde?</label>
                <input type="text" class="form-control" id="donde" name="donde"
                       placeholder="Ingresa información" value="{{ $brecha->donde }}" disabled>
            </div>
            <div class="col-md-12">
                <label for="requerimiento" class="form-label">Requerimiento</label>
                <textarea type="text" class="form-control" id="requerimiento" name="requerimiento" disabled>{{ $brecha->requerimiento }}</textarea>
            </div>
            <div class="col-md-6">
                <label for="hitoSeguimiento" class="form-label">Hito de seguimiento</label>
                <input type="text" class="form-control" id="hitoSeguimiento" name="hitoSeguimiento" disabled
                       placeholder="Ingresa fechas de seguimiento-reunión" value="{{ $brecha->hitoSeguimiento }}">
            </div>
            <div class="col-md-6">
                <label for="entregableHito" class="form-label">Entregable de hito</label>
                <input type="text" class="form-control" id="entregableHito" name="entregableHito" disabled
                       placeholder="Ingresa lo que se entregará en el hito" value="{{ $brecha->entregableHito }}">
            </div>
        </div>
    </div>
    <hr/>
   <br/>
@endforeach