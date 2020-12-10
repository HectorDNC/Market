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
    public function listarAsistenciaUsuario($fecha = NULL)
    {
        if ($fecha == NULL) {
            $fecha = date("Y-m-d");
        }
        $desde = $fecha." 00:00:00";
        $hasta = $fecha." 23:59:59";
        try{
            $consulta = parent::connect()->prepare("SELECT u.id, u.documento, 
            CONCAT(u.nombre, ' ', u.apellido) as nombre, a.id as asistencia_id, a.usuario_id, 
            Date_format(a.fecha, '%r') as fecha FROM usuarios u LEFT JOIN asistencia_usuario a ON u.id = a.usuario_id
            WHERE a.fecha BETWEEN '$desde' AND '$hasta'");
            $consulta->execute();
            
            return $consulta->fetchAll(PDO::FETCH_OBJ);
            
        } catch (Exception $ex) {
            die($ex->getMessage());
        }
    }
    public function asistenciaUsuario(Asistencia $asistencia){
        try{
            $fechaActual = date("Y-m-d");
            $id = $asistencia->getPersona_id();
            $fecha = $asistencia->getFecha();
            if ($fecha == $fechaActual) {
                $consulta = parent::connect()->prepare("INSERT INTO asistencia_usuario(usuario_id) "
                . "VALUES (:usuario_id)");
            }
            else{
                $consulta = parent::connect()->prepare("INSERT INTO asistencia_usuario(usuario_id, fecha) "
                . "VALUES (:usuario_id, :fecha)");
                $consulta->bindParam(":fecha", $fecha); 
            }          
            $consulta->bindParam(":usuario_id", $id);            
                      
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function inasistenciaUsuario(Asistencia $asistencia){
        try{            
            $sql = "DELETE FROM asistencia_usuario 
                WHERE id = :id";
            $consulta = parent::connect()->prepare($sql);
            
            $id = $asistencia->getId();
            $consulta->bindParam(":id", $id);            
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    
    public function verificarAsiUsuHoy($id)
    {
        $fecha = date('Y-m-d');
        $desde = $fecha." 00:00:00";
        $hasta = $fecha." 23:59:59";
        try{            
            $sql = "SELECT * FROM asistencia_usuario 
                WHERE usuario_id = :id AND fecha BETWEEN :desde AND :hasta";
            $consulta = parent::connect()->prepare($sql);
            
            $consulta->bindParam(":id", $id);            
            $consulta->bindParam(":desde", $desde);            
            $consulta->bindParam(":hasta", $hasta);            
            $consulta->execute();   
            $asi = $consulta->fetch(PDO::FETCH_OBJ);   
            return $asi;    
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }

    
}