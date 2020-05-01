<?php
class ProductLinkCategoryAttrModel {
	static $_table = 'product';
	static $_pk = 'id';
	static $_db = null;
    static $_db_key = "product_link_category_attr";


	static function db(){
		if(self::$_db)
			return self::$_db;

		self::$_db = new DbLib(self::$_db_key,self::$_table,self::$_pk);
		return self::$_db;
	}
	
	public static function __callStatic($func, $arguments){
		return call_user_func_array(array(self::db(),$func), $arguments);
	}

}