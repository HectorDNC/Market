<?php

namespace App\Controllers;
use Exception;
use PDO;
use App\Models\Cliente;
use App\Models\Compra;
use App\Models\Producto;
use App\Models\Venta;
use System\Core\Controller;
use System\Core\View;

class HomeController extends Controller{

    private $cliente;
    private $producto;
    private $compra;
    private $venta;

    public function __construct(){
        $this->cliente = new Cliente;
        $this->producto = new Producto;
        $this->compra = new Compra;
        $this->venta = new Venta;
    }

    public function index(){
        $query = $this->venta->connect()->prepare("SELECT v.codigo as codigo, Date_format(v.fecha,'%d/%m/%Y %r') as fecha, c.nombre as cliente FROM ventas v LEFT JOIN clientes c ON v.cliente_id=c.id WHERE v.estatus='ACTIVO' ORDER BY v.fecha DESC LIMIT 10");
        $query->execute();
        $ventas = $query->fetchAll(PDO::FETCH_OBJ);
        return View::getView('Home.index', [
            'clientes' => $this->cliente->contar('clientes'),
            'productos' => $this->producto->contar('productos'),
            'compras' => $this->compra->contar('compras'),
            'ventas' => $this->venta->contar('ventas'),
            'ventasD' => $ventas
        ]);
    }
}