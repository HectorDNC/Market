<?php

namespace App\Controllers;

use App\Models\Empleado;
use App\Models\Asistencia;
use App\Traits\Utility;
use System\Core\Controller;
use System\Core\View;


class EmpleadoController extends Controller{

  use Utility;

  private $empleado;
  private $asistencia;

  public function __construct() {
    if($_SESSION['rol'] != 1){
      header("Location: ".ROOT);
      return false;
    }
      $this->empleado = new Empleado;
  }

  public function index(){
    
    return View::getView('Empleado.index');
  }
  
  public function listar(){

    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'POST'){
      http_response_code(404);
      return false;
    }

    $empleados = $this->empleado->listar();

    foreach($empleados as $empleado){

      $empleado->button = 
      "<a href=".ROOT."empleado/mostrar/". $this->encriptar($empleado->id) ."' class='mostrar btn btn-info'><i class='fas fa-search'></i></a>".
      "<a href=".ROOT."empleado/mostrar/". $this->encriptar($empleado->id) ."' class='editar btn btn-warning m-1'><i class='fas fa-pencil-alt'></i></a>".
      "<a href='". $this->encriptar($empleado->id) ."' class='eliminar btn btn-danger'><i class='fas fa-trash-alt'></i></a>";

    }

    http_response_code(200);

    echo json_encode([
      'data' => $empleados
    ]);

  }

  public function guardar(){

    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'POST'){
      http_response_code(404);
      return false;
    }

    $empleado = new Empleado();

    $empleado->setId($_POST['id']);
    $empleado->setTipoDocumento($_POST['inicial_documento']);
    $empleado->setDocumento($_POST['documento']);
    $empleado->setNombre(strtoupper($this->limpiaCadena($_POST['nombre'])));
    $empleado->setApellido(strtoupper($this->limpiaCadena($_POST['apellido'])));
    $empleado->setDireccion(strtoupper($this->limpiaCadena($_POST['direccion'])));
    $empleado->setTelefono(strtoupper($this->limpiaCadena($_POST['telefono'])));
    $empleado->setEmail(strtoupper($this->limpiaCadena($_POST['correo'])));
    $empleado->setCargo(strtoupper($this->limpiaCadena($_POST['cargo'])));
    $empleado->setEstatus("ACTIVO");


    $documento = $empleado->getTipoDocumento()."-".$empleado->getDocumento();

    $consultaDocumento = $this->empleado->query("SELECT * FROM empleados WHERE documento='$documento'" ); // Verifica inexistencia de cedula, sies igual a la actual no la toma en cuenta puesto que si registramos un cambio en el nombre se mantiene la misma cedula y afectaria la consulta.

    if ($consultaDocumento->rowCount() >= 1) {

      http_response_code(200);
      
      echo json_encode([
        'titulo' => 'Documento Registrado',
        'mensaje' => $documento . ' Se encuentra registrado en nuestro sistema',
        'tipo' => 'error'
      ]);

      return false;

    }

    $this->empleado->registrar($empleado);

    http_response_code(200);

    echo json_encode([
      'titulo' => 'Registro Exitoso',
      'mensaje' => 'Empleado registrado en nuestro sistema',
      'tipo' => 'success'
    ]);


  }

  public function actualizar(){

    $empleado = new Empleado();

    $empleado->setId($_POST['id']);
    $empleado->setTipoDocumento($_POST['inicial_documento']);
    $empleado->setDocumento($_POST['documento']);
    $empleado->setNombre(strtoupper($this->limpiaCadena($_POST['nombre'])));
    $empleado->setApellido(strtoupper($this->limpiaCadena($_POST['apellido'])));
    $empleado->setDireccion(strtoupper($this->limpiaCadena($_POST['direccion'])));
    $empleado->setTelefono(strtoupper($this->limpiaCadena($_POST['telefono'])));
    $empleado->setEmail(strtoupper($this->limpiaCadena($_POST['correo'])));
    $empleado->setCargo(strtoupper($this->limpiaCadena($_POST['cargo'])));
    $empleado->setEstatus("ACTIVO");

    if($this->empleado->actualizar($empleado)){
      http_response_code(200);

      echo json_encode([
        'titulo' => 'Actualización Exitosa',
        'mensaje' => 'Registro actualizado en nuestro sistema',
        'tipo' => 'success'
      ]);
    }else{
      http_response_code(404);

      echo json_encode([
        'titulo' => 'Error al Actualizar',
        'mensaje' => 'Ocurrio un error durante la actualización',
        'tipo' => 'error'
      ]);
    }

  }

  public function mostrar($param){

    $param = $this->desencriptar($param);
    
    $empleado = $this->empleado->getOne('empleados', $param);

    http_response_code(200);

    echo json_encode([
      'data' => $empleado
    ]);
  }

  public function eliminar($id){

    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'DELETE'){
      http_response_code(404);
      return false;
    }

    $id = $this->desencriptar($id);

    if($this->empleado->eliminar("empleados", $id)){

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

  // Asistencias
  public function listarAsistencia($fecha){
    $this->asistencia = new Asistencia;
    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'POST'){
      http_response_code(404);
      return false;
    }
    
    $empleados = $this->empleado->listar();

    
    $asistencias = $this->asistencia->listarAsistenciaEmpleado($fecha);
    
    foreach($empleados as $empleado){
          
      $empleado->fecha = "Inasistente"; 
      $empleado->button =      
          "<a href='". $this->encriptar($empleado->id) ."' class='asistencia btn btn-info' title='Marcar Asistencia'><i class='fas fa-clipboard-check'></i></a>";
    }
    foreach($asistencias as $asistencia){
    
      foreach($empleados as $empleado){
        if ($empleado->fecha == "Inasistente" && $empleado->id == $asistencia->empleado_id) {
          $empleado->fecha = $asistencia->fecha;
          $empleado->button =      
            "<a href='". $this->encriptar($asistencia->asistencia_id) ."' class='inasistencia btn btn-warning' title='Marcar Inasistencia'><i class='fas fa-clipboard'></i></a>";
        }          
      }
    }
    
    http_response_code(200);

    echo json_encode([
      'data' => $empleados
    ]);

  }
  public function marcarInasistencia($param){
    $this->asistencia = new Asistencia;
    $asistencia = new Asistencia;
    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'DELETE'){
      http_response_code(404);
      return false;
    }

    $id = $this->desencriptar($param);
    $asistencia->setId($id);
    $result = $this->asistencia->inasistenciaEmpleado($asistencia);
    if($result){

      http_response_code(200);

      echo json_encode([
        'titulo' => 'Empleado inasistente!',
        'mensaje' => "El Empleado ha sido marcado como inasistente",
        'tipo' => 'success'
      ]);
    }else{
      http_response_code(404);

      echo json_encode([
        'titulo' => 'Ocurio un error!',
        'mensaje' => $result,
        'tipo' => 'error'
      ]);
    }
    

  }
  public function marcarAsistencia(){
    $this->asistencia = new Asistencia;
    $asistencia = new Asistencia;
    $method = $_SERVER['REQUEST_METHOD'];

    if( $method != 'POST'){
      http_response_code(404);
      return false;
    }

    $id = $this->desencriptar($_POST['id']);
    $fecha = $_POST['fecha'];
    $asistencia->setPersona_id($id);
    $asistencia->setFecha($fecha);
    $result = $this->asistencia->asistenciaEmpleado($asistencia);
    if($result){

      http_response_code(200);

      echo json_encode([
        'titulo' => 'Empleado asistente!',
        'mensaje' => "El Empleado ha sido marcado como asistente",
        'tipo' => 'success'
      ]);
    }else{
      http_response_code(404);

      echo json_encode([
        'titulo' => 'Ocurio un error!',
        'mensaje' => $result,
        'tipo' => 'error'
      ]);
    }
    

  }

}
