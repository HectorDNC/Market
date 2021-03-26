<div class="content p-4 dataTables_wrapper">
    <h2 class="mb-4">Gestión de Ventas</h2>


    <div class="card mb-4">
        <div class="card-header ">
            <h3>Caja</h3>
            <div class="row">
            <?php if(isset($caja->descripcion)){?>
                <div class="col-md-8">
                    <span><b>Estado:</b>  <?=$caja->descripcion?> - <?=$caja->fecha_f?></span><br>
                    <!-- <span><b>Ventas Realizadas:</b>  20</span> -->
                </div>
                <div class="col-md-4 d-flex justify-content-end align-items-center">
                <?php if($caja->descripcion == "Abierta"){?>
                    <button class="btn btn-warning" id="cerrarCaja">
                        <i class="fas fa-cash-register"></i> Cerrar Caja
                    </button>
                <?php }else{?>
                    <button class="btn btn-info" id="abrirCaja">
                        <i class="fas fa-cash-register"></i> Abrir Caja
                    </button>
                <?php }?>                                  
                </div>
            <?php }else{?>
            
                <div class="col-md-8">
                    <span><b>Estado:</b> Cerrada</span><br>
                    <!-- <span><b>Ventas Realizadas:</b>  20</span> -->
                </div>
                <div class="col-md-4 d-flex justify-content-end align-items-center">

                    <utton class="btn btn-info" id="abrirCaja">
                        <i class="fas fa-play-circle"></i> Abrir Caja
                    </button>                        
                </div>
            <?php }?>         
            </div>
        </div>
        <?php if(isset($caja->descripcion) && $caja->descripcion=="Abierta"){?>
        <div class="card-header bg-white">
    
          <a class="btn btn-primary" href="<?= ROOT;?>Venta/crear">
            <i class="fas fa-plus-square"></i> Agregar Venta
          </a>
        </div>
        <?php }?>
        <h2 hidden="true" >LOL</h2>
        <div class="card-body">
          <table class="table" id="datatable">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Codigo</th>
                <th scope="col">Fecha</th>
                <th scope="col">Cliente</th>
                <th scope="col">Estado</th>
                <th scope="col">Acción</th>
              </tr>
            </thead>
            <tbody>
               
            </tbody>
          </table>
        </div>
    </div>
</div>


<!-- Modal Detalle Venta -->
<div class="modal fade" id="modalDetalleVenta" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

        <div class="card">

            <div class="card-header">
                <div class="row justify-content-center">
                    <h2 class="card-tittle text-center">Detalle Venta</h2>
                </div>
            </div>
            
            <div class="card-body">
                <div class="row justify-content-start">
                    <label for="" class="col-form-label col-md-2"><strong>Nro Venta:</strong> </label>
                    <div class="col-md-2">
                        <input type="text" class="form-control-plaintext" id="numero_venta" disabled>
                    </div>
                </div>

                <hr>

                <div class="row pl-5">
                    <h4>CLIENTE</h4>
                </div>

                <div class="row pl-5">
                    <label for="" class="col-form-label col-md-3"><strong>NOMBRE:</strong></label>
                    <div class="col-md-9">
                        <input type="text" id="nombre_cliente" class="form-control-plaintext" value="MICROTECH" disabled>
                    </div>                   
                </div>
                <div class="row pl-5">                    
                    <label for="" class="col-form-label col-md-3"><strong> CEDULA/RIF:</strong></label>
                    <div class="col-md-9">
                        <input type="text" id="rif_cliente" class="form-control-plaintext" value="J-36540950" disabled>
                    </div>
                </div>

                <div class="row pl-5">
                    <label for="" class="col-form-label col-md-3"><strong>DIRECCION:</strong></label>
                    <div class="col-md-9">
                        <input type="text" id="direccion_cliente" class="form-control-plaintext" value="BARQUISIMETO" disabled>
                    </div>

                    
                </div>

                <hr>

                <div class="row justify-content-center">
                    <h4>PRODUCTOS</h4>
                </div>

                <div class="row">
                    <div class=" table-responsive">
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>CANTIDAD</th>
                                    <th>CODIGO</th>
                                    <th>PRODUCTO</th>
                                    <th>PRECIO</th>
                                    <th>TOTAL $</th>
                                    <th>TOTAL BSS</th>
                                </tr>
                            </thead>
    
                            <tbody id="cuerpo">

                            </tbody>
                        </table>
                    </div>

                </div>
                <hr>
                
                <div class="row justify-content-start">
                    <div class="col-md-12">
                        <label for="" class="col-form-label"><strong>TOTAL:</strong> </label>
                        <p class="form-control-plaintext" id="total"></p>
                    </div>
                </div>

                <hr>

                <div class="row justify-content-center">
                    <h4>DATOS DEL PAGO</h4>
                </div>

                <div class="row form-row table-responsive w-75 m-auto">
                            
                            <table class="table" id="tpagos">
                                <thead class=" thead-light">
                                    <tr>
                                        <!-- <th scope="col">Codigo</th> -->
                                        <th>Método</th>
                                        <th>Monto</th>    
                                    </tr>
                                </thead>
                                <tbody id="cuerpoPagos">
                                
                                </tbody>
                                
                            </table>
                            
                        </div>
                

                <hr>

                <div class="row justify-content-center">
                    <button class="btn btn-secondary" data-dismiss="modal"> <i class="fas fa-window-close"></i> Cerrar</button>
                </div>
            
            </div>


        </div>

        </div>
    </div>
</div>
<!-- Modal Caja -->
<div class="modal fade" id="modalInfoCaja" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md w-100 h-100 d-flex justify-content-center align-items-center">
        <div class="modal-content">

        <div class="card">
        <div class="card-header">
            <h2 class="card-tittle text-center">Caja Cerrada!</h2>         
                       
        </div>
        <div class="card-body">
            <div id="cuerpoInfoCaja">
                <b>Fecha de Apertura: </b><span id="desde"></span><br>
                <b>Fecha de Cierre: </b><span id="hasta"></span><br>
                <b>Total de Ventas: </b><span id="total"></span>
            </div>               
        </div>
        <div class="card-footer">
            <div class="form-row justify-content-center">
                <button class="btn btn-success m-1" id="cerrarInfoCaja">Continuar</button>
                <button class="btn btn-warning m-1" id="reporteCaja"><i class="fa fa-fw fa-list-alt"></i>&nbsp;Generar Reporte</button>
                <button class="btn btn-info m-1" id="reabrirCaja"><i class="fas fa-cash-register"></i>&nbsp;Reabrir Caja</button>
            </div>
                       
        </div>


    </div>
    <form action="<?=ROOT;?>Reporte/reporteVenta" method="POST" enctype="multipart/form-data" id="formularioReporte" target="_blank">
        <input type="hidden" name="vendedor" id="vendedor">
        <input type="hidden" name="desde" id="desde">
        <input type="hidden" name="hasta" id="hasta">
    </form>
      
</div>

<script src="<?= ROOT; ?>public/assets/js/venta/index.js"></script>

