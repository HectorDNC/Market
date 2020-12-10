$(document).ready(function() {

    $('#loginForm').on('submit', function(e) {
        e.preventDefault();

        let data = new FormData(this);

        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"login/login",
            cache: false,
            data: data,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);
                window.location = '/';
                window.location.reload();
            },
            error: (response) => {
                console.log(response);
                Swal.fire(
                    "¡Usuario o contraseña incorrecta!",
                    "Por favor verifique el usuario y la contraseña",
                    "error"
                );
            }
        });
        Toast.fire({
            title: 'Espere por favor!',
            html: 'Los datos están siendo procesados',// add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
        });
    });

    const Toast = Swal.mixin({
        toast: true,
        position: 'bottom-start',
        showConfirmButton: false,
        
      });
    
});