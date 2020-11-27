<?php

namespace App\Controllers;

use App\Models\Dolar;
use App\Traits\Utility;
use System\Core\Controller;
use System\Core\View;

class DolarController extends Controller{
    private $dolar;

    use Utility;

    public function __construct(){
        $this->dolar = new Dolar;
    }

    public function index(){
        return View::getView('Dolar.index');
    }

    public function mostrar($param){

        $param = $this->desencriptar($param);
        
        $dolar = $this->dolar->getOne('dolar', $param);

        http_response_code(200);

        echo json_encode([
            'data' => $dolar
        ]);
    }

    public function listar(){

        $method = $_SERVER['REQUEST_METHOD'];

            if( $method != 'POST'){
            http_response_code(404);
            return false;
            }

            $dolares = $this->dolar->listar();

            foreach($dolares as $dolar){

            $dolar->button = 
            "<a href=".ROOT."dolar/mostrar/". $this->encriptar($dolar->id) ."' class='mostrar btn btn-info'><i class='fas fa-search'></i></a>".
            "<a href=".ROOT."dolar/mostrar/". $this->encriptar($dolar->id) ."' class='editar btn btn-warning m-1'><i class='fas fa-pencil-alt'></i></a>";

        }

        http_response_code(200);

        echo json_encode([
        'data' => $dolares
        ]);

    }

    public function guardar(){

        $method = $_SERVER['REQUEST_METHOD'];
    
        if( $method != 'POST'){
          http_response_code(404);
          return false;
        }
    
        $dolar = new Dolar();
    
        $dolar->setNombre(strtoupper($this->limpiaCadena($_POST['nombre'])));

        if($_POST['precio'] != ''){
            $dolar->setPrecio(strtoupper($this->limpiaCadena($_POST['precio'])));
        }else{
            $dolar->setDescripcion(0);
        }
    

        $nombre = $dolar->getNombre();

        $consulta = $this->dolar->query("SELECT * FROM dolar WHERE nombre='$nombre'" ); // Verifica inexistencia de cedula, sies igual a la actual no la toma en cuenta puesto que si registramos un cambio en el nombre se mantiene la misma cedula y afectaria la consulta.
    
        if ($consulta->rowCount() >= 1) {
    
          http_response_code(200);
          
          echo json_encode([
            'titulo' => 'Documento Registrado',
            'mensaje' => $nombre . ' Se encuentra registrado en nuestro sistema',
            'tipo' => 'error'
          ]);
    
          return false;
    
        }
    
        if($this->dolar->registrar($dolar)){
            http_response_code(200);
        
            echo json_encode([
              'titulo' => 'Registro Exitoso',
              'mensaje' => 'Categoria registrado en nuestro sistema',
              'tipo' => 'success'
            ]);
        }else{
            http_response_code(200);
        
            echo json_encode([
              'titulo' => 'Error Inesperado',
              'mensaje' => 'Ocurrio un error durante la operacion!',
              'tipo' => 'error'
            ]);
        }
    
    
    
    }

    public function actualizar(){

      $method = $_SERVER['REQUEST_METHOD'];
    
        if( $method != 'POST'){
          http_response_code(404);
          return false;
        }
    
        $dolar = new Dolar();
        $dolar->setId($_POST['id']);
    
        $dolar->setNombre(strtoupper($this->limpiaCadena($_POST['nombre'])));

        if($_POST['precio'] != ''){
            $dolar->setPrecio(strtoupper($this->limpiaCadena($_POST['precio'])));
        }else{
            $dolar->setPrecio(0);
        }

        $id = $dolar->getId(); 
        $nombre = $dolar->getNombre();
    
        $consulta = $this->dolar->query("SELECT * FROM dolar WHERE nombre='$nombre' AND id<>$id");

        if( $consulta->rowCount() >= 1 ){
          http_response_code(200);
    
          echo json_encode([
            'titulo' => "Categoria $nombre ya existe!",
            'mensaje' => 'Por favor intente de nuevo',
            'tipo' => 'error'
          ]);

          return false;
        }

        if($this->dolar->actualizar($dolar)){
          http_response_code(200);
    
          echo json_encode([
            'titulo' => 'Actualizacion Exitosa',
            'mensaje' => 'Registro actualizado en nuestro sistema',
            'tipo' => 'success'
          ]);
        }else{
          http_response_code(200);
    
          echo json_encode([
            'titulo' => 'Error al Actualizar',
            'mensaje' => 'Ocurrio un error durante la actualizacion',
            'tipo' => 'error'
          ]);
        }
    
    }

    public function eliminar($id){

      $method = $_SERVER['REQUEST_METHOD'];
  
      if( $method != 'DELETE'){
        http_response_code(404);
        return false;
      }
  
      $id = $this->desencriptar($id);
  
      if($this->dolar->eliminar("dolar", $id)){
  
        http_response_code(200);
  
        echo json_encode([
          'titulo' => 'Registro eliminado!',
          'mensaje' => 'Registro eliminado en nuestro sistema',
          'tipo' => 'success'
        ]);
      }else{
        http_response_code(404);
  
        echo json_encode([
          'titulo' => 'Ocurio un error!',
          'mensaje' => 'No se pudo eliminar el registro',
          'tipo' => 'error'
        ]);
      }
    }

    public function eliminarTotal($id){

      $method = $_SERVER['REQUEST_METHOD'];
  
      if( $method != 'DELETE'){
        http_response_code(404);
        return false;
      }
  
      $id = $this->desencriptar($id);
  
      if($this->dolar->eliminarTotal("dolar", $id)){
  
        http_response_code(200);
  
        echo json_encode([
          'titulo' => 'Registro eliminado!',
          'mensaje' => 'Registro eliminado en nuestro sistema',
          'tipo' => 'success'
        ]);
      }else{
        http_response_code(404);
  
        echo json_encode([
          'titulo' => 'Ocurio un error!',
          'mensaje' => 'No se pudo eliminar el registro',
          'tipo' => 'error'
        ]);
      }
    }


    /**
     * API
     */

    public function listarDolar(){

      $dolar = $this->dolar->getAll('dolar');
  
      echo json_encode([
        'data' => $dolar
      ]);
  
      exit();
      
    }
    public function obtenerDolar(){

      $dolar = $this->dolar->getAll('dolar');
  
      echo json_encode([
        'data' => $dolar[0]
      ]);
  
      exit();
      
    }
}