<?php
class WxLittleLib{
    public $_appId = "";
    public $_appSecret = "";


    function getSession($code){
        $url = "https://api.weixin.qq.com/sns/jscode2session?js_code={$code}&grant_type=authorization_code";
        return $this->curl($url);
    }

    function curl($url)
    {
        $url .= "&appid={$this->_appId}&secret={$this->_appSecret}";
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 500);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, true);
        curl_setopt($curl, CURLOPT_URL, $url);
        $res = curl_exec($curl);
        curl_close($curl);
        return $res;
    }

}