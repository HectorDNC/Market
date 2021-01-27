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
        url: GLOBAL.URL+'usuario/listarAsistencia'
    },
    columns: [
        { data: 'documento' },
        { data: "nombre" },
        { data: "fecha" },
        // { data: 'button' }
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

// const marcarInasistencia = (id) => {
//     $.ajax({
//         type: "DELETE",
//         url: GLOBAL.URL+"usuario/marcarInasistencia/" + id,
//         success: function (response) {
//             const json = JSON.parse(response);
//             if(json.tipo == 'success'){
//                 Toast.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                   )

//                 table.ajax.reload();
//             }
//         },
//         error: function (response) {
//             console.log(response);
//         }
//     });
// }

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
        
    table.ajax.url(GLOBAL.URL+"usuario/listarAsistencia/"+$(this).val());
    console.log(table.ajax.url());
    
    table.ajax.reload();


});
// // Eliminar Asistencia
// $('body').on('click', '.inasistencia', function (e) {
//     e.preventDefault();

//     Swal.fire({
//         title: 'Está Seguro?',
//         text: "El usuario será marcado como inasistente!",
//         type: 'warning',
//         showCancelButton: true,
//         confirmButtonColor: '#3085d6',
//         cancelButtonColor: '#d33',
//         cancelButtonText: 'Cancelar',
//         confirmButtonText: 'Si, eliminar!'
//       }).then((result) => {
//         if (result.value) {

//             marcarInasistencia($(this).attr('href'));
          
//         }
//       })
//     console.log($(this).attr('href'));
// });
// $('body').on('click', '.asistencia', function (e) {
//     e.preventDefault();
//     $.ajax({
//         type: "POST",
//         url: GLOBAL.URL+"usuario/marcarAsistencia/",
//         data: {
//             'id': $(this).attr("href"),
//             'fecha': $("#fechaAsistencia").val()
//         },
//         success: function (response) {
//             const json = JSON.parse(response);
//             if(json.tipo == 'success'){
//                 Toast.fire(
//                     json.titulo,
//                     json.mensaje,
//                     json.tipo
//                   )

//                 table.ajax.reload();
//             }
//         },
//         error: function (response) {
//             console.log(response);
//         }
//     });
    
// });

});
