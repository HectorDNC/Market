<?php

namespace App\Models;

use PDO;
use System\Core\Model;

class VentaPago extends Model{
    private $ventaId;
    private $metodoPago;
    private $montoPago; 

    public function setVentaId($ventaId)
    {
        $this->ventaId = $ventaId;
    }    
    public function setMetodoPago($metodoPago)
    {
        $this->metodoPago = $metodoPago;
    }
    public function setMontoPago($montoPago)
    {
        $this->montoPago = $montoPago;
    }
    public function getVentaId()
    {
        return $this->ventaId;
    }
    public function getMetodoPago()
    {
        return $this->metodoPago;
    }
    public function getMontoPago()
    {
        return $this->montoPago;
    }

    public function registrar(VentaPago $ventaPago){
        try{
            $consulta = parent::connect()->prepare("INSERT INTO venta_pago(venta_id, metodo, monto) VALUES 
                                                                     (:venta_id, :metodo, :monto)");

            $venta_id = $ventaPago->getVentaId();
            $metodo = $ventaPago->getMetodoPago();
            $monto = $ventaPago->getMontoPago();

            $consulta->bindParam(":venta_id", $venta_id);
            $consulta->bindParam(":metodo", $metodo);
            $consulta->bindParam(":monto", $monto);

            $consulta->execute();

            return true;

        }catch(Exception $ex){
            return $ex->message();
        }
    }
}