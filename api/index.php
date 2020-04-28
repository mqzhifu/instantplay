<?php
define ('BASE_DIR' , dirname (   dirname(__FILE__) ) )  ;
define('APP_NAME', 'api');
define("RUN_ENV","WEB");
define("IS_API",1);
define("IS_ADMIN",0);
define("OUT_TYPE",'json');

//include BASE_DIR . "/config/" . APP_NAME . "/env.php";
include BASE_DIR . '/kernel/z.class.php';


z::init();
z::runWebApp();

