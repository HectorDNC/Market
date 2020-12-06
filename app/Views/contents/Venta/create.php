
<div class="content p-42">

      <!-- Modal Registro Cliente -->
    <div class="modal fade" id="modalRegistroCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="card">
                    <div class="card-header">
                            <h2 class="text-center">Registrar Cliente</h2>
                    </div>
                    <div class="card-body">
                        <form action="#" method="POST" enctype="multipart/form-data" id="formularioRegistrarCliente">
                        <div class="row form-group">
                                <input  name="id" id="id" hidden>
                                <label for="nombre" class="col-form-label col-md-2">Nombre Completo:</label>
                                <div class="col-md-4 ">
                                    <input type="text" name="nombre" id="nombre" pattern="[A-Za-z ]+" title="Ingrese solo letras" maxlength="45" required="required" class="form-control" placeholder="Nombre">
                                </div> 

                                <label for="cedula_cliente" class="col-form-label col-md-2">Cedula/RIF:</label>
                                <div class="col-md-1 ">
                                    <select class="form-control pl-0 pr-0" name="inicial_documento" id="inicial_documento" required="">
                                        <option value="" selected="">-</option>
                                        <option value="V">V</option>
                                        <option value="E">E</option>
                                        <option value="J">J</option>
                                        <option value="G">G</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <input type="text" pattern="[0-9]{6,8}" name="documento" id="documento" minlength="6" maxlength="8" title="Ingrese entre 6 y 8 digitos" class="form-control" placeholder="Identificaion" required="">
                                </div>
                            </div>

                           
                            <div class="row form-group">
                                <label for="direccion" class="col-form-label col-md-2">Direccion:</label>
                                <div class="col-md-6">
                                    <input type="text" name="direccion" id="direccion" pattern="[A-Za-z0-9/ ]+" required maxlength="150" class="form-control" placeholder="Direccion" >
                                </div>
                            </div>

                            <hr class="bg-secondary">

                            <div class="row form-group justify-content-md-center">
                                <a href="#" class="btn btn-secondary m-2" data-dismiss="modal"><i class="fas fa-arrow-circle-left"></i> Cerrar</a>
                                <button type="submit"  class="btn btn-success m-2">Enviar</button>
                                <button type="reset" class="btn btn-danger m-2">Limpiar</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <form action="<?= ROOT;?>Venta/guardar" method="post" id="formularioCompra">
 
        <div class="card">
            <div class=" card-header bg-gray">
                <div class="row">
                    <div class="col"></div>
                    <div class="col">
                        <h3 class="text-center">Nueva Venta</h3>
                    </div>
                    <div class="col">
                        
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="form-row justify-content-end">
                    <label for="documento" class=" col-form-label col-md-2">
                        <strong>Nro Venta:</strong></label>
                    <div class="col-md-2">
                        <input type="text" value="<?= $numeroDocumento ?>" class="form-control-plaintext" disabled>
                    </div>
                </div>

                <!-- <div class="form-row justify-content-end">
                    <label for="" class="col-form-label col-md-2"><strong>Fecha:</strong></label>
                    <div class="col-md-2">
                        <input type="text" class="form-control-plaintext" disabled>
                    </div>
                </div>  -->

                <div class="row">
                    <div class="col">
                        <div class="card">

                            <div class="card-header">
                                <h4>Cliente</h4>
                            </div>
                    <button type="button" class="btn btn-primary w-50 mt-1 ml-auto mr-auto" data-toggle="modal" data-target="#modalRegistroCliente">
                        <i class="fas fa-plus-square"></i> Agregar Cliente
                    </button>

                            <div class="card-body">
                                <div class="row">
                                    <label for="cliente" class=" col-form-label col-md-2">
                                        <i class="fas fa-user-alt"></i>
                                        <span> <strong>Cliente</strong></span>
                                    </label>
    

                                    <div class="col-md-6 form-group">
                                        <select name="cliente" id="listadoClientes" class="form-control js-example-basic-single">
                                            <option value="">-</option>

                                            <?php 
                                                foreach($clientes as $cliente): 
                                            ?>

                                                <option value="<?= $cliente->documento; ?>"><?= $cliente->documento . " - " .$cliente->nombre; ?></option>

                                            <?php 
                                                endforeach; 
                                            ?>

                                        </select>
                                    </div>
           
                
                                    <div class="col-md-4 form-group">
                                        <button type="button" class="btn btn-block btn-success" id="agregarCliente" ><i class="fas fa-plus-circle"></i></button>
                                    </div>
                                </div>

                                
                                <div class="row form-row">
                                            
                                    <input type="text" name="cliente" id="cliente" hidden>

                                    <label for="cedula" class="col-form-label col-lg-2"><strong>Cedula | Rif</strong> </label>
                                    <div class="col-lg-10 form-group">
                                        <input type="text" class="form-control-plaintext" id="documentoCliente" disabled >    
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <label for="Nombre" class="col-form-label col-lg-2"><strong>Nombre:</strong> </label>
                                    <div class="col-lg-10 form-group">
                                        <input type="text" class="form-control-plaintext" name="nombre" id="nombreCliente" disabled >
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <hr class="bg-secondary">

                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h4>Producto</h4>
                            </div>
                            <div class="card-body">
                                <div class="row form-row">
                                    <label for="categorias" class="col-form-label col-lg-2"><strong>Categoría</strong> </label>
                                    <div class="col-lg-8 form-group">
                                
                                        <select id="listadoCategorias" class="form-control js-example-basic-single">
                                            <option value="0">TODAS</option>

                                            <?php 
                                                foreach($categorias as $categoria): 
                                            ?>

                                                <option value="<?= $categoria->id; ?>"><?= $categoria->nombre; ?></option>

                                            <?php 
                                                endforeach; 
                                            ?>

                                        </select>
                                    </div>
    
                                
                                </div>
                                <!-- Productos -->
                                <div class="row form-row">
                                    <label for="Nombre" class="col-form-label col-lg-2"><strong>Producto</strong> </label>
                                    <div class="col-lg-8 form-group">
                                
                                        <select id="listadoProductos" class="form-control js-example-basic-single">
                                            <option value="">-</option>

                                            <?php 
                                                foreach($productos as $producto): 
                                            ?>

                                                <option value="<?= $producto->codigo; ?>"><?= $producto->codigo . " - " .$producto->nombre; ?></option>

                                            <?php 
                                                endforeach; 
                                            ?>

                                        </select>
                                    </div>
    
                                    <div class="col-lg-2">
                                        <button class="btn btn-info" id="agregarProducto">
                                            <i class="fas fa-shopping-cart"></i> Agregar
                                        </button>
                                    </div>
                                </div>
    
                                <div class="row form-row">
                                    <label for="Direccion" class="col-form-label col-lg-2"><strong>Descripcion:</strong> </label>
                                    <div class="col-lg-7 form-group">
                                        <input type="text" class="form-control-plaintext" id="nombreProducto" disabled value="N/A">
                                    </div>
    
                                </div>
                                
                                <div class="row form-row">
                                    
                                    <label for="Direccion" class="col-form-label col-lg-1"><strong>Stock:</strong> </label>
                                    <div class="col-lg-2 form-group">
                                        <input type="text" class="form-control-plaintext" id="stockProducto" disabled value="N/A">
                                    </div>
                                </div>

    
                                
                            </div>
                        </div>
                    </div>
                </div>
              
                

                <hr class="bg-secondary">

                <div class="row form-row table-responsive">
                    
                        <table class="table table-striped" id="tproductos">
                            <thead class=" thead-dark">
                                <tr>
                                    <!-- <th scope="col">Codigo</th> -->
                                    <th>Descripcion</th>
                                    <th>Stock</th>    
                                    <th>Cantidad</th>                                    
                                    <th>Precio</th>
                                    <th>Total $</th>
                                    <th>Total BSS</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody id="cuerpo">
                                
                            </tbody>
                            
                        </table>
                        
                </div>

                <br><br> 

                <div class="row">
                    <table class="table" id="tablaProductos">
                        <tbody>
                                                       
                            <tr class="bg-info">
                                <td><strong class="text-white">Total</strong></td>
                                <td> 
                                    <strong>
                                        <input type="text" class="form-control-plaintext text-white" id="totalVenta" disabled>
                                        <input type="text" hidden id="total" name="total">
                                    </strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr class="bg-secondary">
                <div class="card">
                    <div class="card-header">
                        <h4>Datos del Pago</h4>
                    </div>
                    <div class="card-body">
                        <div class="row m-1">
                            <button class="btn btn-info" id="agregarMetodoPago">
                                <i class="fas fa-plus-square"></i> Agregar Método de Pago
                            </button>                            
                        </div>
                        <div class="row form-row table-responsive">
                            
                            <table class="table " id="tpagos">
                                <thead class=" thead-light">
                                    <tr>
                                        <!-- <th scope="col">Codigo</th> -->
                                        <th>Método</th>
                                        <th>Monto</th>    
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody id="cuerpoPagos">
                                    <tr>
                                        <td> 
                                            <select class="form-control" name="metodoPago[]" required>
                                                <option value=""></option>
                                                <option value="EFECTIVO">EFECTIVO</option>
                                                <option value="PUNTO DE VENTA">PUNTO DE VENTA</option>
                                                <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                                                <option value="PAGO MÓVIL">PAGO MÓVIL</option>
                                            </select> 
                                        </td>
                                        <td> 
                                            <input type="number" step="any" min="0.01" class="form-control montoPago" id="montoPago" name="montoPago[]" required> 
                                        </td>
                                        <td>
                                            <button class="btn btn-danger eliminarPago"><i class="fas fa-trash-alt text-white"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                                
                            </table>
                            
                        </div>
                    </div>
                </div>
                <br>
                <div class="row justify-content-center">
                    <div class="col"></div>
                    <div class="col">
                        <button type="submit" class="btn btn-block btn-success"><i class=" fas fa-save"></i> Registrar Venta</button>
                    </div>
                    <div class="col"></div>
                </div>

            </div>
        </div>
    </form>
</div>



<script type="text/javascript">
    $(document).ready(function() {
    $('.js-example-basic-single').select2();
});
</script>
<script>

// In your Javascript (external .js resource or <script> tag)


    let clientes = <?= json_encode($clientes) ?>;
    let productos = <?= json_encode($productos) ?>; 
    let iva = parseFloat(<?= json_encode($iva) ?>);    

</script>
<script src="<?= ROOT; ?>public/assets/js/cliente/index.js"></script>

<script src="<?= ROOT; ?>public/assets/js/venta/create.js"></script>
