<?php
class MsgModel {
	static $_table = 'msg';
	static $_pk = 'id';
	static $_db = null;
    static $_db_key = "instantplay";


    static function db(){
        if(self::$_db)
            return self::$_db;

        self::$_db = new DbLib(self::$_db_key,self::$_table,self::$_pk);
        return self::$_db;
    }
}