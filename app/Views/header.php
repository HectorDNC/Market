<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="<?= ROOT; ?>public/assets/img/favicon.ico" type="image/x-icon">
    <!-- FONTAWESOME -->
    <link href="<?= ROOT; ?>vendor/fortawesome/font-awesome/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- JQUERY -->
    <script src="<?= ROOT; ?>node_modules/jquery/dist/jquery.min.js"></script>
    
    <!-- SWEETALERT -->
    <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/bulma.css">
    <!-- <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.css"> -->
    <script src="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.min.js"></script>

    <!-- BOOTSTRAP -->
    <!-- <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap-litera.min.css" rel="stylesheet" type="text/css"> -->

    <!-- BOOTADMIN -->
    <link href="<?= ROOT; ?>public/assets/css/bootadmin.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">

    <link href="<?= ROOT; ?>public/assets/css/notifications.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">

    <!-- DATATABLE -->
    <link href="<?= ROOT; ?>vendor/datatables/datatables/media/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css">
    <link href="<?= ROOT; ?>public/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="<?= ROOT; ?>public/assets/css/style.min.css" rel="stylesheet" type="text/css">
    <title><?=TITLE?></title>
</head>
<body class="bg-light">
    <div class="preloader">
        <div class="lds-ripple">
        <!-- <h2>Cargando...</h2> -->
            <div class="lds-pos"></div>
            
            <div class="lds-pos"></div>
        </div>
    </div>
<!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand d-flex align-items-center justify-content-center" href="<?= ROOT; ?>">
                        <!-- Logo icon -->
                        <div class="logo-icon">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="<?= ROOT; ?>public/assets/img/logo.png" alt="homepage" height="60px" class="dark-logo" />

                        </div>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                       <div class="h-100 pt-2">
                        <h1 style="color:rgba(255,255,255,0.95);"><?=TITLE?></h1>
                       </div>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="fa fa-lg fa-bars ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-none d-md-block d-lg-none">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white"
                                href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    

                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ml-auto">
                            
                            <li class="nav-item dropdown">
                                <a href="#" id="dd_user" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?= empty($_SESSION['usuario']) ? 'Usuario' : $_SESSION['usuario'] ?> <i class="fa fa-angle-down"></i></a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd_user">
                                    <a href="<?=ROOT?>perfil" class="dropdown-item">Perfil</a>
                                    <a href="" id="logout" class="dropdown-item">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                <?php if($_SESSION['rol']==1){ ?>

                <ul class="list-unstyled" id="sidebarnav">
                   
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Usuario" aria-expanded="false"><i class="mr-3 fa fa-fw fa-user"
                                    aria-hidden="true"></i><span class="hide-menu">Usuarios</span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Empleado" aria-expanded="false"><i class="mr-3 fa fa-fw fa-wrench"
                                    aria-hidden="true"></i><span class="hide-menu">Empleados</span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Dolar" aria-expanded="false"><i class="mr-3 fas fa-money-bill-alt"
                                    aria-hidden="true"></i><span class="hide-menu">Dolar</span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Cliente" aria-expanded="false"><i class="mr-3 fa fa-fw fa-users"
                                    aria-hidden="true"></i><span class="hide-menu">Clientes</span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Proveedor" aria-expanded="false"><i class="mr-3 fa fa-fw fa-truck"
                                    aria-hidden="true"></i><span class="hide-menu">Proveedores</span></a>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Inventario" aria-expanded="false"><i class="mr-3 fa fa-fw fa-chart-area"
                                    aria-hidden="true"></i><span class="hide-menu">Inventario</span></a>
                    </li>
                
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" data-toggle="collapse"
                                href="#sm_expand_1" aria-expanded="false"><i class="mr-3 fa fa-fw fa-sitemap"
                                    aria-hidden="true"></i><span class="hide-menu">Gestión de Productos </span>&nbsp;<i class="fa fa-angle-down"></i></a>
                        <ul id="sm_expand_1" class="list-unstyled collapse">
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Producto" aria-expanded="false"><i class="mr-3 fa fa-fw fa-bookmark"
                                        aria-hidden="true"></i><span class="hide-menu">Resumen</span></a>
                            </li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Categoria" aria-expanded="false"><i class="mr-3 fa fa-fw fa-tag"
                                        aria-hidden="true"></i><span class="hide-menu">Categoría</span></a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" data-toggle="collapse"
                                href="#compra_collapse" aria-expanded="false"><i class="mr-3 fa fa-fw fa-shopping-cart"
                                    aria-hidden="true"></i><span class="hide-menu">Compras </span>&nbsp;<i class="fa fa-angle-down"></i> </a>
                        <ul id="compra_collapse" class="list-unstyled collapse">
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Compra" aria-expanded="false"><i class="mr-3 fa fa-fw fa-bookmark"
                                        aria-hidden="true"></i><span class="hide-menu">Resumen</span></a>
                            </li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Compra/create" aria-expanded="false"><i class="mr-3 fa fa-fw fa-plus-square"
                                        aria-hidden="true"></i><span class="hide-menu">Agregar Compra</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" data-toggle="collapse"
                                href="#venta_collapse" aria-expanded="false"><i class="mr-3 fa fa-fw fa-dollar-sign"
                                    aria-hidden="true"></i><span class="hide-menu">Ventas </span>&nbsp;<i class="fa fa-angle-down"></i></a>
                        <ul id="venta_collapse" class="list-unstyled collapse">
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Venta" aria-expanded="false"><i class="mr-3 fa fa-fw fa-bookmark"
                                        aria-hidden="true"></i><span class="hide-menu">Resumen</span></a>
                            </li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                    href="<?= ROOT;?>Venta/crear" aria-expanded="false"><i class="mr-3 fa fa-fw fa-plus-square"
                                        aria-hidden="true"></i><span class="hide-menu">Agregar Venta</span></a>
                            </li>
                        </ul>
                    </li>                    
                    
                    <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="<?= ROOT;?>Reporte" aria-expanded="false"><i class="mr-3 fa fa-fw fa-list-alt"
                                    aria-hidden="true"></i><span class="hide-menu">Reportes</span></a>
                    </li>
                   
                </ul>
                <?php } else{ ?>
                    <ul class="list-unstyled">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="<?= ROOT;?>Cliente" aria-expanded="false"><i class="mr-3 fa fa-fw fa-users"
                                        aria-hidden="true"></i><span class="hide-menu">Clientes</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="<?= ROOT;?>Inventario" aria-expanded="false"><i class="mr-3 fa fa-fw fa-chart-area"
                                        aria-hidden="true"></i><span class="hide-menu">Inventario</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" data-toggle="collapse"
                                href="#venta_collapse" aria-expanded="false"><i class="mr-3 fa fa-fw fa-dollar-sign"
                                    aria-hidden="true"></i><span class="hide-menu">Ventas </span>&nbsp;<i class="fa fa-angle-down"></i></a>
                            <ul id="venta_collapse" class="list-unstyled collapse">
                                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                        href="<?= ROOT;?>Venta" aria-expanded="false"><i class="mr-3 fa fa-fw fa-bookmark"
                                            aria-hidden="true"></i><span class="hide-menu">Resumen</span></a>
                                </li>
                                <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link pl-5"
                                        href="<?= ROOT;?>Venta/crear" aria-expanded="false"><i class="mr-3 fa fa-fw fa-plus-square"
                                            aria-hidden="true"></i><span class="hide-menu">Agregar Venta</span></a>
                                </li>
                            </ul>
                        </li> 
                    </ul>
                <?php } ?>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">