<?php
$code = array(
    200=>'成功',


    1000=>'appId为空',
    1001=>'uid为空',
    1002=>'ps为空',
    1003=>'appid不在DB中',
    1004=>'密码错误',
    1005=>'uinfo is null',
    1006=>'roomId is null',
    1007=>'win uid is null',

    1100=>'token解析失败',
    1101=>'不要重复登陆',
    1102=>'token为空',

    1200=>'匹配超时',
    1201=>'未匹配到用户',
    1202=>'匹配成功',

    2000=>'type id not in db',
    2001=>'正在匹配中',
    2002=>'正在游戏中',
    2003=>'已掉线',
    2004=>'非匹配中状态',
    2005=>'非游戏中状态',
    2006=>'roomId uid 对不上',
    2007=>'roomId uid 对不上,非本人操作',
    2008=>'已匹配到真人，不能取消',
    2009=>'用户游戏中',
    2010=>'用户匹配中',
    2011=>'用户为非：匹配成功状态',
    2012=>'您有<等待开始>的游戏，不能再报名了',

    2100=>'获取锁失败',
    2101=>'没有需要匹配的用户',

    4000=>'roomId 错误，非本要请不要操作',
    4001=>'两边均，游戏未开始',
    4002=>'游戏已结束',
//    4003=>'MYSQL数组记录数错误',
    4004=>'uinfo roomID 与 参数roomId对不上',
    4005=>'游戏未结束',

    3000=>'roomId not in db',
);
$GLOBALS['code'] = $code;