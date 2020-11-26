<div class="content p-4 dataTables_wrapper">
    <h2 class="mb-4">Gestion del Dolar del dia</h2>

    <div class="card mb-4">
        <div class="card-header bg-white">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRegistroDolar">
            <i class="fas fa-plus-square"></i> Agregar Dolar
          </button>
        </div>
        <div class="card-body">
          <table class="table" id="datatable">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Categoria</th>
                <th scope="col">Precio</th>
                <th scope="col">Acciones</th>
              </tr>
            </thead>
            <tbody>
                
            </tbody>
          </table>
        </div>
    </div>
</div>

<!-- Modal Registro -->
<div class="modal fade" id="modalRegistroDolar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">

        <div class="card">
        <div class="card-body">
            <h2 class="card-tittle text-center"></h2>
            <hr>
          
                <form action="#" method="POST" id="formularioRegistrarDolar" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="nombre"> <i class="fas fa-tag"></i> Dolar del dia</label>
                        <input type="text" name="nombre" id="nombre" class="form-control" onkeyup = "this.value=this.value.toUpperCase()" placeholder="Dolar">
                    </div>
                    
                    <div class="form-group">
                        <label for="descripcion"> <i class="fas fa-id-card-alt"></i> Precio</label>
                         <input type="number" name="precio" id="precio" class="form-control" >
                    </div>


                    <div class="form-row justify-content-center">
                        <button class="btn btn-success" type="submit">Enviar</button>
                    </div>
                    
                </form>   
        </div>


    </div>

        </div>
    </div>
</div>

<!-- Modal Mostrar -->
<div class="modal fade" id="modalMostrarDolar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        <div class="card">
        <div class="card-body">
            <h2 class="card-tittle text-center">Nuevo Precio Dolar</h2>
            <hr>
            <form action="#" method="POST" id="formularioMostrarDolar" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="nombre"> <i class="fas fa-tag"></i> <strong>Nombre Categoria</strong></label>
                    <input type="text" name="nombre" id="nombre" class="form-control-plaintext" disabled onkeyup = "this.value=this.value.toUpperCase()" placeholder="ej. cajas">
                </div>

                
                <div class="form-group">
                    <label for="descripcion"> <i class="fas fa-id-card-alt"></i> <strong>Precio</strong></label>
                    <textarea name="descripcion" onkeyup = "this.value=this.value.toUpperCase()" id="precio" class="form-control-plaintext" disabled cols="30" rows="3" ></textarea>
                </div>


                <div class="form-row justify-content-center">
                    <button class="btn btn-success" data-dismiss="modal">Atras</button>
                </div>
                
            </form>
        </div>


    </div>

        </div>
    </div>
</div>

<!-- Modal Actualizar -->
<div class="modal fade" id="modalActualizarDolar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">

        <div class="card">
        <div class="card-body">
            <h2 class="card-tittle text-center">Nuevo Categoria</h2>
            <hr>
          
            <form action="#" method="POST" id="formularioActualizarDolar" enctype="multipart/form-data">
                <input type="text" name="id" id="id" hidden>
                <div class="form-group">
                    <label for="nombre"> <i class="fas fa-tag"></i> Nombre Categoria</label>
                    <input type="text" name="nombre" id="nombre" class="form-control" onkeyup = "this.value=this.value.toUpperCase()" placeholder="ej. cajas">
                </div>
                
                <div class="form-group">
                    <label for="descripcion"> <i class="fas fa-id-card-alt"></i> Precio</label>
                    <textarea name="precio" onkeyup = "this.value=this.value.toUpperCase()" id="precio" class="form-control" cols="30" rows="3" ></textarea>
                </div>


                <div class="form-row justify-content-center">
                    <button class="btn btn-success" type="submit">Enviar</button>
                </div>
                
            </form>   
        </div>


    </div>

        </div>
    </div>
</div>


<script src="<?= ROOT; ?>public/assets/js/dolar/index.js"></script>

