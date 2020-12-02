<?php

namespace App\Controllers;

use App\Models\Compra;
use App\Models\Venta;
use App\Models\Usuario;
use App\Traits\Utility;
use Exception;
use PDO;
use System\Core\Controller;
use System\Core\View;

class ReporteController extends Controller {

    private $compra;
    private $venta;
    private $usuario;
	
	use Utility;

	public function __construct(){
        if($_SESSION['rol'] != 1){
            header("Location: ".ROOT);
            return false;
        }
        $this->compra = new Compra;
        $this->venta = new Venta;
        $this->usuario = new Usuario;
    }
    
    public function index(){
        $query = $this->usuario->connect()->prepare("SELECT id, CONCAT(nombre,' ', apellido) AS nombre FROM
                usuarios WHERE estatus='Activo'");
        $query->execute();
        $usuarios = $query->fetchAll(PDO::FETCH_OBJ);
        return View::getView('Reporte.index',[
            'usuarios' => $usuarios
        ]);
    }
    public function reporteVenta()
    {
        $method = $_SERVER['REQUEST_METHOD'];

        if( $method != 'POST'){
            http_response_code(404);
            return false;
        }  
        $usuario = $_POST['vendedor']; 
        $desde = $_POST['desde']; 
        $hasta = $_POST['hasta']; 
        if($usuario == 0){
            $query = $this->venta->connect()->prepare("SELECT v.codigo, date_format(v.fecha, '%d-%m-%Y %r') as fecha,
                c.nombre as cliente, CONCAT(u.nombre, ' ', u.apellido) as vendedor, SUM(d.precio*d.cantidad) as total
                FROM ventas v INNER JOIN clientes c ON v.cliente_id = c.id 
                INNER JOIN usuarios u ON v.usuario_id = u.id INNER JOIN detalle_venta d ON d.venta_id=v.id
                WHERE v.estatus = 'ACTIVO' AND v.fecha BETWEEN
                :desde AND :hasta GROUP BY d.venta_id ORDER BY v.fecha DESC

            ");
            $vendedores = true;
        }
        else{
            $query = $this->venta->connect()->prepare("SELECT v.codigo, date_format(v.fecha, '%d-%m-%Y %r') as fecha,
                c.nombre as cliente, CONCAT(u.nombre, ' ', u.apellido) as vendedor, SUM(d.precio*d.cantidad) as total
                FROM ventas v INNER JOIN clientes c ON v.cliente_id = c.id 
                INNER JOIN usuarios u ON v.usuario_id = u.id INNER JOIN detalle_venta d ON d.venta_id=v.id
                WHERE v.estatus = 'ACTIVO' AND v.usuario_id = :usuario AND v.fecha BETWEEN
                :desde AND :hasta GROUP BY d.venta_id ORDER BY v.fecha DESC

            ");
            $query->bindParam(':usuario',$usuario);
            $vendedores = false;
        }
        $query->bindParam(':desde',$desde);
        $query->bindParam(':hasta',$hasta);
        $query->execute();
        $ventas = $query->fetchAll(PDO::FETCH_OBJ);
        $dolar = $this->venta->getAll('dolar');
        ob_start();

        View::getViewPDF('FormatosPDF.reporteVenta',[
            'ventas' => $ventas,
            'desde' => $desde,
            'hasta' => $hasta,
            'dolar' => $dolar[0]->precio,
            'vendedores' => $vendedores,
            'cantidad' => 0,
            'usuario' =>$usuario
        ]);

        $html = ob_get_clean();

        $this->crearPDF($html);
       
    }
    
}