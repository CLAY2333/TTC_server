<?php
    class picmgr extends auth {
        
        public function upload_icon() {
            
            $url = array();
            foreach ($_FILES as $info) {
                array_push($url, $this->upload("icon", $info));
            }
            
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $url);
        }
        
        public function upload_res() {
            $values = $_GET;
            if ($values == null) {
                $values = $_POST;
            }
            $info = $this->checkauth($values['accountid'], $values['token']);
            $url = array();
            foreach ($_FILES as $info) {
                array_push($url, $this->upload("res", $info));
            }
            
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, stripslashes(json_encode($url)));
        }
        
        private function upload($path, $info) {
            log_error(dump($_FILES, false));
            
            if ($info["error"] > 0) { 
                log_error("Error: " . $info["error"]); 
                return null;
            } else {                 
                // if ($info["size"] > 1024 * 1024 * 1024 || $info["size"] <= 0) {
                //     return null;
                // }
                
                $name = $this->get_name($info["tmp_name"]);
                if(move_uploaded_file($info['tmp_name'], "{$_SERVER['DOCUMENT_ROOT']}static/mobile/{$path}/{$name}")) {
                    log_trace("move_uploaded_file {$info['tmp_name']} to {$_SERVER['DOCUMENT_ROOT']}static/mobile/{$path}/{$name} success");
                    $url = config('CDN_DOMAIN') . "/static/mobile/{$path}/{$name}";
                    return $url;
                }
                log_error("move_uploaded_file {$info['tmp_name']} to {$_SERVER['DOCUMENT_ROOT']}static/mobile/{$path}/{$name} error");
                return null;
            } 
        }
        
        public function get_name($file) {
            $name = $this->microtime_float() . "_" . md5($file) . ".png";
            return $name;
        }
        
    }
