@extends('layouts.app')

@section('content')
    <div>
        <img src="{{ asset('img/imagenOCRLI.jpg') }}" width="100%" height="100%" alt="Img OC RLI">
    </div>
    <script>
        $(document).ready(function() {
            if ('{{ $mostrarPopUp }}' === 'Si') {
                Swal.fire({
                    position: 'top-end',
                    icon: 'warning',
                    title: 'Se recomienda cambiar la contraseña por defecto que le entrego el administrador.',
                    showConfirmButton: false,
                    timer: 3000
                });
            }
        });
    </script>
@endsection
