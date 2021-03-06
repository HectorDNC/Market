<?php

namespace App\Models;

use PDO;

class Proveedor extends Persona{

    public function listar(){
        try{
            $consulta = parent::connect()->prepare("SELECT * FROM proveedores ORDER BY created_at DESC");
            $consulta->execute();


            
            return $consulta->fetchAll(PDO::FETCH_OBJ);
            
        } catch (Exception $ex) {
            die($ex->getMessage());
        }
    }

    public function registrar(Proveedor $proveedor){
        try{
            $consulta = parent::connect()->prepare("INSERT INTO proveedores(documento, razon_social, direccion, telefono, estatus) "
                . "VALUES (:documento, :razon_social, :direccion, :telefono, :estatus)");
        
            //$id = $u->getId();
            $documento= $proveedor->getTipoDocumento()."-".$proveedor->getDocumento();
            $razon_social = $proveedor->getNombre();
            $direccion = $proveedor->getDireccion();
            $telefono = $proveedor->getTelefono();
            $estatus = $proveedor->getEstatus();
            
            $consulta->bindParam(":documento", $documento);
            $consulta->bindParam(":razon_social", $razon_social);
            $consulta->bindParam(":direccion", $direccion);
            $consulta->bindParam(":telefono", $telefono);
            $consulta->bindParam(":estatus", $estatus);

            return $consulta->execute();
            
        } catch (Exception $ex) {
            return $ex->message();
            die();
        }
    }

    public function actualizar(Proveedor $proveedor){
        try{
            $consulta = parent::connect()->prepare("UPDATE proveedores SET documento=:documento, razon_social=:razon_social, direccion=:direccion, telefono=:telefono, estatus=:estatus WHERE id=:id");


            $id = $proveedor->getId();
            $documento= $proveedor->getTipoDocumento()."-".$proveedor->getDocumento();
            $razon_social = $proveedor->getNombre();
            $direccion = $proveedor->getDireccion();
            $telefono = $proveedor->getTelefono();
            $estatus = "ACTIVO";
            
            $consulta->bindParam(":id", $id);
            $consulta->bindParam(":documento", $documento);
            $consulta->bindParam(":razon_social", $razon_social);
            $consulta->bindParam(":direccion", $direccion);
            $consulta->bindParam(":telefono", $telefono);
            $consulta->bindParam(":estatus", $estatus);

            return $consulta->execute();
                    
        } catch (Exception $ex) {
            
            return $ex->getMessage();
        }
    }
    
}