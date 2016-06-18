<?php
    class demo extends auth {
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }

        public function testios() {
            $info = array("123", "321321");
            
            if ($this->setcachenx("1223e3", $info)) {
                dump($this->getcache("123"));
            } else {
                echo "ex";
            }
        }

        public function testandroid() {
            log_trace(dump($_POST, false));
        }
        
        public function register() {
            $url = $this->save_img($_FILES["icon"], "icon");
            $username = $_POST['username'];
            $passwd = $_POST['passwd'];

            $res = $this->call("Prgs_account_register", "'{$username}', '{$passwd}', '{$url}'");
            if ($res[0][0]->res == 0) {
                $res[0][0]->username = $username;
                $res[0][0]->token = md5($res[0][0]->id . range(0, 10000));
                $res[0][0]->icon = $url;
                
                $this->setcache(rediskey::ACCOUNT_INFO . $res[0][0]->id, $res[0][0]);
                
                $res[0][0]->icon = config('CDN_DOMAIN') . $url;
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0][0]);
            } else {
                $this->json_return(erron::ERROR_REGISTER_ERROR, err_des::ERROR_REGISTER_ERROR, $res[0][0]);
            }
        }
        
        public function login() {
            $username = $_POST['username'];
            $passwd = $_POST['passwd'];
            log_trace("username : {$username}, passwd : {$passwd}");
            $res = $this->call("Prgs_account_login", "'{$username}', '{$passwd}'");
            if ($res[0][0]->res == 0) {
                $value = $this->getcache(rediskey::ACCOUNT_INFO . $res[0][0]->id);
                $value->icon = config('CDN_DOMAIN') . $value->icon;
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $value);
            } else {
                $this->json_return(erron::ERROR_REGISTER_ERROR, err_des::ERROR_REGISTER_ERROR, $res[0][0]);
            }
        }
        
        public function updateinfo() {
            $id = $_POST['id'];
            $token = $_POST['token'];
            $value = $this->getcache(rediskey::ACCOUNT_INFO . $id);
            if ($value == null) {
                $this->json_return(erron::ERROR_U_NEED_LOGIN, err_des::ERROR_U_NEED_LOGIN, null);
            } else if ($value->id == $id && $value->token == $token) {
                $url = $this->save_img($_FILES["icon"], "icon");
                
                $value->icon = $url;
                $this->setcache(rediskey::ACCOUNT_INFO . $value->id, $value);
                $value->icon =  config('CDN_DOMAIN') . $url;
                
                $res = $this->call("Prgs_account_update_info", "{$id}, '{$url}'");
                if ($res[0][0]->res == 0) {
                    $this->json_return(erron::ERROR_UNKNOWN, err_des::ERROR_UNKNOWN, $value);
                }
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $value);
            } else {
                $this->json_return(erron::ERROR_U_NEED_LOGIN, err_des::ERROR_U_NEED_LOGIN, null);
            }
            
        }
        
        // public function test_redis() {
        //     $this->setcache("hello redis", "hello 2");
        //     $value = $this->getcache("hello redis");
        //     echo $value;
        // }
        
        // public function test_mysql() {
        //     $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $this->querydb("select * from account;"));
        // }
        
        public function mailtest() {
            $recvers = array($_GET['recver']);
            $this->SendMail($recvers, $_GET['subject'], $_GET['content']);
            echo "send success";
        }
        public function test(){
            phpinfo();
        }
    }
    
