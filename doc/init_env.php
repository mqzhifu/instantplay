<?php
$dir = dirname(dirname(__FILE__));

$content = "<?php
define('ENV','#ENV#');
";

$env = $argv[1];

$content = str_replace("#ENV#",$env,$content);

$arr = array("api",'instantplayadmin');
foreach ($arr as $k=>$v) {
    $appDir = $dir . "/$v/env.php";
    $fd = fopen($appDir,"w+");
    fwrite($fd,$content);
}

