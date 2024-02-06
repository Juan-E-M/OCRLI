<form class="row g-3" method="post" style="margin-bottom: 0">
    <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
    <input type="hidden" id="idNivelacion" name="idNivelacion" value="{{  $nivelacion ? $nivelacion->id : 0 }}">
    <label class="form-label"><b>Comprendiéndonos</b></label>
    <div class="col-md-12">
        <label for="queEs" class="form-label">¿Qué es?</label>
        <textarea type="text" class="form-control" id="queEs" name="queEs" disabled rows="2">
            El licenciamiento es obligatorio, y se constituye como un procedimiento que tiene como objetivo verificar el cumplimiento de Condiciones Básicas de Calidad (CBC) para ofrecer el servicio educativo superior universitario y autorizar su funcionamiento. El licenciamiento propuesto tiene carácter temporal y renovable, y tendrá́ una vigencia mínima de seis (6) años. </textarea>
    </div>
    <div class="col-md-12">
        <label for="puntoE" class="form-label">¿Punto de encuentro?</label>
        <textarea type="text" class="form-control" id="puntoE" name="puntoE" disabled rows="1">
            Universidad es un punto de encuentro de diversidad de personas con diferentes perspectivas: “La universidad es una comunidad académica de nuestro país como realidad multicultural (…)” (artículo 3 de la Ley Universitaria).</textarea>
    </div>
    <div class="col-md-12">
        <label for="puntoE" class="form-label">¿Universidad?</label>
        <textarea type="text" class="form-control" id="puntoE" name="puntoE" disabled rows="5">
            No hay universidad sin comunidad académica
            No hay universidad sin diversidad
            No hay universidad sin orientación hacia brindar una formación integral, científica, humanista y ciudadana, pertinente con su entorno
            No hay universidad sin compromiso social
            No hay universidad sin una autocomprensión de sí por parte de la comunidad</textarea>
    </div>
    <label class="form-label"><b>Para evaluarnos</b></label>
    <div class="col-md-12">
        <label for="qhaces" class="form-label">¿Qué haces y que harán?</label>
        <textarea type="text" class="form-control" id="qhaces" name="qhaces" disabled rows="3">
            Identificarán criterios 
            Evaluar los componentes en forma integral, evidenciando la articulación entre sí.
            Evaluarán las CBC-R tomando en cuenta: la coherencia, consistencia, pertinencia, sostenibilidad, mejora continua y la razonabilidad que se             presente.</textarea>
    </div>
    <div class="col-md-12">
        <label for="acti" class="form-label">¿Qué se ve en una actividad?</label>
        <textarea type="text" class="form-control" id="acti" name="acti" disabled rows="4">
            Su tipo: directo - relacionado
            Vinculación: con otro estándar o sola
            Avance: donde está en el momento de evaluación 
            Situación: ejecutada o no</textarea>
    </div>
    <div class="col-md-12">
        <label for="escalas" class="form-label">¿Cuáles son las Escalas de logro del estándar?</label>
        <textarea type="text" class="form-control" id="escalas" name="escalas" disabled rows="6">
            No ha logrado el estándar (brecha al 100%)
            No ha logrado el estándar (brecha al 75%)
            No ha logrado el estándar (brecha al 50%)
            No ha logrado el estándar (brecha al 25%)
            Ha logrado el estándar
            Ha logrado plenamente el estándar</textarea>
    </div>
    <div class="col-md-12">
        <label for="logros" class="form-label">Nivel de logro</label>
        <textarea type="text" class="form-control" id="logros" name="logros" disabled rows="3">
            No logrado: Falta un estándar
            Logrado: Falta algo dentro de estándar
            Logrado Pleno: Todos los estándares se cumplen</textarea>
    </div>
    <div class="col-md-12">
        <label for="marcoC" class="form-label">Marco Conceptual</label>
        <textarea type="text" class="form-control" id="marcoC" name="marcoC" disabled rows="3">
            Los medios de verificación a evaluar, son la línea que determinar el valor al indicador, los indicadores, conforman un componente y los componentes hacen las condiciones básicas de calidad -renovación y las condiciones son el modelo de Licenciamiento INstitucional de educación superior universitaria: CONDICIÓN BÁSICAS DE CALIDAD Componente indicador medio de verificación
Condición Básica de Calidad 4, Componentes 20, Indicadores 32 y Medio de Verificación 134
</textarea>
    </div>
    <div class="col-md-6">
        <label for="idFactor" class="form-label">Aprende CBC-R</label>
        <select class="form-select" id="idFactor" name="idFactor">
            <option value="0" selected>Seleccione una opción</option>
            @foreach($cbcrs as $cbcr)
                <option value="{{ $cbcr->id }}">{{ $cbcr->detalle }} </option>
            @endforeach
        </select>
    </div>
    <div class="col-md-6">
        <label for="idEstandar" class="form-label">Aprende Componente</label>
        <select class="form-select" id="idEstandar" name="idEstandar">
            <option value="0" selected>Seleccione una opción</option>
        </select>
    </div>
    <div class="col-md-6">
        <label for="idCriterioEvaluacion" class="form-label">Aprende Indicador</label>
        <select class="form-select" id="idCriterioEvaluacion" name="idCriterioEvaluacion">
            <option value="0" selected>Seleccione una opción</option>
        </select>
    </div>
    <div class="col-md-6">
        <label for="idCriterioEvaluacionDetalle" class="form-label">Aprender Medio de Verificación</label>
        <select class="form-select" id="idCriterioEvaluacionDetalle" name="idCriterioEvaluacionDetalle">
            <option value="0" selected>Seleccione una opción</option>
        </select>
    </div>
    <hr/>
    <div class="col-md-12">
        <div class="row g-2 @if($nivelacion != null && $nivelacion->tomoExamen) disabledDiv @endif " id="seccionMedios">
            <script>
                $.get('/getEvaluacion/' + {{ $idRegistro }}, function(response){
                    $('#seccionMedios').html(response);
                });
            </script>
        </div>
    </div>
    <hr/>
    <div class="col-md-1">
        <label for="resultado" class="form-label">Resultado</label>
        <input type="text" class="form-control" id="resultado" name="resultado" style="text-align: center"
               value="{{ $nivelacion ? $nivelacion->resultado : "" }}" disabled>
    </div>
    <div class="col-md-10">
        <label for="interp" class="form-label">Interpretación de resultado</label>
        <textarea type="text" class="form-control" id="interp" name="interp" disabled rows="6">
            De - 45 a 8 puntos: Nivel Muy bajo (continue revisando las normativas y modelo con apoyo de un facilitador)
            De 9 a 17 puntos: Nivel Bajo (continue revisando las normativas y modelo)
            De 18 a 26 puntos: Nivel Medio (revise lo que falló)
            De 27 a 35 puntos: Nivel Medio alto (integre equipo y/o comisión de acreditación)
            De 36 a 44 puntos: Nivel Alto (sea encargado de un factor)
            45 puntos:	Nivel Muy alto (sea encargado de una dimensión o todo el proceso)</textarea>
    </div>
    <hr/>
    <div class="col-md-12">
        <label for="metodologia" class="form-label">Metodología</label>
        <textarea type="text" class="form-control" id="metodologia" name="metodologia" disabled rows="13">
            La metodología OC RLI propone una secuencia de pasos que se detalla a continuación:
            0º Responsable de Renovación de Licenciamiento
            1º Identificación de organigrama institucional
            2º Identificaicón de oficinas administrativas
            3º Identificación de oficinas académicas
            4º identificación de oficinas de invesitgación
            5º Registro de personal de oficinas clave en oficinas (correo, teléfonos, ubicación física y horarios)
            6º Revisión inicial de fase 2 del OC RLI
            7º Integración de equipo humano interno de renovación de licenciamiento
            8º Integración de equipo humano externo de renovación de licenciamiento
            9º Revisión final de fase 2 del OC RLI
            10º Revisión final de fase 3 del OC RLI</textarea>
    </div>
    <div class="col-md-12">
        <label for="planif" class="form-label">Planificación</label>
        <textarea type="text" class="form-control" id="planif" name="planif" disabled rows="4">
            Lo mínimo es tener:
            Participación voluntaria personal del programa de estudios: registro luego de la sensibilización y socialización con el OC AC
            Compromiso de apoyo de las autoridades en el proceso de acreditación: comunicación con oficio a todas las oficinas
            Implementación de espacio físico: un ambiente con equipos de cómputo, internet y anexo telefónico</textarea>
    </div>
</form>

<script>
     $('#idFactor').change(function() {
        $("#idEstandar").html("");
        let idFactor = $("#idFactor").val();
        let url = '{{ route('getEstandares', ':idFactor') }}';
        url = url.replace(':idFactor', idFactor);
        $.ajax({
            url: url,
            type:'get',
            dataType:'json',
            success:function (response) {
                if (response.estandares != null) {
                    $("#idEstandar").append("<option value='0' selected>Seleccione una opción</option>");
                    for (let i = 0; i<response.estandares.length; i++) {
                        let id = response.estandares[i].id;
                        let detalle = response.estandares[i].detalle;
                        let option = "<option value='" + id + "' ";
                        option += ">" + detalle + "</option>"
                        $("#idEstandar").append(option);
                    }
                }
            },
            error: function (response){
                console.error(response);
            }
        })
    });

    $('#idEstandar').change(function() {
        $("#idCriterioEvaluacion").html("");
        let idEstandar = $("#idEstandar").val();
        let url = '{{ route('getCriterios', ':idEstandar') }}';
        url = url.replace(':idEstandar', idEstandar);
        $.ajax({
            url: url,
            type:'get',
            dataType:'json',
            success:function (response) {
                if (response.criterios != null) {
                    $("#idCriterioEvaluacion").append("<option value='0' selected>Seleccione una opción</option>");
                    for (let i = 0; i<response.criterios.length; i++) {
                        let id = response.criterios[i].id;
                        let detalle = response.criterios[i].detalle;
                        let option = "<option value='" + id + "' ";
                        option += ">" + detalle + "</option>"
                        $("#idCriterioEvaluacion").append(option);
                    }
                }
            },
            error: function (response){
                console.error(response);
            }
        })
    });
        
    $('#idCriterioEvaluacion').change(function() {
        $("#idCriterioEvaluacionDetalle").html("");
        let idCriterio = $("#idCriterioEvaluacion").val();
        let url = '{{ route('getMedios', ['idCriterio'=>':idCriterio', 'idRegistro'=>':idRegistro']) }}';
        url = url.replace(':idCriterio', idCriterio);
        url = url.replace(':idRegistro', {{ $idRegistro }});
        $.ajax({
            url: url,
            type:'get',
            dataType:'json',
            success:function (response) {
                if (response.medios != null) {
                    $("#idCriterioEvaluacionDetalle").append("<option value='0' selected>Seleccione una opción</option>");
                    for (let i = 0; i<response.medios.length; i++) {
                        // response.medios[i].detalle 
                        let id = response.medios[i].id;
                        let detalle = response.medios[i].detalle;
                        let option = "<option value='" + id + "' ";            
                        option += ">" + detalle + "</option>"
                        $("#idCriterioEvaluacionDetalle").append(option);
                    }
                }
                        
            },
            error: function (response){
                console.error(response);
            }
        });
    });
</script>
