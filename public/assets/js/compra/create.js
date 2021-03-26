$(document).ready(function () {

    /**
     * FUNCIONES
     */
    
    const buscarProducto = (codigo) => {

        let producto = productos.find( element => element.codigo === codigo);

        return producto;
    }

    const buscarProveedor = (documento) => {

        let proveedor = proveedores.find( element => element.documento === documento);

        return proveedor;
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
            url: GLOBAL.URL+"compra/productosPorCategoria",
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
                    <input type="number" step="any" name="cantidades[]" class="form-control cantidad pl-1 pr-0" value="1" min="1"" required>
                </td>
                <td>
                    <input type="text" class="form-control-plaintext" value="${producto.stock}" disabled>
                </td>
                <td>
                    <input type="number" step="any" name="precios[]" class="form-control precio pl-1 pr-0" required>
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
        let totalBss = total*dolar;
        
        row.find('.total').val(total);
        row.find('.totalBss').val(totalBss);

        let elementos = document.querySelectorAll('.total');

        total = 0;

        elementos.forEach(element => {
            total = parseFloat(total) + parseFloat(element.value);
        })
        totalBss = total*dolar;
        $('#totalVenta').val(`${total} $ - ${totalBss} BSS`);    
    
    });

    // Eliminar Articulo de la Lista
    $('tbody').on('click', '.eliminar',function (e) { 
        e.preventDefault();
        
        $(this).parents('tr').remove();

    });

    //Agregar Proveedor
    $('#agregarProveedorCompra').click(function (e) { 
        e.preventDefault();
        if($('#listadoProveedores').val() == '' || $('#listadoProveedores').val() == null){
            Toast.fire(
                'Seleccione un Proveedor',
                'Debe incluir un proveedor en la compra',
                'warning'
            )
    
            return false;
        }
        Toast.fire(
            'Proveedor agregado!',
            'Se ha seleccionado un proveedor correctamente',
            'success'
        )

        let proveedor = buscarProveedor($('#listadoProveedores').val());

        $('#proveedor').val(proveedor.id);
        $('#documentoProveedor').val(proveedor.documento);
        $('#nombreProveedor').val(proveedor.razon_social);

        console.log(proveedor);
        
    });

    $('#formularioCompra').submit(function (e){
        e.preventDefault();
        var button = $(this).find("[type='submit']");
        button.attr("disabled",true);
        setTimeout(() => {
            button.removeAttr("disabled");
        }, 1000);
        /**
         * Proveedor
         */
    
        if($('#proveedor').val() == '' || $('#proveedor').val() == null){
            Swal.fire(
                'Seleccione un Proveedor',
                'Debe incluir un proveedor en la compra',
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
                'Compra Vacia',
                'Debe selecciona al menos un articulo',
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