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
        Schema::create('registro', function (Blueprint $table) {
            $table->id();
            $table->string("institucion");
            $table->string("programa");
            $table->string("ubicacionGeografica");
            $table->string("RUC");
            $table->string("paginaWebInstitucion")->nullable();
            $table->string("paginaWebPrograma")->nullable();
            $table->text("observaciones")->nullable();
            $table->string("fechaInicio");
            $table->string("fechaAutoevaluacion");
            $table->string("fechaEnvio");
            $table->foreignId('idUsuario')->constrained('users');
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
        Schema::dropIfExists('registro');
    }
};
