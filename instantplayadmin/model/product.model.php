<?php
class ProductModel {
	static $_table = 'product';
	static $_pk = 'id';
	static $_db = null;
    static $_db_key = "instantplay";

    const STATUS_ON = 2;
    const STATUS_OFF = 1;
    const STATUS = [
        self::STATUS_ON => "上架",
        self::STATUS_OFF => "下架",
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

	static function getStatusDescById($id){
        return self::STATUS[$id];
    }

    static function getStatusSelectOptionHtml(){
        $html = "";
        foreach (self::STATUS as $k=>$v) {
            $html .= "<option name='$k'>{$v}</option>";
        }
        return $html;
    }

}