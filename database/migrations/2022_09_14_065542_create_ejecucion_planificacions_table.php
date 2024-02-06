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
        Schema::create('ejecucion_planificacion', function (Blueprint $table) {
            $table->id();
            $table->integer("idBrechaCriterio");
            $table->string("actividad");
            $table->string("quien");
            $table->string("como");
            $table->string("fechaInicio");
            $table->string("fechaFin");
            $table->string("donde");
            $table->string("requerimiento");
            $table->string("hitoSeguimiento");
            $table->string("entregableHito");
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
        Schema::dropIfExists('ejecucion_planificacion');
    }
};
