<?php
class auth extends action {
    protected function saveauth($info) {
        $token = md5(json_encode($info) . microtime_float());
        $info->token = $token;
        $this->setcache(rediskey::ACCOUNT_INFO . $info->id, $info);
        return $info;
    }
    
    protected function getauth($accountid) {
        return $this->getcache(rediskey::ACCOUNT_INFO . $accountid);
    }
    
    protected function checkauth($accountid, $token) {
        if (null == $accountid || null == $token) {
            $this->json_return(erron::ERROR_TOKEN_ERROR, err_des::ERROR_TOKEN_ERROR, "data is null");
        }
        
        $info = $this->getcache(rediskey::ACCOUNT_INFO . $accountid);
        if ($info->token != $token) {
            $this->json_return(erron::ERROR_TOKEN_ERROR, err_des::ERROR_TOKEN_ERROR, null);
        }
        
        return $info;
    }
}
