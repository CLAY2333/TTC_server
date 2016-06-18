<?php

function config($index) {
    $config = array(
        //trace_log switch
        'TRACE' => TRUE,
        //debug model switch
        'DEBUG' => FALSE,
        //memcache config
        'MEMCACHE_HOST' => "localhost",
        'MEMCACHE_PORT' => 11211,
        'MEMCACHE_TIME' => 0, //璁剧疆memcache杩囨湡鏃堕棿锛涓烘案涔呮湁鏁

                                                                                   //mysql config
        'MYSQL_SERVER_NAME' => "localhost",
        'MYSQL_DSN' => "mysql:unix_socket=/tmp/mysql.sock;dbname=taotaochi",
        'MYSQL_USERNAME' => "root",
        'MYSQL_PASSWORD' => "",
        'MYSQL_DATABASE' => "taotaochi",
        'PDO_OPTIONS' => array (
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        ),
        'REDIS_IP' => '127.0.0.1',
        'REDIS_PORT' => 6379,
        
        'SMTPCONFIG' => array (
            'host' => "smtp.ym.163.com", 
            'port' => 25, 
            'auth' => true, 
            // "username" => $from, 
            // "password" => $password, 
            // "from" => $from, 
        ),
        'CDN_DOMAIN' => "ttc.komore.cn",
        
        'MAIL_CONFIG' => array (
            'CharSet' => 'UTF-8',
            'SMTPAuth' => true,
            'SMTPSecure' => true,
            'Port' => 465,
            'Host' => "smtp.komore.cn",
            'Username' => "service@komore.cn", 
            'Password' => "jfkds1fMu#$2df",
            //$mail->IsSendmail(); //濡傛灉娌℃湁sendmail缁勪欢灏辨敞閲婃帀锛屽惁鍒欏嚭鐜扳€淐ould not execute: /var/qmail/bin/sendmail 鈥濈殑閿欒鎻愮ず 
            'ReplyTo' => array (
                'email' => "service@komore.cn",
                'name' => "komore service"
            ),
            "IsHtml" => true
        )
    );
    
    return $config[$index];
}