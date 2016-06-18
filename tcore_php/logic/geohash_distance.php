<?php

class geohash_distance extends auth {
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }

public function Geo(){
    require_once('geohash.class.php');
    //$mysql = new Db_Mysql($conf);
    $geohash = new Geohash;
    //得到这点的hash值
    $lat=$_GET['lat'];
    $long=$_GET['long'];
    $page=$_GET['page'];//分页的页数
    $control_current=$_GET['control_current'];
    $control_neighbors=$_GET['control_neighbors'];
    $hash = $geohash->encode($lat, $long);
    //取前缀，前缀约长范围越小
    //$digit=12;
    $prefix = substr($hash, 0, $control_neighbors);
    //取出相邻八个区域
    $neighbors = $geohash->neighbors($prefix);
    array_push($neighbors, $prefix);
    //dump($neighbors);
    $user=substr($hash,0,$control_current);

     $sql = 'select * from shop_inf where geohash like "'.$user.'%"
     or  geohash like "'.$neighbors['top'].'%"
     or  geohash like "'.$neighbors['bottom'].'%"
     or  geohash like "'.$neighbors['right'].'%"
     or  geohash like "'.$neighbors['left'].'%"
     or  geohash like "'.$neighbors['topleft'].'%"
     or  geohash like "'.$neighbors['topright'].'%"
     or  geohash like "'.$neighbors['bottomright'].'%"
     or  geohash like "'.$neighbors['bottomleft'].'%"
     ';

     $data=$this->querydb($sql);

    // dump($data);
     foreach ($data[0] as $key => $val){
         # code...
         $distance=$this->getDistance($lat,$long,$val->latitude,$val->longitude);

         $data[0][$key]->distance=$distance;
         
         //排序列
         $sortdistance[$key]=$distance;//构造一个排序数组
     }
     //距离排序
     //array_multisort($sortdistance,SORT_ASC,$data);
     //结束
     $e_time=microtime(true);
    $times=0;
    //对数组进行重组，把二维数组变成一维
    while($data[0][$times]!=NULL){
    $data_geo[$times]=$data[0][$times];
    $times=$times+1;
}

    array_multisort($sortdistance,SORT_ASC,$data_geo);//用sort排序，用的排序数组是自己自定义的
    $page_times=0;//分页的时候插入的数组的次数
    while($data_geo[($page*6)]!=NULL&&$page_times!=6){
        $shop[$page_times]=$data_geo[($page*6+$page_times)];
        $page_times++;
    }
     if($shop==NULL){
         $this->json_return(erron::ERROR_NOTHING_ERROR, err_des::ERROR_NOTHING_ERROR, $shop);
     }
     if($data==0){
          $this->json_return(erron::ERROR_UNKNOWN, err_des::ERROR_UNKNOWN, $shop);
     }
     if($data[0]!=NULL){
     $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $shop);
     }
     else{
         $this->json_return(erron::ERROR_U_NEED_LOGIN, "None", null);
     }
   }
    public function getDistance($lat1,$lng1,$lat2,$lng2){
        //地球半径
        $R=6378137;
        //将角度转换为弧度
        $radLat1=deg2rad($lat1);
        $radLat2=deg2rad($lat2);
        $radLng1=deg2rad($lng1);
        $radLng2=deg2rad($lng2);
        //结果
        $s = acos(cos($radLat1)*cos($radLat2)*cos($radLng1-$radLng2)+sin($radLat1)*sin($radLat2))*$R;
        //精度
        $s=round($s*10000)/10000;
        return round($s);
    }
}
