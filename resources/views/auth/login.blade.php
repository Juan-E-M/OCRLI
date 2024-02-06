<!DOCTYPE html>
<html lang="en">
    <head>
        <title>OC RLI</title>
        <link href="{{ asset('css/login.css') }}" rel="stylesheet">
    </head>
    <body>
        <form action="{{ route('login') }}" method="POST" class="formLogin">
            <img src="{{ asset('img/ocRli.jpg') }}" class="center" alt="Img OC ACI">
            <h4 class="tituloLogin">Iniciar sesión</h4>
            <input type="hidden" name="_token" value="{{ csrf_token() }}" />

            <label for="username" class="labelLogin">Usuario</label>
            <input type="text" class="inputLogin" tabindex="1" id="username" name="username">

            <label for="password" class="labelLogin">Contraseña</label>
            <input type="password" class="inputLogin" tabindex="2" id="password" name="password">

            <button type="submit" class="buttonLogin" id="btnIngresar">Ingresar</button>
        </form>
    </body>
</html>

