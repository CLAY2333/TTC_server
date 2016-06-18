<?php

require "{$_SERVER['DOCUMENT_ROOT']}/info/config.php";
require "{$_SERVER['DOCUMENT_ROOT']}/info/error.php";
require "{$_SERVER['DOCUMENT_ROOT']}/info/define.php";
require "{$_SERVER['DOCUMENT_ROOT']}/info/dbdefine.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/tools.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/base.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/action.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/mem.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/db.php";
require "{$_SERVER['DOCUMENT_ROOT']}/logic/instance.php";
require "{$_SERVER['DOCUMENT_ROOT']}/ext/phpmailer/class.phpmailer.php";

if (!config('DEBUG')) {
    error_reporting(0);
}
session_start();
header("Access-Control-Allow-Origin: http://localhost:7456");
call($_SERVER['PATH_INFO']);


/*apache rewrite
<VirtualHost 139.196.50.172>
    DocumentRoot /opt/jah/
    ServerName jah.kakasky.org
    ErrorLog logs/jah.kakasky.com-error_log
    CustomLog logs/jah.kakasky.com-access_log common

    RewriteEngine On
    RewriteRule ^/static/(.*)$ /static/$1 [L,NC]
    RewriteRule ^/(.*)$ /index.php/$1 [L,NC]
    RewriteRule ^/(.*)$ /index.php/$1 [L,NC]
    RewriteRule ^/(.*)$ /index.php/$1 [L,NC]
    RewriteRule ^/(.*)$ /index.php/$1 [L,NC]
</VirtualHost>
 */
