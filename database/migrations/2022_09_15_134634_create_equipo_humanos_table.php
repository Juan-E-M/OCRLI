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
        Schema::create('equipo_humano', function (Blueprint $table) {
            $table->id();
            $table->string("nombresApellidos");
            $table->string("cargo");
            $table->string("funcionesPrincipales");
            $table->string("correoElectronico");
            $table->string("numeroCelular");
            $table->foreignId('idRegistro')->constrained('registro');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('equipo_humano');
    }
};
