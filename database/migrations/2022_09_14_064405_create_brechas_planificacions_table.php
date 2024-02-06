<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('brechas_planificacion', function (Blueprint $table) {
            $table->id();
            $table->integer("idDimension");
            $table->integer("idFactor");
            $table->integer("idEstandar");
            $table->integer("idCriterioEvaluacion");
            $table->integer("idMedioSugerido");
            $table->string("medio");
            $table->integer("identificacionBrecha");
            $table->float("brecha");
            $table->foreignId('idRegistro')->constrained('registro');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('brechas_planificacion');
    }
};
