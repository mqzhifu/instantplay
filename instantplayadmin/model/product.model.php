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

    static function upLowestPriceByGoods($pid){
	    $lowest = GoodsModel::db()->getRow(" pid = $pid order by sale_price asc limit 1");
	    if(!$lowest){
            $rs = self::db()->upById($pid,array('lowest_price'=>0));
        }else{
            $rs = self::db()->upById($pid,array('lowest_price'=>$lowest['sale_price']));
        }

        return $rs;
    }

    static function attrParaParserToName($attribute){
        $attribute = json_decode($attribute,true);
        $attributeArr = [];
        foreach ($attribute as $k=>$v) {
            $attrTmp = ProductCategoryAttrModel::db()->getById($k);
            $str = "";
            $attributeArr[$attrTmp['name']] = "";
            foreach ($v as $k2=>$v2) {
                $parTmp = ProductCategoryAttrParaModel::db()->getById($v2);
                $str .= $parTmp['name'] . " ";
            }
            $attributeArr[$attrTmp['name']] = $str;
        }
        return $attributeArr;
    }

    static function getStatusSelectOptionHtml(){
        $html = "";
        foreach (self::STATUS as $k=>$v) {
            $html .= "<option value='{$k}'>{$v}</option>";
        }
        return $html;
    }

}