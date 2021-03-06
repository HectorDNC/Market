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
            url: GLOBAL.URL+"venta/listar"
        },
        columns: [
            { data: 'codigo' },
            { data: "fecha" },
            { data: 'cliente' },
            { data: 'button' },
            { data: 'estado' }
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

    const buscarVenta = (url) => {
        $.ajax({
            type: "POST",
            url: url,        
            success: function (response) {
                console.log(response);
                json = JSON.parse(response);
                console.log(JSON.parse(response));

                $('#numero_venta').val(json.venta.codigo);
                $('#nombre_cliente').val(json.venta.cliente);
                $('#rif_cliente').val(json.venta.rif_cliente);
                $('#direccion_cliente').val(json.venta.direccion);
                $('#metodoPago').val(json.venta.metodo_pago);
                $('#montoPago').val(parseFloat(json.venta.monto_pago).toFixed(2));
                $('#notaPago').html(json.venta.nota_pago);

                $('#cuerpo').empty();
                $('#cuerpoPagos').empty();
                
                let subtotal = 0;
                var total = 0, totalBss = 0;
                var dolar = json.dolar;

                json.productos.forEach( element => {
                    total += element.cantidad * element.precio;
                    subtotal += element.cantidad * element.precio;

                    let row = `
                        <tr>
                            <td>${element.cantidad}</td>
                            <td>${element.codigo}</td>
                            <td>${element.nombre}</td>
                            <td>${element.precio}</td>
                            <td>${parseFloat(element.precio * element.cantidad).toFixed(2)}</td>
                            <td>${parseFloat(element.precio * element.cantidad * dolar).toFixed(2)}</td>
                        </tr>
                    `;

                    
                    $('#cuerpo').append(row);
                    
                });
                json.pagos.forEach( element => {

                    let row = `
                        <tr>
                            <td>${element.metodo}</td>
                            <td>${element.monto}</td>
                        </tr>
                    `;

                    
                    $('#cuerpoPagos').append(row);
                    
                });
                total = parseFloat(total).toFixed(2);
                totalBss = total*dolar;
                totalBss = parseFloat(totalBss).toFixed(2);
            
                $('#total').html(`${total} $ <br> ${totalBss} BSS`);

                
                
                $('#modalDetalleVenta').modal('show');

            },
            error: function (response) {
                console.log(response);
            }
        });
    }

    const cambiarEstatus = (id) => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"venta/cambiarEstatus/" + id,
            success: function (response) {
                json = JSON.parse(response);

                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );

                table.ajax.reload();
            },
            error: function (response) {
                console.log(JSON.parse(response));
            }
        });
    }
    const abrirCaja = () => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"venta/abrirCaja/",
            success: function (response) {
                json = JSON.parse(response);
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
                
                location.reload();
            },
            error: function (response) {
                console.log(JSON.parse(response));
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
            }
        });
    }
    const reabrirCaja = () => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"venta/reabrirCaja/",
            success: function (response) {
                json = JSON.parse(response);
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
                
                $("#modalInfoCaja").modal('hide');
            },
            error: function (response) {
                console.log(JSON.parse(response));
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
            }
        });
    }
    const cerrarCaja = () => {
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"venta/cerrarCaja/",
            success: function (response) {
                json = JSON.parse(response);
                $("#cuerpoInfoCaja").find("#desde").text(json.desde);
                $("#cuerpoInfoCaja").find("#hasta").text(json.hasta);
                $("#cuerpoInfoCaja").find("#total").text(json.total);
                $("#formularioReporte").find("#desde").val(json.apertura);
                $("#formularioReporte").find("#hasta").val(json.cierre);
                $("#formularioReporte").find("#vendedor").val(json.vendedor);
                $("#modalInfoCaja").modal('show');
                
                $("#modalInfoCaja").on('click', function () { 
                    if(!$("#modalInfoCaja").hasClass('show')){
                        location.reload();
                    }
                 });
                $("#cerrarInfoCaja").on('click', function(){
                    $("#modalInfoCaja").modal('hide');
                    location.reload();
                });
                $("#reporteCaja").on('click', function(){
                    $("#formularioReporte").submit();
                });
            },
            error: function (response) {
                console.log(JSON.parse(response));
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
            }
        });
    }

    
   
    /**
     * EVENTOS
     */
    
    $('body').on('click', '.mostrar', function (e) {
        e.preventDefault();

        $url = $(this).attr('href');

        buscarVenta($url);
    });

    $('body').on('click', '.estatus', function (e) {
        e.preventDefault();

        $url = $(this).attr('href');

        Swal.fire({
            title: 'Esta Seguro?',
            text: "Cambiara el estatus de la venta seleccionada y el stock de productos sera afectado",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Cambiar!'
            }).then((result) => {
                if (result.value) {
                    cambiarEstatus($url);
                    
                }
            })

    });
    $('body').on('click', '#abrirCaja', function (e) {
        e.preventDefault();

        Swal.fire({
            title: 'Est?? Seguro?',
            text: "Desea abrir la Caja?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Abrir!'
            }).then((result) => {
                if (result.value) {
                    abrirCaja();
                    
                }
            });

    });
    $('body').on('click', '#reabrirCaja', function (e) {
        e.preventDefault();

        Swal.fire({
            title: 'Est?? Seguro?',
            text: "Desea reabrir la Caja?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Reabrir!'
            }).then((result) => {
                if (result.value) {
                    reabrirCaja();
                    
                }
            });

    });
    
    $('body').on('click', '#cerrarCaja', function (e) {
        e.preventDefault();
        
        Swal.fire({
            title: 'Est?? Seguro?',
            text: "Desea cerrar la Caja?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Cerrar!'
            }).then((result) => {
                if (result.value) {
                    cerrarCaja();
                    
                }
            });

    });
    
    
});