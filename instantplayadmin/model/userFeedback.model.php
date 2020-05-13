<?php
class UserFeedbackModel {
	static $_table = 'user_feedback';
    static $_pk = 'id';
    static $_db = null;
    static $_db_key = "instantplay";

    const STATUS_WAIT = 1;
    const STATUS_OK = 2;
    CONST STATUS  = [
        self::STATUS_WAIT=>"未处理",
        self::STATUS_OK=>"已处理",
    ];

    static function db(){
        if(self::$_db)
            return self::$_db;

        self::$_db = new DbLib(self::$_db_key,self::$_table,self::$_pk);
        return self::$_db;
    }
    public static function __callStatic($func, $arguments){
        return call_user_func_array(array(self::db(),$func), $arguments);
    }

    static function getListByUid($uid){
        $list = self::db()->getAll(" uid = $uid");
        return $list;
    }


}