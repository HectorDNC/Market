<?php

namespace App\Models;

use PDO;
use System\Core\Model;

class Asistencia extends Model{

    private $id;
    private $descripcion;
    private $persona_id;
    private $fecha;

    public function __construct(){
    }

    /**
     * Getter and Setter
     */

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getDescripcion(){
        return $this->descripcion;
    }

    public function setDescripcion($descripcion){
        $this->descripcion = $descripcion;
    }

    public function getPersona_id(){
        return $this->persona_id;
    }

    public function setPersona_id($persona_id){
        $this->persona_id = $persona_id;
    }
    public function getFecha(){
        return $this->fecha;
    }

    public function setFecha($fecha){
        $this->fecha = $fecha;
    }


    /**
     * Metodos
     */

    
    public function listarAsistenciaEmpleado($fecha = NULL)
    {
        if ($fecha == NULL) {
            $fecha = date("Y-m-d");
        }
        $desde = $fecha." 00:00:00";
        $hasta = $fecha." 23:59:59";
        try{
            $consulta = parent::connect()->prepare("SELECT e.id, e.documento, 
            CONCAT(e.nombre, ' ', e.apellido) as nombre, a.id as asistencia_id, a.empleado_id, 
            Date_format(a.fecha, '%r') as fecha FROM empleados e LEFT JOIN asistencia_empleado a ON e.id = a.empleado_id
            WHERE a.fecha BETWEEN '$desde' AND '$hasta'");
            $consulta->execute();
            
            return $consulta->fetchAll(PDO::FETCH_OBJ);
            
        } catch (Exception $ex) {
            die($ex->getMessage());
        }
    }
    public function asistenciaEmpleado(Asistencia $asistencia){
        try{
            $fechaActual = date("Y-m-d");
            $id = $asistencia->getPersona_id();
            $fecha = $asistencia->getFecha();
            if ($fecha == $fechaActual) {
                $consulta = parent::connect()->prepare("INSERT INTO asistencia_empleado(empleado_id) "
                . "VALUES (:empleado_id)");
            }
            else{
                $consulta = parent::connect()->prepare("INSERT INTO asistencia_empleado(empleado_id, fecha) "
                . "VALUES (:empleado_id, :fecha)");
                $consulta->bindParam(":fecha", $fecha); 
            }          
            $consulta->bindParam(":empleado_id", $id);            
                      
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function inasistenciaEmpleado(Asistencia $asistencia){
        try{            
            $sql = "DELETE FROM asistencia_empleado 
                WHERE id = :id";
            $consulta = parent::connect()->prepare($sql);
            
            $id = $asistencia->getId();
            $consulta->bindParam(":id", $id);            
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
   

    
}