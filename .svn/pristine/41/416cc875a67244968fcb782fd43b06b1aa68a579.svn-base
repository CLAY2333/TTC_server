<?php
    class action extends base {
        private $redis = null;
        private $db = null;
        
        protected function initredis() {
            $this->redis = new Redis();
            $res = $this->redis->connect(config('REDIS_IP'), config('REDIS_PORT'));
            if (!$res) {
                $this->json_return(erron::ERROR_REDIS_ERROR, err_des::ERROR_REDIS_ERROR, null);
            }
        }
        
        protected function show($tpl) {
            if ($tpl == null) {
                $tpl = "index.html";
            }
            
            $path = "{$_SERVER['DOCUMENT_ROOT']}/tpl/{$GLOBALS['class']}/{$tpl}";
            $content = file_get_contents($path);
            echo $content;
        }
        
        protected function get_auth() {
            $values = $_POST;
            if ($values == null) {
                $values = $_GET;
            }
            
            if (is_null($info) || $info->token != $values["token"]) {
                $this->json_return(erron::ERROR_TOKEN_ERROR, err_des::ERROR_TOKEN_ERROR, null);
            }
            
            return $info;
        }
        
        protected function setcachenx($key, $value) {
            if ($this->redis == null) {
                $this->initredis();
            }
            
            return $this->redis->setnx($key, json_encode($value));
        }
        
        protected function setcache($key, $value) {
            if ($this->redis == null) {
                $this->initredis();
            }
            
            if (false == $this->redis->set($key, json_encode($value))) {
                $this->json_return(erron::ERROR_REDIS_ERROR, err_des::ERROR_REDIS_ERROR, null);
            }
        }
        
        protected function getcache($key) {
            if ($this->redis == null) {
                $this->initredis();
            }
            
            $info = json_decode($this->redis->get($key));
            return $info;
        }
        
        protected function delcache($key) {
            if ($this->redis == null) {
                $this->initredis();
            }
            
            return $this->redis->del($key);
        }
        
        protected function querydb($sql) {
            if ($this->db == null) {
                $this->db = new db();
            }
            return $this->db->query($sql);
        }
        
        protected function call($name, $args) {
            if ($this->db == null) {
                $this->db = new db();
            }
            $sql = "CALL {$name}({$args})";
            return $this->db->query($sql);
        }
        
        
    
        protected function SendMail($recv_array, $subject, $content) {
            $config = config('MAIL_CONFIG');
            try { 
                $mail = new PHPMailer(true); 
                $mail->IsSMTP(); 
                $mail->CharSet=$config['CharSet']; //设置邮件的字符编码，这很重要，不然中文乱码 
                $mail->SMTPAuth = $config['SMTPAuth']; //开启认证
                if ($config['SMTPSecure']) {
                    $mail->SMTPSecure = "ssl";
                }
                $mail->Port = $config['Port']; 
                $mail->Host = $config['Host']; 
                $mail->Username = $config['Username']; 
                $mail->Password = $config['Password'];
                //$mail->IsSendmail(); //如果没有sendmail组件就注释掉，否则出现“Could not execute: /var/qmail/bin/sendmail ”的错误提示 
                $mail->AddReplyTo($config['ReplyTo']['email'], $config['ReplyTo']['name']);//回复地址 
                $mail->From = $config['ReplyTo']['email']; 
                $mail->FromName = $config['ReplyTo']['name'];
                foreach ($recv_array as $key => $value) {
                    $mail->AddAddress($value);
                }
                $mail->Subject = $subject; 
                $mail->Body = $content; 
                $mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; //当邮件不支持html时备用显示，可以省略 
                $mail->WordWrap = 80; // 设置每行字符串的长度 
                //$mail->AddAttachment("f:/test.png"); //可以添加附件
                $mail->IsHTML($config['IsHtml']); 

                $mail->Send(); 
            } catch (phpmailerException $e) {
                $this->json_return(erron::ERROR_MAIL_SYSTEM_ERROR, err_des::ERROR_MAIL_SYSTEM_ERROR, $e->errorMessage());
            }
        }
    }
