<?php
class AgentModel {
	static $_table = 'agent';
	static $_pk = 'id';
	static $_db = null;
    static $_db_key = "instantplay";


	static function db(){
		if(self::$_db)
			return self::$_db;

		self::$_db = new DbLib(self::$_db_key,self::$_table,self::$_pk);
		return self::$_db;
	}
	
	public static function __callStatic($func, $arguments){
		return call_user_func_array(array(self::db(),$func), $arguments);
	}

    const STATUS_AUDITING = 1;
    const STATUS_REJECT = 2;
    const STATUS_OK = 3;

    const STATUS = [
        self::STATUS_AUDITING => "审核中",
        self::STATUS_REJECT => "拒绝",
        self::STATUS_OK => "通过",
    ];

    static function getStatusSelectOptionHtml(){
        $html = "";
        foreach (self::STATUS as $k=>$v) {
            $html .= "<option value='{$k}'>{$v}</option>";
        }
        return $html;
    }
}