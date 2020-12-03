<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Ventas</title>

    <style type="text/css">

        .container{
            padding: 0px 0px;
            /* color:lightslategrey; */
            color:black;
        }
        .padding{
            padding: 2px;
        }
        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }
        .centrado{
            margin: auto;
        }
        .clear{
            clear: both;
        }
        .separador{
            display:block; 
            width:100%; 
            height:1px; 
            margin: 1px 0px;
            background: gray; 
        }

    </style>
</head>
<body>
    <div class="container centrado" style="width: 98%;">

        <div class="centrado" style="width=100%;">
            <h1 class="text-center">REPORTE DE VENTAS</h1>
            <hr>
            <div>
            
                <p>
                <?php if(!$vendedores){?>
                    <strong>Vendedor: </strong> <?=$vendedor?><br>
                <?php }?>
                 <strong>Desde: </strong> <?=$desde?><br>
                 <strong>Hasta: </strong> <?=$hasta?>
                </p>
                
            </div>
            <h3 class="text-center"><u>VENTAS</u></h3>
        
        <?php if($vendedores){?>
            <div>
                <div style="width:15%; display:inline;" class="text-center">
                    <strong>CÓDIGO</strong>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center">
                    <strong>FECHA</strong>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center">
                    <strong>CLIENTE</strong>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center">
                    <strong>VENDEDOR</strong>
                </div>
                <div style="width:18%; display:inline;" class="text-center">
                    <strong>TOTAL $</strong>
                </div>
                <div style="width:18%; display:inline;" class="text-center">
                    <strong>TOTAL BSS</strong>
                </div>
            </div>
            
            <hr><br>
            <?php                    
                   
                    foreach($ventas AS $venta):
                        $cantidad++;
            ?>

            <div>
                <div style="width:15%; display:inline;" class="text-center" >
                    <span><?= $venta->codigo; ?></span>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center" >
                    <span><?= $venta->fecha; ?></span>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center" >
                    <span><?= $venta->cliente; ?></span>
                </div>
                <div style="width:15.5%; display:inline;" class="text-center" >
                    <span><?= $venta->vendedor; ?></span>
                </div>
                <div style="width:18%; display:inline;" class="text-center" >
                    <span><?= $venta->total ?></span>
                </div>
                <div style="width:18%; display:inline;" class="text-center" >
                    <span><?= $venta->total * $dolar; ?></span>
                </div>
            </div>
                
                <br>
                <div class="separador"></div>
                <?php
                    endforeach;
                ?>
            <?php }else{?>
                <div>
                    <div style="width:18.5%; display:inline;" class="text-center">
                        <strong>CÓDIGO</strong>
                    </div>
                    <div style="width:15.5%; display:inline;" class="text-center">
                        <strong>FECHA</strong>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center">
                        <strong>CLIENTE</strong>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center">
                        <strong>TOTAL $</strong>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center">
                        <strong>TOTAL BSS</strong>
                    </div>
                </div>

                <hr><br>
                <?php                    
                    
                        foreach($ventas AS $venta):
                            $cantidad++;
                ?>

                <div>
                    <div style="width:18.5%; display:inline;" class="text-center" >
                        <span><?= $venta->codigo; ?></span>
                    </div>
                    <div style="width:15.5%; display:inline;" class="text-center" >
                        <span><?= $venta->fecha; ?></span>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center" >
                        <span><?= $venta->cliente; ?></span>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center" >
                        <span><?= $venta->total ?></span>
                    </div>
                    <div style="width:18.5%; display:inline;" class="text-center" >
                        <span><?= $venta->total * $dolar; ?></span>
                    </div>
                </div>
                
                <br>
                <div class="separador"></div>
                <?php
                    endforeach;
                ?>
            <?php }?>
            
                <hr>
                <div>
                    <p> <b>Total de Ventas: </b> <?=$cantidad;?></p>
                </div>
                
        </div>  
        
           
            
    </div>
</body>
</html>