<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title><?=TITLE?></title>
    <link rel="shortcut icon" href="<?= ROOT; ?>public/assets/img/favicon.ico" type="image/x-icon">
    <!-- FONTAWESOME -->
    <link href="<?= ROOT; ?>vendor/fortawesome/font-awesome/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- JQUERY -->
    <script src="<?= ROOT; ?>node_modules/jquery/dist/jquery.js"></script>
    
    <!-- SWEETALERT -->
    <!-- <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/bulma.css"> -->
    <link rel="stylesheet" href="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.css">
    <script src="<?= ROOT; ?>node_modules/sweetalert2/dist/sweetalert2.js"></script>

    <!-- BOOTSTRAP -->
    <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap-litera.min.css" rel="stylesheet" type="text/css">
    <!-- <link href="<?= ROOT; ?>vendor/twbs/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"> -->

    <!-- BOOTADMIN -->
    <link href="<?= ROOT; ?>public/assets/css/bootadmin.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">

    <link href="<?= ROOT; ?>public/assets/css/notifications.css?v=<?php echo time(); ?>" rel="stylesheet" type="text/css">
    
    
</head>

<body>
<?php
    if(isset($alerta)){
        echo $alerta;
    }
?>
<div class="container-fluid login position-absolute w-100 h-100 p-2">
    <div class="row h-100 d-flex justify-content-center align-items-center">
        <div class="col-md-4">
            
            <div class="card " style="background: linear-gradient(to left, #0178bc 0%, #00bdda 100%); color:#FFF;">
                <div class="card-header">
                    <h1 class="text-center"><?=TITLE?></h1>
                </div>
                <div class="card-body">
                    <form id="loginForm">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-user"></i></span>
                            </div>
                            <input type="text" name="user" class="form-control" placeholder="Usuario" required>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-key"></i></span>
                            </div>
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" required>
                        </div>
                        
                        <div class="row">
                            <div class="col pr-2">
                                <button type="submit" class="btn btn-block btn-dark"> <b>Iniciar sesión</b> </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


    <script src="<?= ROOT; ?>vendor/twbs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<?= ROOT; ?>public/assets/js/config.js"></script>
    <script src="<?= ROOT; ?>public/assets/js/bootadmin.min.js"></script>
    <script src="<?= ROOT; ?>public/assets/js/login/validation.js"></script>
    
 
    <!-- Bootstrap core JavaScript -->
<!--     <script src="Assets/js/jquery/jquery-3.2.1.js"></script> -->
<!--     <script src="Assets/js/bootstrap/bootstrap.js"></script> -->
<!--     <script src="Assets/js/menu_lateral.js"></script> -->
<!--     <script src="Assets/js/validacion.js"></script> -->
<!-- 	<script src="Assets/js/select2.js"></script> -->
</body>

</html>