<form class="row g-3" method="post" style="margin-bottom: 0">
    <input type="hidden" id="token" name="token" value="<?php echo csrf_token(); ?>">
    <input type="hidden" id="idBrecha" name="idBrecha" value="{{  $brecha ? $brecha->id : 0 }}">
    <div class="col-md-6">
        <label for="idFactor" class="form-label">Condición</label>
        <select class="form-select" id="idFactor" name="idFactor">
            <option value="0" selected>Seleccione una opción</option>
            @foreach($factores as $factor)
                <option value="{{ $factor->id }}">{{ $factor->detalle }} </option>
            @endforeach
        </select>
    </div>
    <div class="col-md-6">
        <label for="idEstandar" class="form-label">Componente</label>
        <select class="form-select" id="idEstandar" name="idEstandar">
            <option value="0" selected>Seleccione una opción</option>
        </select>
    </div>
    <div class="col-md-6"></div>
    <div class="col-md-12">
        <label for="idCriterioEvaluacion" class="form-label">Indicador</label>
        <select class="form-select" id="idCriterioEvaluacion" name="idCriterioEvaluacion">
            <option value="0" selected>Seleccione una opción</option>
        </select>
    </div>
    <div class="col-md-12">
        <div class="modal-content">
            <div class="modal-header">
                <h7 class="modal-title" id="exampleModalLabel">Medio de verificación</h7>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <hr/>
                    <table class="table table-striped table-hover" id="tableMediosSugeridos">
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5">
        <div class="row g-2" id="seccionMedios">
        </div>
    </div>

    <div class="col-md-7">
        <div class="row g-2" id="seccionResultados">
        </div>
    </div>
    <hr/>

    <div class="col-md-12">
        <label for="brecha" class="form-label">Interpretación de resultado</label>
        <textarea type="text" class="form-control" id="brecha" name="brecha" disabled rows="2">
            < 100% : No logrado: Planifique actividades
            = 100% : Logrado Pleno</textarea>
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
                        if ({{  $brecha? $brecha->idEstandar : 0 }} === id)
                            option += "selected"
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
                        if ({{  $brecha? $brecha->idCriterio : 0 }} === id)
                            option += "selected"
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
        $("#tableMediosSugeridos").html("");
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
                    let row = "<thead>" +
                        "<tr>" +
                        "<th scope='col'>#</th>" +
                        "<th scope='col'>Medios</th>" +
                        "<th scope='col'>Opciones</th>" +
                        "</tr>" +
                        "</thead>" +
                        "<tbody>";
                    for (let i = 0; i<response.medios.length; i++) {
                        //

                        //
                        row += "<tr>" +
                                "<td>" + response.medios[i].id + "</td>" +
                                "<td>" + response.medios[i].detalle + "</td>" +
                                "<td>" +
                                    "<div>" +
                                        "<select class='form-select selectTable' id='identificacionBrecha_" + response.medios[i].id + "' name='identificacionBrecha_" + response.medios[i].id + "' " +
                                            "onchange='onChangeInTable(" + response.medios[i].id + ")'>" +
                                            "<option value='0'> Seleccione una opción </option>" +
                                            "<option value='1'";
                                            if (response.medios[i].nivel !== null && response.medios[i].nivel === 1)
                                                row += " selected";
                                            row += "> Completo </option>" +
                                            "<option value='2'";
                                            if (response.medios[i].nivel !== null && response.medios[i].nivel === 2)
                                                row += " selected";
                                            row += "> Hasta 25% completo </option>" +
                                            "<option value='3'";
                                            if (response.medios[i].nivel !== null && response.medios[i].nivel === 3)
                                                row += " selected";
                                            row += "> Hasta 50% completo </option>" +
                                            "<option value='4'";
                                            if (response.medios[i].nivel !== null && response.medios[i].nivel === 4)
                                                row += " selected";
                                            row += "> Hasta 75% completo </option>" +
                                            "<option value='5'";
                                            if (response.medios[i].nivel !== null && response.medios[i].nivel === 5)
                                                row += " selected";
                                            row += "> Hasta 99% completo </option>" +
                                        "</select>" +
                                    "</div>" +
                                "</td>" +
                            "</tr>"
                    }
                    row += "</tbody>";
                    $("#tableMediosSugeridos").append(row);

                    $.get('/obtenerMedios/' + {{ $idRegistro }} + "/" + idCriterio, function(response){
                        $('#seccionMedios').html(response);
                    })
                    //
                    let seccionResul = "<script>" +
                            "$.get('/obtenerResultados/" + {{ $idRegistro }} + "/" + idCriterio + "', function(response){" +
                                "$('#seccionResultados').html(response);" +
                            "}); " +
                        "</" + "script>";
                    $("#seccionResultados").append(seccionResul);
                }
            },
            error: function (response){
                console.error(response);
            }
        });
    });

    function onChangeInTable(idMedio){
        var idNivelBrecha = document.getElementById("identificacionBrecha_" + idMedio.toString()).value;
        const araryData = {
            idMedio: idMedio,
            idCriterio: $("#idCriterioEvaluacion").val(),
            idNivelBrecha: idNivelBrecha,
            idRegistro: {{ $idRegistro }},
            _token: $('#token').val()
        };
        $.ajax({
            url: '{{ route('registrarBrechaCriterio') }}',
            type: 'post',
            data: araryData,
            dataType: 'json',
            success: function (response) {
                if (response.success === true) {
                    $('.toast').toast('show');
                    $('#mediosTotales').val(response.mediosTotales );
                    $('#mediosMarcados').val(response.mediosMarcados );
                    $('#brechaPorc').val(response.brechaPorc + "%");
                    $("#liCompleto").text("Completos: " + response.medios_completos);
                    $("#li25").text("Hasta 25% completo: " + response.medios_25);
                    $("#li50").text("Hasta 50% completo: " + response.medios_50);
                    $("#li75").text("Hasta 75% completo: " + response.medios_75);
                    $("#li99").text("Hasta 99% completo: " + response.medios_99);
                }
            },
            error: function (response) {
                console.error(response);
            }
        })
    }

</script>
