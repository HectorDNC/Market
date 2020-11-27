<?php

namespace App\Models;

use PDO;
use System\Core\Model;

class Inventario extends Model{

    public function listar($categoria_id = NULL){

        $conexion = parent::connect();

        try {
            
            if (isset($categoria_id)) {
                $query = $conexion->query("SELECT * FROM v_inventario1 WHERE id IN (SELECT id FROM productos WHERE categoria_id = $categoria_id)");
                
              }
              else{
                $query = $conexion->query("SELECT * FROM v_inventario1");
              }
            
            return $query->fetchAll(PDO::FETCH_OBJ);

        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}