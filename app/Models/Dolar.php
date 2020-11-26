<?php

namespace App\Models;

use PDO;
use System\Core\Model;

class Dolar extends Model{

    private $id;
    private $nombre;
    private $precio;

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

    public function getNombre(){
        return $this->nombre;
    }

    public function setNombre($nombre){
        $this->nombre = $nombre;
    }

    public function getPrecio(){
        return $this->precio;
    }

    public function setPrecio($precio){
        $this->precio = $precio;
    }


    /**
     * Metodos
     */

    public function listar(){
        try{
            $consulta = parent::connect()->prepare("SELECT id, nombre, precio FROM dolar  ");
            $consulta->execute();
            
            return $consulta->fetchAll(PDO::FETCH_OBJ);
            
        } catch (Exception $ex) {
            die($ex->getMessage());
        }
    }
    
    public function registrar(Dolar $dolar){
        try{
            $consulta = parent::connect()->prepare("INSERT INTO dolar(nombre, precio) "
                . "VALUES (:nombre, :precio)");
        
        
            $nombre = $dolar->getNombre();
            $precio = $dolar->getPrecio();
            
            $consulta->bindParam(":nombre", $nombre);
            $consulta->bindParam(":precio", $precio);
            
            return $consulta->execute();
            
        } catch (Exception $ex) {
            return $ex->getMessage();
        }
    }

    public function actualizar(Dolar $dolar){
        try{
            $consulta = parent::connect()->prepare("UPDATE dolar SET nombre=:nombre, precio=:precio WHERE id=:id");


            $id = $dolar->getId();
            $nombre = $dolar->getNombre();
            $precio = $dolar->getPrecio();
            
            
            $consulta->bindParam(":id", $id);
            $consulta->bindParam(":nombre", $nombre);
            $consulta->bindParam(':precio', $precio);
           
            return $consulta->execute();
                    
        } catch (Exception $ex) {
            return $ex->getMessage();            
        }
    }




}