<?php

namespace System\Core;

use PDO;

class Database {
    private $driver = 'mysql';
    private $host = 'localhost';
    private $dbname = 'marcket';
    private $user = 'root';
    private $password = 'informatica';

    public function __construct(){
        $this->connect();
    }

    public function connect(){
        $connection = new PDO("$this->driver:host=$this->host; dbname=$this->dbname", $this->user, $this->password);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $connection->exec("SET CHARACTER SET utf8");//Para poder enviar caracteres especiales UTF8 a la DB. Está sentencia no es válida en todos los gestores de DB
        // echo 'Conexion exitosa';
        return $connection;
    }
}