<?php

namespace App\Models;

use PDO;
use System\Core\Model;

class Caja extends Model{

    private $id;
    private $descripcion;
    private $usuario_id;
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

    public function getUsuario_id(){
        return $this->usuario_id;
    }

    public function setUsuario_id($usuario_id){
        $this->usuario_id = $usuario_id;
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

    
    
    public function abrir(){
        try{
            $consulta = parent::connect()->prepare("INSERT INTO info_caja(usuario_id, descripcion) "
                . "VALUES (:usuario_id, 'Abierta')");
        
            
            $consulta->bindParam(":usuario_id", $_SESSION['id']);            
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function cerrar(){
        try{
            $consulta = parent::connect()->prepare("INSERT INTO info_caja(usuario_id, descripcion) "
                . "VALUES (:usuario_id, 'Cerrada')");
        
            
            $consulta->bindParam(":usuario_id", $_SESSION['id']);            
            return $consulta->execute();            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function reabrir()
    {
        try{
            $consulta = parent::connect()->prepare("SELECT *, Date_format(fecha, '%d/%m/%Y %r') as fecha_f FROM info_caja 
                WHERE usuario_id = :usuario_id ORDER BY fecha DESC LIMIT 1");
            $consulta->bindParam(":usuario_id", $_SESSION['id']);
            $consulta->execute();
            $result = $consulta->fetch(PDO::FETCH_OBJ);
            if ($result->descripcion == "Cerrada") {
                $query = parent::connect()->prepare("DELETE FROM info_caja WHERE id=$result->id");
                $resultado = $query->execute();
                return $resultado;
            }
            return $resultado;
        }catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function estado()
    {
        try{
            $consulta = parent::connect()->prepare("SELECT *, Date_format(fecha, '%d/%m/%Y %r') as fecha_f FROM info_caja 
                WHERE usuario_id = :usuario_id ORDER BY fecha DESC LIMIT 1");
            $consulta->bindParam(":usuario_id", $_SESSION['id']);
            $consulta->execute();
            $result = $consulta->fetch(PDO::FETCH_OBJ);
            return $result;
        }catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function ultApertura()
    {
        try{
            $consulta = parent::connect()->prepare("SELECT *, Date_format(fecha, '%d/%m/%Y %r') as fecha_f FROM info_caja 
                WHERE descripcion='Abierta' ORDER BY fecha DESC LIMIT 1");
        
            $consulta->execute();
            $result = $consulta->fetch(PDO::FETCH_OBJ);
            return $result;
        }catch (Exception $ex) {
            return $ex->getMessage();
        }
    }
    public function ultCierre()
    {
        try{
            $consulta = parent::connect()->prepare("SELECT *, Date_format(fecha, '%d/%m/%Y %r') as fecha_f FROM info_caja 
                WHERE descripcion='Cerrada' ORDER BY fecha DESC LIMIT 1");
        
            $consulta->execute();
            $result = $consulta->fetch(PDO::FETCH_OBJ);
            return $result;
        }catch (Exception $ex) {
            return $ex->getMessage();
        }
    }

    
}