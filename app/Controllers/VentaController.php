<?php

namespace App\Controllers;

use App\Models\Cliente;
use App\Models\Producto;
use App\Models\Salida;
use App\Models\Venta;
use App\Models\DetalleVenta;
use App\Models\Caja;
use App\Traits\Utility;
use PDO;
use System\Core\Controller;
use System\Core\View;

class VentaController extends Controller{

    private $cliente;
    private $producto;
    private $venta;
    private $detalleVenta;
    private $caja;
    // private Salida $salida;

    use Utility;

    public function __construct(){
        $this->cliente = new Cliente;
        $this->producto = new Producto;
        $this->venta = new Venta;
        $this->detalleVenta = new DetalleVenta;
        $this->caja = new Caja;
        // $this->salida = new Salida;
    }

    public function index(){
        $caja = $this->caja->estado();
        return View::getView('Venta.index', 'caja', $caja);
    }

    public function crear(){
        $caja = $this->caja->estado();
        if (isset($caja->descripcion) && $caja->descripcion=="Abierta") {
            $num_documento = $this->venta->formatoDocumento($this->venta->ultimoDocumento());
            $clientes = $this->cliente->getAll('clientes', "estatus = 'ACTIVO'");
            $categorias = $this->cliente->getAll('categorias', "estatus = 'ACTIVO'");
            $productos = $this->producto->getAll('v_inventario', "estatus = 'ACTIVO' AND stock > 0 AND precio_venta != 'null'");
            $iva = $this->producto->getValorColumna('impuestos','valor','id = 2');

            return View::getView('Venta.create', 
            [ 
                'productos' => $productos, 
                'clientes' => $clientes,
                'categorias' => $categorias,
                'numeroDocumento' => $num_documento,
                'iva' => $iva
            ]);
        }
        else{
            return View::getView('Venta.cajaCerrada');
        }
        
    }

    public function listar(){

        $method = $_SERVER['REQUEST_METHOD'];

            if( $method != 'POST'){
            http_response_code(404);
            return false;
            }

            $ventas = $this->venta->listar();

            foreach($ventas as $venta){

                if($venta->estatus == 'ACTIVO'){
                    $venta->estado = "<a href='" . $this->encriptar($venta->id) . "' class='btn btn-success estatus'><i class='fas fa-check-circle'></i> Activa</a>";
                }else{
                    $venta->estado = "<a href='" . $this->encriptar($venta->id) . "' class='btn btn-danger estatus'><i class='fas fa-window-close'></i> Anulada</a>";
                }

                $venta->button = 
                "<a href=".ROOT."venta/mostrar/". $this->encriptar($venta->id) ."' class='mostrar btn btn-info'><i class='fas fa-search'></i></a>".
                "<a href=".ROOT."venta/ventaPDF/". $this->encriptar($venta->id) ."' class='pdf btn btn-danger m-1'><i class='fas fa-file-pdf'></i></a>";
            }

        http_response_code(200);

        echo json_encode([
        'data' => $ventas
        ]);

    }

    public function mostrar($param){

        $idVenta = $this->desencriptar($param);

        $query = $this->venta->query("SELECT v.id, v.codigo, Date_format(v.fecha,'%d/%m/%Y') AS fecha, 
            Date_format(v.fecha,'%H:%i') AS hora, c.documento AS rif_cliente, c.nombre AS cliente, 
            c.direccion, v.estatus, v.metodo_pago, v.monto_pago, v.nota as nota_pago FROM
            ventas v
                LEFT JOIN
            clientes c
                ON v.cliente_id = c.id
            WHERE v.id = '$idVenta' LIMIT 1");

        $query2 = $this->venta->query("SELECT v.id, p.codigo, p.nombre, dv.cantidad, dv.precio FROM 
            productos p 
                JOIN
            detalle_venta dv
                ON p.id = dv.producto_id
                JOIN
            ventas v 
                ON dv.venta_id = v.id
            WHERE v.id = '$idVenta'");
            
        // Encabezado Venta
        $venta = $query->fetch(PDO::FETCH_OBJ);

        // Detalles Venta
        $productos = $query2->fetchAll(PDO::FETCH_OBJ);
        $dolar = $this->venta->getAll('dolar');
        http_response_code(200);

        echo json_encode([
            'venta' => $venta,
            'productos' => $productos,
            'dolar' => $dolar[0]->precio
        ]);

        exit();
    }

    public function guardar(){

        $venta = new Venta;

        $num_documento = $this->venta->formatoDocumento($this->venta->ultimoDocumento());

        $venta->setNumeroDocumento($num_documento);
        $venta->setPersonaId($_POST['cliente']);
        $venta->setTotal($_POST['total']);
        $venta->setMetodoPago($_POST['metodoPago']);
        $venta->setMontoPago($_POST['montoPago']);
        $venta->setNotaPago(strtoupper($_POST['notaPago']));

        $lastId = $venta->registrar($venta);

        $productos = $_POST['productos'];
        $cantidad = $_POST['cantidades'];
        $precio = $_POST['precios'];


        $contador = 0;
        foreach($productos AS $producto){

            $detalleVenta = new DetalleVenta();
            
            $detalleVenta->setProductoId($productos[$contador]);
            $detalleVenta->setVentaId($lastId);
            $detalleVenta->setCantidad($cantidad[$contador]);
            $detalleVenta->setPrecio($precio[$contador]);

            $this->detalleVenta->registrar($detalleVenta);

            $contador++;
        }

        http_response_code(200);
          
        echo json_encode([
          'titulo' => 'Venta Registrada!',
          'mensaje' => 'Se ha registrado correctamente la venta',
          'tipo' => 'success'
        ]);
  
        exit();

    }

    public function cambiarEstatus($param){
        $id = $this->desencriptar($param);

        $estatus = $this->venta->cambiarEstatus('ventas', $id);

        if($estatus){
            http_response_code(200);

            echo json_encode([
                'titulo' => 'Estatus actualizado',
                'mensaje' => 'Estatus de la venta actualizado correctamente',
                'tipo' => 'success'
            ]);

            exit();
        }else {
            http_response_code(200);

            echo json_encode([
                'titulo' => 'Error al Cambiar estatus',
                'mensaje' => 'Ocurrio un error al intentar cambiar el estatus',
                'tipo' => 'error'
            ]);

            exit();
        }
    }

    public function ventaPDF($param){

        $idVenta = $this->desencriptar($param);

        $query = $this->venta->query("SELECT v.id, v.codigo, Date_format(v.fecha,'%d/%m/%Y') AS fecha, Date_format(v.fecha,'%H:%i') AS hora, c.documento AS rif_cliente, c.nombre AS cliente, c.direccion, v.estatus FROM
            ventas v
                LEFT JOIN
            clientes c
                ON v.cliente_id = c.id
            WHERE v.id = '$idVenta' LIMIT 1");

        $query2 = $this->venta->query("SELECT v.id, p.codigo, p.nombre, dv.cantidad, dv.precio FROM 
            productos p 
                JOIN
            detalle_venta dv
                ON p.id = dv.producto_id
                JOIN
            ventas v 
                ON dv.venta_id = v.id
            WHERE v.id = '$idVenta'");
            
        // Encabezado Venta
        $venta = $query->fetch(PDO::FETCH_OBJ);

        // Detalles Venta
        $productos = $query2->fetchAll(PDO::FETCH_OBJ);
        $dolar = $this->venta->getAll('dolar');
        ob_start();

        View::getViewPDF('FormatosPDF.Venta', [
            'venta' => $venta,
            'productos' => $productos,
            'dolar' => $dolar[0]->precio
        ]);

        $html = ob_get_clean();

        $this->crearPDF($html);

    }

    public function productosPorCategoria(){
        if( $_SERVER['REQUEST_METHOD'] != 'POST'){
            http_response_code(404);
            return false;
        }
        if($_POST['categoria']!=0){
            $productos = $this->producto->getAll('v_inventario', "estatus = 'ACTIVO' AND stock > 0 AND precio_venta != 'null' AND id IN (SELECT id FROM productos WHERE categoria_id = $_POST[categoria])");
        }
        else{
            $productos = $this->producto->getAll('v_inventario', "estatus = 'ACTIVO' AND stock > 0 AND precio_venta != 'null'");
        }
       
        http_response_code(200);

        echo json_encode([
        'data' => $productos
        ]);
    }
    public function abrirCaja()
    {
        $proceso = $this->caja->abrir();
        if($proceso){
            http_response_code(200);

            echo json_encode([
                'titulo' => 'Caja Abierta!',
                'mensaje' => 'La Caja ha sido abierta',
                'tipo' => 'success'
            ]);

            exit();
        }else {
            http_response_code(200);

            echo json_encode([
                'titulo' => 'Error al abrir la Caja',
                'mensaje' => 'Hubo un problema al abrir la Caja',
                'tipo' => 'error'
            ]);

            exit();
        }
    }
    public function cerrarCaja()
    {
        $proceso = $this->caja->cerrar();
        $desde = $this->caja->ultApertura();
        $hasta = $this->caja->ultCierre();
        $query = $this->venta->connect()->prepare("SELECT COUNT(id) as total FROM ventas WHERE estatus = 'ACTIVO' AND usuario_id = :usuario AND fecha BETWEEN
                :desde AND :hasta
            ");
        $query->bindParam(':usuario',$_SESSION['id']);
        $query->bindParam(':desde',$desde->fecha);
        $query->bindParam(':hasta',$hasta->fecha);
        $query->execute();
        $ventas = $query->fetch(PDO::FETCH_OBJ);
        
        if($proceso){
            http_response_code(200);

            echo json_encode([
                'desde' => $desde->fecha_f,
                'hasta' => $hasta->fecha_f,
                'total' => $ventas->total,
                'vendedor' => $_SESSION['id'],
                'apertura' => $desde->fecha,
                'cierre' => $hasta->fecha
            ]);

            exit();
        }else {
            http_response_code(200);

            echo json_encode([
                'titulo' => 'Error al cerrar la Caja',
                'mensaje' => 'Hubo un problema al cerrar la Caja',
                'tipo' => 'error'
            ]);

            exit();
        }
    }

}