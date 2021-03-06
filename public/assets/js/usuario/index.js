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
            url: GLOBAL.URL+"Usuario/listar"
        },
        columns: [
            { data: 'documento' },
            { data: "nombre" },
            { data: 'usuario' },
            { data: 'rol' },
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

    const cargarRoles = () => {
        $.ajax({
            type: "POST",
            url: href,
            success: function (response) {
                let json = JSON.parse(response);
    
                if(modal == '#modalActualizarUsuario'){
                    let doc = json.data.documento.split('-');
                    let inicial = doc[0];
                    let documento = doc[1];
    
                    console.log(doc);
                    $(formulario).find('input#documento').val(documento);
                    $(formulario).find('select#inicial_documento').val(inicial);
    
                }else{
                    $(formulario).find('input#documento').val(json.data.documento);
    
                }
    
                $(formulario).find('input#id').val(json.data.id);
                $(formulario).find('input#nombre').val(json.data.nombre);
                $(formulario).find('input#apellido').val(json.data.apellido);
                $(formulario).find('input#telefono').val(json.data.telefono);
                $(formulario).find('input#correo').val(json.data.email);
                $(formulario).find('input#direccion').val(json.data.direccion);
    
                $(modal).modal('show');
                
            },
            error: (response) => {
                console.log(response);
            }
        });
    }
    
    const mostrarUsuario = (href, formulario, modal) => {
        $.ajax({
            type: "POST",
            url: href,
            success: function (response) {
                let json = JSON.parse(response);
            
                if(modal == '#modalActualizarUsuario'){
                    let doc = json.data.documento.split('-');
                    let inicial = doc[0];
                    let documento = doc[1];
    
                    console.log(doc);
                    $(formulario).find('input#documento').val(documento);
                    $(formulario).find('select#inicial_documento').val(inicial);
                    $(formulario).find('select#rolUsuario').val(json.data.rol_id);
                    $(formulario).find('input#contrasena').val("");
                    $(formulario).find('input#confirmarContrasena').val("");
    
                }else{
                    $(formulario).find('input#documento').val(json.data.documento);
    
                }
    
                $(formulario).find('input#id').val(json.data.id);
                $(formulario).find('input#nombre').val(json.data.nombre);
                $(formulario).find('input#apellido').val(json.data.apellido);
                $(formulario).find('input#telefono').val(json.data.telefono);
                $(formulario).find('input#correo').val(json.data.email);
                $(formulario).find('input#direccion').val(json.data.direccion);
                $(formulario).find('input#usuario').val(json.data.usuario);
                
    
                $(modal).modal('show');
    
            },
            error: function(response) {
             console.log(response.getAllResponseHeaders())
         }
        });
    }
    
    const registrarUsuario = (datos) => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"Usuario/guardar",
            data: datos,
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
        
                    $('#modalRegistroUsuario').modal('hide');
                    $('#formularioRegistrarUsuario').trigger('reset');
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

    
        // fetch('/WorldComputer/cliente/guardar', { method: 'POST', body: datos })
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
    
    const actualizarUsuario = (datos) => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"Usuario/actualizar",
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
        
                    $('#modalActualizarUsuario').modal('hide');
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
    
    const eliminarUsuario = (id) => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"Usuario/eliminar/" + id,
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
                else{
                    Swal.fire(
                        json.titulo,
                        json.mensaje,
                        json.tipo
                      )
                }
            },
            error: function (response) {
                console.log(response);
            }
        });
    }
    const habilitar = (id) => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"usuario/habilitar/" + id,
            success: function (response) {
                const json = JSON.parse(response);
                if(json.tipo == 'success'){
                    Swal.fire(
                        'Activado!',
                        'El usuario ha sido habilitado!',
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
    
    $('#formularioRegistrarUsuario').submit(function (e) { 
        e.preventDefault();
    
        let datos = new FormData(document.querySelector('#formularioRegistrarUsuario'));
        
        if(datos.get('contrasena')==datos.get('confirmarContrasena')){
            registrarUsuario(datos); 
        }
        else{
            Swal.fire(
                "Error",
                "Las Contrase??as no coinciden",
                "warning"
            );
        }
    
    });
    
    // Mostrar Usuario
    $('body').on('click', '.mostrar', function (e) { 
        e.preventDefault();
    
        mostrarUsuario($(this).attr('href'),'form#formularioMostrarUsuario','#modalMostrarUsuario');
    });
    
    // Editar Usuario
    
    $('body').on('click', '.editar', function (e) {
        e.preventDefault();
        console.log($(this).attr('href'));
    
        mostrarUsuario($(this).attr('href'), 'form#formularioActualizarUsuario', '#modalActualizarUsuario');
    });
    
    $('#formularioActualizarUsuario').submit(function (e) {
        e.preventDefault();
    
        const datos = new FormData(document.querySelector('#formularioActualizarUsuario'));
    
        if(datos.get('contrasena')==datos.get('confirmarContrasena')){
            actualizarUsuario(datos);
        }
        else{
            Swal.fire(
                "Error",
                "Las Contrase??as no coinciden",
                "warning"
            );
        }
        
    });
    
    
    // Eliminar Usuario
    $('body').on('click', '.eliminar', function (e) {
        e.preventDefault();
    
        Swal.fire({
            title: 'Esta Seguro?',
            text: "El usuario sera eliminado del sistema!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, eliminar!'
          }).then((result) => {
            if (result.value) {
    
                eliminarUsuario($(this).attr('href'));
              
            }
          })
    });
    //Activar el registro
    $('body').on('click', '.estatusAnulado', function (e) {
        e.preventDefault();
    
        Swal.fire({
            title: 'Esta Seguro?',
            text: "El usuario ser?? habilitado en el sistema!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, eliminar!'
            }).then((result) => {
            if (result.value) {
    
                habilitar($(this).attr('href'));
                
            }
            })
        console.log($(this).attr('href'));
    });
    
    });
    