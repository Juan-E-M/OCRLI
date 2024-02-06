<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class examen_respuestas extends Model
{
    public $idExamen;
    public $pregunta;
    public $valor;
}
