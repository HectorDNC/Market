$(document).ready(function () {

/**
 * DataTable
 */

let table = $('#datatable').DataTable({
    serverSide: false,
    ordering: false,
    searching: true,
    ajax: {
        method: 'POST',
        url: '/WorldComputer/dolar/listar'
    },
    columns: [
        { data: 'nombre' },
        { data: "precio" },
        { data: 'button' }
    ],

    language: { 
                "decimal":        "",
                "emptyTable":     "No hay Registros Disponibles",
                "info":           "Mostrando _START_ de _END_ para _TOTAL_ Entradas",
                "infoEmpty":      "Mostrando 0 de 0 para 0 Entradas",
                "infoFiltered":   "(Filtrado de _MAX_ Entradas en Total)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing":     "Procesando...",
                "search":         "Buscar:",
                "zeroRecords":    "No se encontraron coincidencias",
                "paginate": {
                    "first":      "Primero",
                    "last":       "Ultimo",
                    "next":       "Siguiente",
                    "previous":   "Atras"
                },
                "aria": {
                    "sortAscending":  ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                }
    }
});



/**
 * FUNCIONES
 */

const mostrarDolar = (href, formulario, modal) => {

    $.ajax({
        type: "POST",
        url: href,
        success: function (response) {
            let json = JSON.parse(response);

            console.log(json);

            $(formulario).find('input#id').val(json.data.id);
            $(formulario).find('input#nombre').val(json.data.nombre);
            $(formulario).find('textarea#precio').val(json.data.precio);

 

            $(modal).modal('show');
            

        },
        error: (response) => {
            console.log(response);
        }
    });
}

const registrarDolar = (datos) => {

    $.ajax({
        type: "POST",
        url: "/WorldComputer/dolar/guardar",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        success: function (response) {
            let json = JSON.parse(response);
            
            if( json.tipo == 'success'){

                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
    
                table.ajax.reload();
    
                $('#modalRegistroDolar').modal('hide');
                $('#formularioRegistrarDolar').trigger('reset');
            }else{
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
            }

        },
        error: (response) => {
            console.log(response);
            
        }
    });



    // fetch('/WorldComputer/categoria/guardar', { method: 'POST', body: datos })
    // .then((response) => {
    //     console.log(response);
    //     return response.json();
    // })
    // .then((json) => {
    //     Swal.fire(
    //         json.titulo,
    //         json.mensaje,
    //         json.tipo
    //     )

    //     table.ajax.reload();
    //     
    // })
    // .catch( (response) => {
    //     console.log(response);
    // });
}
 
const actualizarDolar = (datos) => {
    $.ajax({
        type: "POST",
        url: "/WorldComputer/dolar/actualizar",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        success: function (response) {
            let json = JSON.parse(response);
            
            if( json.tipo == 'success'){

                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
    
                table.ajax.reload();
    
                $('#modalActualizarDolar').modal('hide');
            }else{
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
            }
        },
        error(response){
            console.log(response);
        }
    });
}

const eliminarDolar = (id) => {
    $.ajax({
        type: "DELETE",
        url: "/WorldComputer/dolar/eliminarTotal/" + id,
        success: function (response) {
            const json = JSON.parse(response);
            if(json.tipo == 'success'){
                Swal.fire(
                    'Eliminado!',
                    'El registro ha sido eliminado!',
                    'success'
                    )

                table.ajax.reload();
            }
        },
        error: function (response) {
            console.log(response);
        }
    });
}

/**
 * Eventos
 */

$('#formularioRegistrarDolar').submit(function (e) { 
        e.preventDefault();

        let datos = new FormData(document.querySelector('#formularioRegistrarDolar'));
    //  console.log(datos.get('documento'));

        registrarDolar(datos);   
});

// Mostrar Categoria
$('body').on('click', '.mostrar', function (e) { 
    e.preventDefault();

    mostrarDolar($(this).attr('href'),'form#formularioMostrarDolar','#modalMostrarDolar');
});

// Editar Categoria

$('body').on('click', '.editar', function (e) {
    e.preventDefault();
    console.log($(this).attr('href'));

    mostrarDolar($(this).attr('href'), 'form#formularioActualizarDolar', '#modalActualizarDolar');
});

$('#formularioActualizarDolar').submit(function (e) {
    e.preventDefault();

    const datos = new FormData(document.querySelector('#formularioActualizarDolar'));

    // console.log(datos.get('id'));
    actualizarDolar(datos);
});


// Eliminar Dolar
$('body').on('click', '.eliminar', function (e) {
    e.preventDefault();

    Swal.fire({
        title: 'Esta Seguro?',
        text: "El categoria sera eliminado del sistema!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, eliminar!'
        }).then((result) => {
        if (result.value) {

            eliminarDolar($(this).attr('href'));
            
        }
        })
    console.log($(this).attr('href'));
});

});
