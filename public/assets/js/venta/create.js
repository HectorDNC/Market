$(document).ready(function () {
    
    /**
     * FUNCIONES
     */
    
    const buscarProducto = (codigo) => {

        let producto = productos.find( element => element.codigo === codigo);

        return producto;
    }

    const buscarCliente = (documento) => {

        let cliente = clientes.find( element => element.documento === documento);

        return cliente;
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

    // Obtener precio del Dolar
    $.ajax({
        type: "POST",
        url: GLOBAL.URL+"dolar/obtenerDolar",
        success: function (response) {
            console.log(response);
            json = JSON.parse(response);
            dolar = json.data.precio;
            console.log(json);
        },
        error: function (response) {
            console.log(response);
        }
    });
    /**
     * FIN
     */

    /**
     * Eventos
     */

    $('#listadoProductos').change(function (e) { 
        e.preventDefault();
        
        let producto = buscarProducto($(this).val());

        $('#nombreProducto').val(producto.nombre);
        $('#stockProducto').val(producto.stock);
    });
    $('#listadoCategorias').change(function (e) { 
        // e.preventDefault();
        
        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"venta/productosPorCategoria",
            data: {'categoria': this.value},
            success: function (response) {
                console.log(response);
                json = JSON.parse(response);
                categ = json.data;
                console.log(json);
                let select = document.querySelector('#listadoProductos');
                select.innerHTML = "";
                categ.forEach((element) => {
                    option = document.createElement('option');
                    option.value = element.codigo;
                    option.innerHTML = element.codigo + " - " + element.nombre;
                    select.append(option);
                });
            },
            error: function (response) {
                console.log(response);
            }
        });
    });



    $('#agregarProducto').click(function (e) { 
        e.preventDefault();

        
        let producto = buscarProducto($('#listadoProductos').val());
        
        Toast.fire(
            producto.nombre + ' Agregado',
            'Producto Agregado correctamente',
            'success'   
        )
        // <td>
        //             <input type="text" name="productos[]" class="form-control-plaintext" value="${producto.id}" hidden>
        //             <input type="text" name="" class="form-control-plaintext" value="${producto.codigo}" disabled>
        // </td>
        let fila = `
            <tr>
                                
                <td>
                    <input type="text" name="productos[]" class="form-control-plaintext" value="${producto.id}" hidden>
                    <input type="text" class="form-control-plaintext" value="${producto.nombre}" disabled>     
                </td>
                <td>
                    <input type="text" class="form-control-plaintext" value="${producto.stock}" disabled>
                </td>
                <td>
                    <input type="number" step="any" name="cantidades[]" class="form-control pl-1 pr-0 cantidad" value="0" min="1" max="${producto.stock}" required>
                </td>
                
                <td>
                    <input type="number" class="form-control-plaintext" value="${producto.precio_venta}" disabled>
                    <input type="number" name="precios[]" class="form-control precio" value="${producto.precio_venta}" hidden required>

                </td>
                <td>
                    <input type="number" class="form-control-plaintext total" value="0" disabled>
                </td>
                <td>
                    <input type="number" class="form-control-plaintext totalBss" value="0" disabled>
                </td>
                <td>
                    <button class="btn btn-danger eliminar"><i class="fas fa-trash-alt text-white"></i></button>
                </td>
            </tr>`;

        $('#cuerpo').append(fila);
        $('#listadoProductos').val('');

    });


    // Cambio en input de labla de productos
    $('#tproductos').on('change', 'input', function(e){
        e.preventDefault();
        // alert('funciona');

        let row = $(this).closest('tr');
        let total = row.find('.cantidad').val() * row.find('.precio').val();
        let totalBss = total * dolar;
        row.find('.total').val(total.toFixed(2));
        row.find('.totalBss').val(totalBss.toFixed(2));

        let elementos = document.querySelectorAll('.total');

        total = 0;

        elementos.forEach(element => {
            total = parseFloat(total) + parseFloat(element.value);
        })

        
        
        $('#subtotal').val(total.toFixed(2));
        totalNeto = total;
        totalNetoBss = totalNeto*dolar;
        $('#totalVenta').val(`${totalNeto} $ - ${totalNetoBss} BSS`);  
        $('#montoPago').val(totalNeto);  
    
    });
    // Eliminar Articulo de la Lista
    $('tbody').on('click', '.eliminar',function (e) { 
        e.preventDefault();
        
        $(this).parents('tr').remove();

    });
    $('tbody').on('click', '.eliminarPago',function (e) { 
        e.preventDefault();
        
        Swal.fire(
            'Alerta',
            'Debe incluir al menos un método de pago',
            'warning'
        )

    });
    
    //Agregar Cliente
    $('#agregarCliente').click(function (e) { 
        e.preventDefault();
        if($('#listadoClientes').val() == '' || $('#listadoClientes').val() == null){
            Toast.fire(
                'Seleccione un Cliente',
                'Debe incluir un cliente en la Venta',
                'warning'
            )
    
            return false;
        }
        Toast.fire(
            'Cliente agregado!',
            'Se ha seleccionado un cliente correctamente',
            'success'
        )

        let cliente = buscarCliente($('#listadoClientes').val());

        $('#cliente').val(cliente.id);
        $('#documentoCliente').val(cliente.documento);
        $('#nombreCliente').val(cliente.nombre);

        console.log(cliente);
        
    });

    $("#agregarMetodoPago").click(function (e) {
        e.preventDefault();
        let fila = `
            <tr>
                <td> 
                    <select class="form-control" name="metodoPago[]" required>
                        <option value="EFECTIVO">EFECTIVO</option>
                        <option value="PUNTO DE VENTA">PUNTO DE VENTA</option>
                        <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                        <option value="PAGO MÓVIL">PAGO MÓVIL</option>
                    </select> 
                </td>
                <td> 
                    <input type="number" step="any" min="0.01" class="form-control" name="montoPago[]" required> 
                </td>
                <td>
                    <button class="btn btn-danger eliminar"><i class="fas fa-trash-alt text-white"></i></button>
                </td>
            </tr>
        `;
        $("#cuerpoPagos").append(fila);
    });
    $('#formularioCompra').submit(function (e){
        e.preventDefault();
    
        /**
         * Cliente
         */
    
        if($('#cliente').val() == '' || $('#cliente').val() == null){
            Swal.fire(
                'Seleccione un Cliente',
                'Debe incluir un cliente en la Venta',
                'warning'
            )
    
            return false;
        }
    
        /**
         * Total Venta
         */
    
        let form = $(this)
    
        let totalfilas = document.querySelectorAll('.total');
        let total = 0;
        
    
        totalfilas.forEach(element => {
                // console.log(element);
                total += parseFloat(element.value);
        });    


        if(total == 0){
            Swal.fire(
                'Venta Vacia',
                'Debe seleccionar al menos un articulo',
                'warning'
            )
    
            return false;
        }

      
    
        $('#total').val(total);
    
        console.log(total)
    
    
        
        $.ajax({
            type: "POST",
            url: form.attr('action'),
            data: form.serialize(),
            success: function (response) {
                console.log(response);
               json = JSON.parse(response);
                console.log(json);

                
                Swal.fire(
                    json.titulo,
                    json.mensaje,
                    json.tipo
                );
                setTimeout(function(){
                    window.location = "./";
                },1000);
            },
            error: function (response) {
                console.log(response);
            }
        });
    })
    
});
