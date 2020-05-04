<?php
class ProductCtrl extends BaseCtrl{
    function index(){
        if(_g("getlist")){
            $this->getList();
        }


        $statusSelectOptionHtml = ProductModel::getStatusSelectOptionHtml();
        $this->assign("statusSelectOptionHtml",$statusSelectOptionHtml);
        $this->assign("categoryOptions", ProductCategoryModel::getSelectOptionHtml());
        $this->display("/product/product_list.html");
    }

    function detail(){
        $id = _g("id");
        if(!$id){
            $this->notice("id is null");
        }

        $product = ProductModel::db()->getById($id);
        $product['dt'] = get_default_date($product['a_time']);

        $category = ProductCategoryModel::db()->getById($product['category_id']);
        $product['category_name'] = $category['name'];

        $admin = AdminUserModel::db()->getById($product['admin_id']);
        $product['admin_name'] = $admin['uname'];

        $product['status_desc'] = ProductModel::STATUS[$product['status']];

        $product['pic_url'] = get_product_url($product['pic']);

        $goodsList = GoodsModel::getListByPid($id);
        $product['goods_num'] = 0;
        if($goodsList){
            $product['goods_num'] = count($goodsList);
        }

        $attributeArr = ProductModel::attrParaParserToName($product['attribute']);


        $this->assign("attributeArr",$attributeArr);
        $this->assign("goodsList",$goodsList);
        $this->assign("product",$product);

        $this->display("/product/product_detail.html");
    }

    function add(){
        if(_g('opt')){

            if(ProductModel::db()->getOneByOneField("title",_g('title'))){
                $this->notice("标题重复:"._g('title'));
            }

            $data['title']= _g("title");
            $data['desc'] = _g("desc");
            $data['brand'] = _g("brand");
            $data['notice']  = _g("notice");
            $data['category_id'] = _g("category_id");
            $data['status'] = _g("status");
            $data['a_time'] = time();
            $data['admin_id']  = $this->_adminid;
            $data['pv'] =0;
            $data['uv'] =0;
            $data['lowest_price'] = 0;
            $data['factory_uid'] = _g("factory_uid");

            $categoryAttrPara  = _g("categoryAttrPara");
            if(!$categoryAttrPara){
                $this->notice("categoryAttrPara is null ");
            }

            $attribute = [];
            foreach ($categoryAttrPara as $k=>$v) {
                $tmp = explode("_",$v );
                $attribute[$tmp[1]][] = $tmp[2];
            }

            $data['attribute'] = json_encode($attribute);


            $uploadService = new UploadService();
            $uploadRs = $uploadService->product('pic');
            if($uploadRs['code'] != 200){
                exit(" uploadService->product error ".json_encode($uploadRs));
            }

            $data['pic'] = $uploadRs['msg'];

            $addId = ProductModel::db()->add($data);

            foreach ( $categoryAttrPara as $k=>$v) {
                $exp = explode("_",$v);
                $categoryAttr = $exp[1];
                $categoryAttrPara = $exp[2];
                $addData = array(
                    'pid'=>$addId,
                    'pc_id'=>$data['category_id'],
                    'pca_id'=>$categoryAttr,
                    'pcap_id'=>$categoryAttrPara,
                );

                ProductLinkCategoryAttrModel::db()->add($addData);
            }

            exit("成功");
        }
        $statusSelectOptionHtml = ProductModel::getStatusSelectOptionHtml();
        $this->assign("statusSelectOptionHtml",$statusSelectOptionHtml);
        $this->assign("categoryOptions", ProductCategoryModel::getSelectOptionHtml());

        $this->addJs('/assets/global/plugins/jquery-validation/js/jquery.validate.min.js');
        $this->addJs('/assets/global/plugins/jquery-validation/js/additional-methods.min.js');

        $this->addHookJS("product/product_add_hook.html");
        $this->display("/product/product_add.html");
    }

    function getProductCategoryRelation(){
        if(!arrKeyIssetAndExist($this->_request,'categoryId')){
            echo false;
            exit;
        }
        $list = CategoryModel::getProductRelationByCid($this->_request['categoryId']);

        echo json_encode($list);
        exit;
    }

    function getList(){
        $this->getData();
    }

    function getWhere(){
        $where = " 1 ";
        if($mobile = _g("mobile"))
            $where .= " and mobile = '$mobile'";

        if($message = _g("message"))
            $where .= " and mobile like '%$message%'";

        if($from = _g("from")){
            $from .= ":00";
            $where .= " and add_time >= '".strtotime($from)."'";
        }

        if($to = _g("to")){
            $to .= ":59";
            $where .= " and add_time <= '".strtotime($to)."'";
        }


        return $where;
    }


    function getData(){
        $records = array();
        $records["data"] = array();
        $sEcho = intval($_REQUEST['draw']);

        $where = $this->getDataListTableWhere();

        $cnt = ProductModel::db()->getCount($where);

        $iTotalRecords = $cnt;//DB中总记录数
        if ($iTotalRecords){
            $order_sort = _g("order");

            $order_column = $order_sort[0]['column'] ?: 0;
            $order_dir = $order_sort[0]['dir'] ?: "desc";


            $sort = array(
                'id',
                'id',
                '',
                '',
                '',
                '',
                'add_time',
            );
            $order = " order by ". $sort[$order_column]." ".$order_dir;

            $iDisplayLength = intval($_REQUEST['length']);//每页多少条记录
            if(999999 == $iDisplayLength){
                $iDisplayLength = $iTotalRecords;
            }else{
                $iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
            }

            $iDisplayStart = intval($_REQUEST['start']);//limit 起始


            $end = $iDisplayStart + $iDisplayLength;
            $end = $end > $iTotalRecords ? $iTotalRecords : $end;

            $data = ProductModel::db()->getAll($where . $order);

            foreach($data as $k=>$v){
                $statusBnt = "上架";
                if($v['status'] == ProductModel::STATUS_ON){
                    $statusBnt = "下架";
                }


                $attributeArr = ProductModel::attrParaParserToName($v['attribute']);
                $row = array(
                    '<input type="checkbox" name="id[]" value="'.$v['id'].'">',
                    $v['id'],
                    $v['title'],
//                    $v['subtitle'],
                    $v['desc'],
                    $v['brand'],
                    json_encode($attributeArr,JSON_UNESCAPED_UNICODE),
                    '<img height="30" width="30" src="'.get_product_url($v['pic']).'" />',
                    ProductCategoryModel::getNameById($v['category_id']),
//                    $v['status'],
                    ProductModel::getStatusDescById( $v['status']),
                    $v['lables'],
//                    $v['is_search'],
                    $v['admin_id'],
                    $v['pv'],
                    $v['uv'],
                    $v['recommend'],
                    get_default_date($v['a_time']),
                    '<a href="/product/no/product/detail/id='.$v['id'].'" class="btn blue btn-xs margin-bottom-5" data-id="'.$v['id'].'"><i class="fa fa-file-o"></i> 详情 </a>'.
                    '<button class="btn btn-xs default red btn blue btn-xs margin-bottom-5" data-id="'.$v['id'].'"><i class="fa fa-link"></i>'.$statusBnt.'</button>'.
                    '<a href="/product/no/goods/add/pid='.$v['id'].'" class="btn purple btn-xs btn blue btn-xs margin-bottom-5"><i class="fa fa-plus"></i>   </i> 添加商品 </a>'.
                    '<a href="" class="btn yellow btn-xs margin-bottom-5" data-id="'.$v['id'].'"><i class="fa fa-edit"></i> 编辑 </a>',

                );

                $records["data"][] = $row;
            }
        }

        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        echo json_encode($records);
        exit;
    }

    function getDataListTableWhere(){
        $where = 1;
        $openid = _g("openid");
        $sex = _g("sex");
        $status = _g("status");

        $nickname = _g('name');
//        $nickname_byoid = _g('nickname_byoid');
//        $content = _g('content');
//        $is_online = _g('is_online');
//        $uname = _g('uname');

        $from = _g("from");
        $to = _g("to");

//        $trigger_time_from = _g("trigger_time_from");
//        $trigger_time_to = _g("trigger_time_to");


//        $uptime_from = _g("uptime_from");
//        $uptime_to = _g("uptime_to");


        $id = _g("id");
        if($id)
            $where .=" and id = '$id' ";

        if($openid)
            $where .=" and openid = '$openid' ";

        if($sex)
            $where .=" and sex = '$sex' ";

        if($status)
            $where .=" and status = '$status' ";

        if($nickname)
            $where .=" and nickname = '$nickname' ";

//        if($nickname_byoid){
//            $user = wxUserModel::db()->getRow(" nickname='$nickname_byoid'");
//            if(!$user){
//                $where .= " and 0 ";
//            }else{
//                $where .=  " and openid = '{$user['openid']}' ";
//            }
//        }

//        if($content)
//            $where .= " and content like '%$content%'";

        if($from)
            $where .=" and a_time >=  ".strtotime($from);

        if($to)
            $where .=" and a_time <= ".strtotime($to);

//        if($trigger_time_from)
//            $where .=" and trigger_time_from >=  ".strtotime($trigger_time_from);
//
//        if($trigger_time_to)
//            $where .=" and trigger_time_to <= ".strtotime($trigger_time_to);
//
//        if($uptime_from)
//            $where .=" and up_time >=  ".strtotime($uptime_from);
//
//        if($uptime_to)
//            $where .=" and up_time <= ".strtotime($uptime_to);



//        if($is_online)
//            $where .=" and is_online = '$is_online' ";


//        if($uname)
//            $where .=" and uname = '$uname' ";

        return $where;
    }


}