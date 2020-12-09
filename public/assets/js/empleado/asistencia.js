$(document).ready(function () {
    
/**
 * DataTable
 */

let table = $('#datatableAsistencia').DataTable({
    serverSide: false,
    ordering: false,
    searching: true,
    ajax: {
        method: 'POST',
        url: GLOBAL.URL+'empleado/listarAsistencia'
    },
    columns: [
        { data: 'documento' },
        { data: "nombre" },
        { data: "fecha" },
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

// const mostrarEmpleado = (href, formulario, modal) => {

//     $.ajax({
//         type: "POST",
//         url: href,
//         success: function (response) {
//             let json = JSON.parse(response);

//             if(modal == '#modalActualizarEmpleado'){
//                 let doc = json.data.documento.split('-');
//                 let inicial = doc[0];
//                 let documento = doc[1];

//                 console.log(doc);
//                 $(formulario).find('input#documento').val(documento);
//                 $(formulario).find('select#inicial_documento').val(inicial);

//             }else{
//                 $(formulario).find('input#documento').val(json.data.documento);

//             }


//             $(formulario).find('input#id').val(json.data.id);
//             $(formulario).find('input#nombre').val(json.data.nombre);
//             $(formulario).find('input#apellido').val(json.data.apellido);
//             $(formulario).find('input#telefono').val(json.data.telefono);
//             $(formulario).find('input#correo').val(json.data.email);
//             $(formulario).find('input#direccion').val(json.data.direccion);
//             $(formulario).find('input#cargo').val(json.data.cargo);

//             $(modal).modal('show');
            

//         },
//         error: (response) => {
//             console.log(response);
//         }
//     });
// }

// const registrarEmpleado = (datos) => {

//     $.ajax({
//         type: "POST",
//         url: GLOBAL.URL+"empleado/guardar",
//         data: datos,
//         cache: false,
//         contentType: false,
//         processData: false,
//         success: function (response) {
//             let json = JSON.parse(response);
            
//             if( json.tipo == 'success'){

//                 Swal.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                 );
    
//                 table.ajax.reload();
    
//                 $('#modalRegistroEmpleado').modal('hide');
//                 $('#formularioRegistrarEmpleado').trigger('reset');
//             }else{
//                 Swal.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                 );
//             }

//         },
//         error: (response) => {
//             console.log(response);
            
//         }
//     });



//     // fetch(GLOBAL.URL+'empleado/guardar', { method: 'POST', body: datos })
//     // .then((response) => {
//     //     console.log(response);
//     //     return response.json();
//     // })
//     // .then((json) => {
//     //     Swal.fire(
//     //         json.titulo,
//     //         json.mensaje,
//     //         json.tipo
//     //     )

//     //     table.ajax.reload();
//     //     
//     // })
//     // .catch( (response) => {
//     //     console.log(response);
//     // });
// }

// const actualizarEmpleado = (datos) => {
//     $.ajax({
//         type: "POST",
//         url: GLOBAL.URL+"empleado/actualizar",
//         data: datos,
//         cache: false,
//         contentType: false,
//         processData: false,
//         success: function (response) {
//             let json = JSON.parse(response);
            
//             if( json.tipo == 'success'){

//                 Swal.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                 );
    
//                 table.ajax.reload();
    
//                 $('#modalActualizarEmpleado').modal('hide');
//             }else{
//                 Swal.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                 );
//             }
//         },
//         error(response){
//             console.log(response);
//         }
//     });
// }

const marcarInasistencia = (id) => {
    $.ajax({
        type: "DELETE",
        url: GLOBAL.URL+"empleado/marcarInasistencia/" + id,
        success: function (response) {
            const json = JSON.parse(response);
            if(json.tipo == 'success'){
                Toast.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                  )

                table.ajax.reload();
            }
        },
        error: function (response) {
            console.log(response);
        }
    });
}

const Toast = Swal.mixin({
    toast: true,
    position: 'bottom-start',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: false,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })


$("#fechaAsistencia").change(function(){
        
    table.ajax.url(GLOBAL.URL+"empleado/listarAsistencia/"+$(this).val());
    console.log(table.ajax.url());
    
    table.ajax.reload();


});
// Eliminar Asistencia
$('body').on('click', '.inasistencia', function (e) {
    e.preventDefault();

    Swal.fire({
        title: 'Está Seguro?',
        text: "El empleado será marcado como inasistente!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancelar',
        confirmButtonText: 'Si, eliminar!'
      }).then((result) => {
        if (result.value) {

            marcarInasistencia($(this).attr('href'));
          
        }
      })
    console.log($(this).attr('href'));
});
$('body').on('click', '.asistencia', function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: GLOBAL.URL+"empleado/marcarAsistencia/",
        data: {
            'id': $(this).attr("href"),
            'fecha': $("#fechaAsistencia").val()
        },
        success: function (response) {
            const json = JSON.parse(response);
            if(json.tipo == 'success'){
                Toast.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                  )

                table.ajax.reload();
            }
        },
        error: function (response) {
            console.log(response);
        }
    });
    
});

});
