<div class=" container-fluid p-2">
    <form action="<?= ROOT;?>Compra/guardar" method="post" id="formularioCompra">
 
        <div class="card">
            <div class=" card-header bg-gray">
                <div class="row">
                    <div class="col"></div>
                    <div class="col">
                        <h3 class="text-center">Nueva Compra</h3>
                    </div>
                    <div class="col">
                        
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="form-row justify-content-end">
                    <label for="documento" class=" col-form-label col-md-2">
                        <strong>Nro Compra:</strong></label>
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
                                <h4>Proveedor</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <label for="cliente" class=" col-form-label col-md-2">
                                        <i class="fas fa-user-alt"></i>
                                        <span> <strong>Proveedor</strong></span>
                                    </label>
    
                                    <div class="col-md-6 form-group">
                                        <select name="proveedor" id="listadoProveedores" class="form-control js-example-basic-single">
                                            <option value="">-</option>

                                            <?php 
                                                foreach($proveedores as $proveedor): 
                                            ?>

                                                <option value="<?= $proveedor->documento; ?>"><?= $proveedor->documento . " - " .$proveedor->razon_social; ?></option>

                                            <?php 
                                                endforeach; 
                                            ?>

                                        </select>
                                    </div>
            
                
                                    <div class="col-md-4 form-group">
                                        <button type="button" class="btn btn-block btn-success" id="agregarProveedor" ><i class="fas fa-plus-circle"></i></button>
                                    </div>
                                </div>

                                
                                <div class="row form-row">
                                            
                                    <input type="text" name="proveedor" id="proveedor" hidden>

                                    <label for="cedula" class="col-form-label col-lg-2"><strong>Cedula | Rif</strong> </label>
                                    <div class="col-lg-10 form-group">
                                        <input type="text" class="form-control-plaintext" id="documentoProveedor" disabled >    
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <label for="Nombre" class="col-form-label col-lg-2"><strong>Nombre:</strong> </label>
                                    <div class="col-lg-10 form-group">
                                        <input type="text" class="form-control-plaintext" name="nombre" id="nombreProveedor" disabled >
                                    </div>
                                </div>

                                <div class="form-row">
                
                                    <label for="documento" class=" col-form-label col-md-2">
                                        <i class="fas fa-file-invoice"></i>
                                        <strong>Documento Referencia:</strong></label>
                                    <div class="col-md-4">
                                        <input onkeyup="javascript:this.value=this.value.toUpperCase()" type="text" name="documentoReferencia" class="form-control" placeholder="Ingrese el documento referencia del proveedor" pattern="[A-Za-z0-9]+">
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
                                    <th scope="col">Codigo</th>
                                    <th>Descripcion</th>    
                                    <th>Cantidad</th>
                                    <th>Stock</th>
                                    <th>Precio Unitario</th>
                                    
                                    <th>Total</th>
                                    <!-- <th>Total BSS</th> -->
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
                            <!-- <tr>
                                <td>IVA</td>
                                <td>6.560</td>
                            </tr> 
                            <tr>
                                <td>Sub-Total</td>
                                <td>0</td>
                            </tr> -->
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

                <div class="row justify-content-center">
                    <div class="col"></div>
                    <div class="col">
                        <button type="submit" class="btn btn-block btn-success"><i class=" fas fa-save"></i> Registrar Compra</button>
                    </div>
                    <div class="col"></div>
                </div>

            </div>
        </div>
    </form>
</div>

<script>
    let proveedores = <?= json_encode($proveedores) ?>;
    let productos = <?= json_encode($productos) ?>;    
</script>

<script src="<?= ROOT; ?>public/assets/js/compra/create.js"></script>
