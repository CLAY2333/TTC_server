<?php
    class account extends auth {
        public function regular_email($email) {
            if (!preg_match(regular::email, $email)) {
                $this->json_return(erron::ERROR_EMAIL_REGULAR_ERROR, err_des::ERROR_EMAIL_REGULAR_ERROR, null);
            }
        }
        
        public function query_email_verify_code() {
            $this->regular_email($_GET['email']);
            $email = $_GET['email'];

            $verify = "";
            for($i=0; $i<6; $i++) {
                $verify = $verify . chr(mt_rand(ord('A'), ord('Z')));
            }
            
            $this->setcache(rediskey::VERIFY_EMAIL.$email, $verify);
            $this->SendMail(array($email), appdesc::VERIFY_CODE_EMAIL_SUBJECT, appdesc::VERIFY_CODE_EMAIL_CONTENT.$verify);
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, "ok");
        }
            
        public function email_login() {
            $this->regular_email($_GET['email']);
            
            $email = $_GET['email'];
            $code = $_GET['code'];
            $verify = $this->getcache(rediskey::VERIFY_EMAIL.$email);
            $this->delcache(rediskey::VERIFY_EMAIL.$email);
            if ($code != $verify) {
                $this->json_return(erron::ERROR_VERIFY_CODE_ERROR, err_des::ERROR_VERIFY_CODE_ERROR, null);
            }
            $info = $this->call(prgs::EMAIL_LOGIN, "'{$email}', '{$code}'");
            $auth = $this->saveauth($info[0][0]);
            log_trace("saveauth : " . json_encode($info[0][0]));
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $auth);
        }
    }
