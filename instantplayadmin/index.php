<?php
define("DEBUG",1);

define ('BASE_DIR' , dirname (   dirname(__FILE__) ) )  ;
define('APP_NAME', 'instantplayadmin');
define("RUN_ENV","WEB");

define("IS_ADMIN",1);
define("OUT_TYPE",'null');

include BASE_DIR . '/kernel/z.class.php';
z::run();

