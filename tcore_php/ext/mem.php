<?php

class mem extends base{
    protected $mem;
            
    public function save($key, $value) {
        if (null == $this->mem) {
            $this->json_return(erron::ERROR_MEMCACHED_ERROR, err_des::ERROR_MEMCACHED_ERROR, null);
        }
        
        return $this->mem->set($key, $value);
    }
    
    public function query($key) {
        if (null == $this->mem) {
            $this->json_return(erron::ERROR_MEMCACHED_ERROR, err_des::ERROR_MEMCACHED_ERROR, null);
        }
        
        $value = $this->mem->get($key);
        return $value;
    }
    
    public function add($key, $value) {
        if (null == $this->mem) {
            $this->json_return(erron::ERROR_MEMCACHED_ERROR, err_des::ERROR_MEMCACHED_ERROR, null);
        }
        
        return $this->mem->add($key, $value);
    }

    public function __construct() {
        $this->mem = new Memcached();
        if (!$this->mem->addServer(config('MEMCACHE_HOST'), config('MEMCACHE_PORT'))) {
            $this->json_return(erron::ERROR_MEMCACHED_ERROR, err_des::ERROR_MEMCACHED_ERROR, null);
        }
    }
    
    public function __destruct() {
        
    }
}

?>