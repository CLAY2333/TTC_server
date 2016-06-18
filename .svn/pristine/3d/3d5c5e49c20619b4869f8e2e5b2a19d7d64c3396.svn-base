<?php

function GetModule($path_info) {
    //analyze path info, get dir,class and function
    $dir_path = null;
    $class_name = null;
    $path_elm = explode("/", $path_info);
    foreach ($path_elm as $elm) {
        $dir_path = "{$dir_path}/{$class_name}";
        $class_name = $elm;
    }

    //get object and call the fun
    $src_file = "{$dir_path}/{$class_name}.php";
    if (is_file(".{$src_file}")) {
        include_once(".$src_file");
        return new $class_name;
    } else {
        log_error("error path info, {$src_file} dose not exist");
    }
}

function call($path_info) {
    //analyze path info, get dir,class and function
    $path_elm = explode("/", $path_info);
    $GLOBALS['class'] = $path_elm[1];
    $GLOBALS['function'] = $path_elm[2];
    //get object and call the fun
    $src_file = "/logic/{$GLOBALS['class']}.php";
    if (is_file(".$src_file")) {
        include_once(".{$src_file}");
        if (class_exists($GLOBALS['class'])) {
            $module = new $GLOBALS['class'];
            if ($module != null) {
                if (method_exists($module, $GLOBALS['function'])) {
                    $module->$GLOBALS['function']();
                } else {
                    if ($GLOBALS['function'] != null) {
                        log_error("module class <{$GLOBALS['class']}> has no function named {$GLOBALS['function']}");
                    } else {
                        $module->__instance();
                    }
                }
            }
        } else {
            log_error("module class <{$class_name}> is not defined");
        }
    } else {
        log_error("error path info, {$src_file} dose not exist");
    }
}

function dump($var, $echo = true, $label = null, $strict = true) {
    $label = ($label === null) ? '' : rtrim($label) . ' ';
    if (!$strict) {
        if (ini_get('html_errors')) {
            $output = print_r($var, true);
            $output = '<pre>' . $label . htmlspecialchars($output, ENT_QUOTES) . '</pre>';
        } else {
            $output = $label . print_r($var, true);
        }
    } else {
        ob_start();
        var_dump($var);
        $output = ob_get_clean();
        if (!extension_loaded('xdebug')) {
            $output = preg_replace('/\]\=\>\n(\s+)/m', '] => ', $output);
            $output = '<pre>' . $label . htmlspecialchars($output, ENT_QUOTES) . '</pre>';
        }
    }
    if ($echo) {
        echo($output);
        return null;
    } else {
        return $output;
    }
}

function log_trace($log) {
    $file = "{$_SERVER['DOCUMENT_ROOT']}/log/" . date('Y_m_d_H') . "_trace" . ".log";
    file_put_contents($file, "{$GLOBALS['class']}:{$GLOBALS['function']} | " . date('Y-m-d H:i:s') . " | {$log}" . "\n", FILE_APPEND);
}

function log_debug($log) {
    $file = "{$_SERVER['DOCUMENT_ROOT']}/log/" . date('Y_m_d_H') . "_debug" . ".log";
    file_put_contents($file, "{$GLOBALS['class']}:{$GLOBALS['function']} | " . date('Y-m-d H:i:s') . " | {$log}" . "\n", FILE_APPEND);
}

function log_error($log) {
    $file = "{$_SERVER['DOCUMENT_ROOT']}/log/" . date('Y_m_d_H') . "_error" . ".log";
    file_put_contents($file, "{$GLOBALS['class']}:{$GLOBALS['function']} | " . date('Y-m-d H:i:s') . " | {$log}" . "\n", FILE_APPEND);
}

//把xml文件转换为array，把节点的属性也作为改节点的数组元素
//args:$path xml文件路径
//res:array
function xml2array($path) {
    $xml = simplexml_load_file ($path); 
    $str = json_encode($xml);
    $needle = '"@attributes":{';
    $k = stripos($str, $needle);
    while($k) {
        $str2 = substr_replace($str, "", $k, 15);
        $k2 = stripos($str2,"}",$k);
        $str = substr_replace($str2,"", $k2, 1);
        $k = stripos($str, $needle);
    }
    $arr = json_decode($str,TRUE);
    return $arr;
}

function microtime_float() {
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec) * 10000;
}

//$file : file tmp info
function save_file($file, $path, $extensions) {
    $name = microtime_float() . "_" . md5($file) . $extensions;
    if(move_uploaded_file($file, "{$_SERVER['DOCUMENT_ROOT']}{$path}/{$name}")) {
        log_trace("move_uploaded_file {$file} to {$_SERVER['DOCUMENT_ROOT']}{$path}/{$name} success");
        $url = "{$path}/{$name}";
        return $url;
    }
    
    log_error("move_uploaded_file {$file} to {$_SERVER['DOCUMENT_ROOT']}{$path}/{$name} error");
    return null;
} 
