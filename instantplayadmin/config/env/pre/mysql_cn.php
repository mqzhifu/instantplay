<?php
$db_config =  array(
    'instantplay'=>
        array(
            'master'=>array(
                'type'=>'mysql',
                'host'=>'10.10.7.60',
                'user'=>'games',
                'pwd'=>'pu6zMh2CQ55Q',
                'port'=>'3306',
                'db_name'=>'kxgame',
                'db_preifx'=>'',
                'char'=>'utf8',
            ),
            'slave'=>array(
                'type'=>'mysql',
                'host'=>'10.10.7.60',
                'user'=>'games',
                'pwd'=>'pu6zMh2CQ55Q',
                'port'=>'3306',
                'db_name'=>'kxgame',
                'db_preifx'=>'',
                'char'=>'utf8',
            ),
        ),
    'kxgame_log'=>
        array(
            'master'=>array(
                'type'=>'mysql',
                'host'=>'10.10.7.60',
                'user'=>'games',
                'pwd'=>'pu6zMh2CQ55Q',
                'port'=>'3306',
                'db_name'=>'kxgame_log',
                'db_preifx'=>'',
                'char'=>'utf8',
            ),
            'slave'=>array(
                'type'=>'mysql',
                'host'=>'10.10.7.60',
                'user'=>'games',
                'pwd'=>'pu6zMh2CQ55Q',
                'port'=>'3306',
                'db_name'=>'kxgame_log',
                'db_preifx'=>'',
                'char'=>'utf8',
            ),
        ),
);
$GLOBALS['db_config'] = $db_config;
