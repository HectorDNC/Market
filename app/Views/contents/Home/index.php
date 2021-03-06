
<div class="content p-4">
	<h2 class="mb-4">Inicio</h2>

	<div class="row mb-4">
		<div class="col-md">
		  	<div class="d-flex border">
	            <div class="bg-success text-light p-4">
	                <div class="d-flex align-items-center h-100">
	                    <i class="fa fa-3x fa-fw fa-dollar-sign"></i>
	                </div>
	            </div>
	            <div class="flex-grow-1 bg-white p-4">
	                <p class="text-uppercase text-secondary mb-0">Ventas</p>
	                <h3 class="font-weight-bold mb-0"><?=$ventas?></h3>
	            </div>
	    	</div>
		</div>

		<div class="col-md">
	        <div class="d-flex border">
	            <div class="bg-dark text-light p-4">
	                <div class="d-flex align-items-center h-100">
	                    <i class="fa fa-3x fa-fw fa-sitemap"></i>
	                </div>
	            </div>
	            <div class="flex-grow-1 bg-white p-4">
	                <p class="text-uppercase text-secondary mb-0">Productos</p>
	                <h3 class="font-weight-bold mb-0"><?=$productos?></h3>
	            </div>
	        </div>
		</div>	
	</div>
	<div class="row mb-4">
		<div class="col-md">
		  	<div class="d-flex border">
	            <div class="bg-warning text-light p-4">
	                <div class="d-flex align-items-center h-100">
	                    <i class="fa fa-3x fa-fw fa-shopping-cart"></i>
	                </div>
	            </div>
	            <div class="flex-grow-1 bg-white p-4">
	                <p class="text-uppercase text-secondary mb-0">Compras</p>
	                <h3 class="font-weight-bold mb-0"><?=$compras?></h3>
	            </div>
	    	</div>
		</div>

		<div class="col-md">
	        <div class="d-flex border">
	            <div class="bg-info text-light p-4">
	                <div class="d-flex align-items-center h-100">
	                    <i class="fa fa-3x fa-fw fa-users"></i>
	                </div>
	            </div>
	            <div class="flex-grow-1 bg-white p-4">
	                <p class="text-uppercase text-secondary mb-0">Clientes</p>
	                <h3 class="font-weight-bold mb-0"><?=$clientes?></h3>
	            </div>
	        </div>
		</div>	
	</div>
	<div class="card">
		<div class="card-header bg-white font-weight-bold">
			Ventas Recientes
		</div>
		<div class="card-body">

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">C??digo</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Cliente</th>
                </tr>
                </thead>
                <tbody>
					<?php foreach ($ventasD as $venta):?>
						<tr>
							<td><?=$venta->codigo?></td>
							<td><?=$venta->fecha?></td>
							<td><?=$venta->cliente?></td>
						</tr>

					<?php endforeach; ?>
               
              	</tbody>
            </table>
        </div>
	</div>
</div>