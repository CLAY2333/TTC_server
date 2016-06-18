<?php

class db extends base{

    protected $con = null;

    public function __construct() {
        try {
            $this->con = new PDO(config('MYSQL_DSN'), config('MYSQL_USERNAME'), config('MYSQL_PASSWORD'), config('PDO_OPTIONS'));
        } catch (PDOException $ex) {
            log_error(dump($ex, false));
            $this->con = null;
        }
    }
    
    public function query($sql) {
        log_trace($sql);
        if (!$this->con) {
            $this->json_return(erron::ERROR_DBSERVER_ERROR, err_des::ERROR_DBSERVER_ERROR, null);
        }
        
        $stmt = $this->con->query($sql);
        if ($stmt) {
            $result = array();
            do {
                $rows = $stmt->fetchAll(PDO::FETCH_OBJ);
                if ($rows) {
                    $result[] = $rows;
                }
            } while ($stmt->nextRowset());
            return $result;
        } else {
            $error = $this->con->errorInfo();
            log_error("mysql error : ". $error);
            $this->json_return(erron::ERROR_DBSERVER_ERROR, err_des::ERROR_DBSERVER_ERROR, $error);
        }
    }
    
    public function call($name, $args) {
        $sql = "CALL {$name}({$args})";
        return $this->query($sql);
    }
}
