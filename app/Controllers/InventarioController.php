<?php

namespace App\Controllers;

use App\Models\Inventario;
use App\Traits\Utility;
use System\Core\Controller;
use System\Core\View;

class InventarioController extends Controller{

    private $inventario;

    use Utility;

    public function __construct(){
        $this->inventario = new Inventario;
    }

    public function index(){
        return View::getView('Inventario.index');
    }

    public function listar($categoria){
        
        $method = $_SERVER['REQUEST_METHOD'];

        if( $method != 'POST'){
        http_response_code(404);
        return false;
        }
        if ($categoria!=0) {
            $productos = $this->inventario->listar($categoria);
        }
        else{
            $productos = $this->inventario->listar();   
        }

        foreach($productos as $producto){

            $producto->button = 
            "<a href=".ROOT."Producto/mostrar/". $this->encriptar($producto->id) ."' class='mostrar btn btn-info'><i class='fas fa-search'></i></a>";
        }

        http_response_code(200);

        echo json_encode([
        'data' => $productos
        ]);
    }
}