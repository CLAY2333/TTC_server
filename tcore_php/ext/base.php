<?php

class base {
    protected function json_return($code, $des, $value) {
        $res['code'] = $code;
        $res['des'] = $des;
        if ($value != null) {
            $res['value'] = $value;
        } else {
            $res['value'] = null;
        }
        
        $ret = json_encode($res);
        log_trace($ret);
        echo $ret;
        exit();
    }
}
