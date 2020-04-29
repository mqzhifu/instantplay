<?php
define ('BASE_DIR' , dirname (   dirname(__FILE__) ) )  ;
define('APP_NAME', 'instantplayadmin');
define("RUN_ENV","WEB");

//include BASE_DIR . "/config/" . APP_NAME . "/env.php";
include BASE_DIR . '/kernel/z.class.php';

define("OUT_TYPE",'null');
define("IS_ADMIN",1);

z::init();
z::runWebApp();

