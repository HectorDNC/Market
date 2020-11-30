<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- FONTAWESOME -->
    <link href="<?= ROOT; ?>vendor/fortawesome/font-awesome/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- JQUERY -->
    <script src="<?= ROOT; ?>node_modules/jquery/dist/jquery.js"></script>
    
    <!-- SWEETALERT -->
    <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/bulma.css">
    <!-- <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.css"> -->
    <script src="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.js"></script>

    <!-- BOOTSTRAP -->
    <!-- <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
    <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap-litera.min.css" rel="stylesheet" type="text/css">

    <!-- BOOTADMIN -->
    <link href="<?= ROOT; ?>public/assets/css/bootadmin.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">

    <link href="<?= ROOT; ?>public/assets/css/notifications.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">

    <!-- DATATABLE -->
    <link href="<?= ROOT; ?>vendor/datatables/datatables/media/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css">
    <link href="<?= ROOT; ?>public/assets/css/style.css" rel="stylesheet" type="text/css">
    <title><?=TITLE?></title>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand navbar-dark" style="background: #00C853;">
    <a class="sidebar-toggle mr-3" href="#"><i class="fa fa-bars"></i></a>
    <a class="navbar-brand" href="<?= ROOT;?>"><i class="fa fa-shopping-cart"></i> <?=TITLE?></a>
    <div class="navbar-collapse collapse">
        <ul class="navbar-nav ml-auto">
            
            <li class="nav-item dropdown">
                <a href="#" id="dd_user" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?= empty($_SESSION['usuario']) ? 'Usuario' : $_SESSION['usuario'] ?></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd_user">
                    <a href="<?=ROOT?>perfil" class="dropdown-item">Perfil</a>
                    <a href="" id="logout" class="dropdown-item">Salir</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
	<!-- MENU -->
<div class="d-flex">
	<div class="sidebar sidebar-dark" style="background: #000;">
    <?php if($_SESSION['rol']==1){ ?>

    <ul class="list-unstyled">
        <li><a href="<?= ROOT;?>Usuario"><i class="fa fa-fw fa-user"></i> Usuarios</a></li>
        <li><a href="<?= ROOT;?>Dolar"><i class="fas fa-money-bill-alt"></i> Dolar</a></li>
        <!-- <li><a href="<?= ROOT;?>Empleado"><i class="fa fa-fw fa-wrench"></i> Empleados</a></li> -->
        <li><a href="<?= ROOT;?>Cliente"><i class="fa fa-fw fa-users"></i> Clientes</a></li>
        <li><a href="<?= ROOT;?>Proveedor"><i class="fa fa-fw fa-truck"></i> Proveedores</a></li>
        <li><a href="<?= ROOT;?>Inventario"><i class="fa fa-fw fa-chart-area"></i> Inventario</a></li>
     
        <li>
            <a href="#sm_expand_1" data-toggle="collapse">
                <i class="fa fa-fw fa-sitemap"></i> Gestión de Productos
            </a>
            <ul id="sm_expand_1" class="list-unstyled collapse">
                <li><a href="<?= ROOT;?>Producto"><i class="fa fa-fw fa-bookmark"></i> Resumen</a></li>
                <li><a href="<?= ROOT;?>Categoria"><i class="fa fa-fw fa-tag"></i> Categoría</a></li>
            </ul>
        </li>
        <li>
            <a href="#compra_collapse" data-toggle="collapse">
                <i class="fa fa-fw fa-shopping-cart"></i> Compras
            </a>
            <ul id="compra_collapse" class="list-unstyled collapse">
                <li><a href="<?= ROOT;?>Compra"><i class="fa fa-fw fa-bookmark"></i> Resumen</a></li>
                <li><a href="<?= ROOT;?>Compra/create"><i class="fa fa-fw fa-plus-square"></i> Agregar Compra</a></li>
            </ul>
        </li>
        <li>
            <a href="#venta_collapse" data-toggle="collapse">
                <i class="fa fa-fw fa-dollar-sign"></i> Ventas
            </a>
            <ul id="venta_collapse" class="list-unstyled collapse">
                <li><a href="<?= ROOT;?>Venta"><i class="fa fa-fw fa-bookmark"></i> Resumen</a></li>
                <li><a href="<?= ROOT;?>Venta/crear"><i class="fa fa-fw fa-plus-square"></i> Agregar Venta</a></li>
            </ul>
        </li>
        
        <!-- <li><a href="<?= ROOT;?>Reporte"><i class="fa fa-fw fa-calendar"></i> Reportes</a></li> -->
        
        <!-- <li>
            <a href="#sm_expand_2" data-toggle="collapse">
                <i class="fa fa-fw fa-globe"></i> Permisos
            </a>
            <ul id="sm_expand_2" class="list-unstyled collapse">
                <li><a href="<?= ROOT;?>Rol"><i class="fa fa-fw fa-address-card"></i> Roles</a></li>
            </ul>
        </li> -->
    </ul>
    <?php } else{ ?>
        <ul class="list-unstyled">
            <li><a href="<?= ROOT;?>Cliente"><i class="fa fa-fw fa-users"></i> Clientes</a></li>
            <li><a href="<?= ROOT;?>Inventario"><i class="fa fa-fw fa-chart-area"></i> Inventario</a></li>
            <li>
                <a href="#venta_collapse" data-toggle="collapse">
                    <i class="fa fa-fw fa-dollar-sign"></i> Ventas
                </a>
                <ul id="venta_collapse" class="list-unstyled collapse">
                    <li><a href="<?= ROOT;?>Venta"><i class="fa fa-fw fa-bookmark"></i> Resumen</a></li>
                    <li><a href="<?= ROOT;?>Venta/crear"><i class="fa fa-fw fa-plus-square"></i> Agregar Venta</a></li>
                </ul>
            </li>
        </ul>
    <?php } ?>
</div>