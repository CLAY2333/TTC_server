<?php
    class geotest extends Geohash {
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }
        
        public function test(){          
            $geohash=new Geohash;    //新定义的geohash对象
            $longitude = $_POST['longitude'];
            $latitude = $_POST['latitude'];
            $n = $_POST['n'];
            $n_geohash = $geohash->encode($latitude,$longitude);
            $like_geohash = substr($n_geohash, 0, $n);
           // echo '  n='.$n;
            echo $like_geohash;
            $data = $this->call("Prgs_geohash","{$like_geohash}");
            //var_dump($data);
            foreach((array)$data as $key => $val){
                //echo $val['latitude'];
                $distance = getDistance($latitude,$longitude,$val['latitude'],$val['longitude']);
                //echo $distance;
                $data[$key]['distance'] = $distance;
                //排序列
                $sortdistance[$key] = $distance;
            }
                //距离排序
                array_multisort($sortdistance,$data);
               // echo "heffesdf";
               // var_dump($sortdistance);
               // var_dump($data);
        }
        
            public function getDistance($lat1,$lng1,$lat2,$lng2){
                //地球半径
                $R = 6378137;
                //将角度转为狐度
                $radLat1 = deg2rad($lat1);
                $radLat2 = deg2rad($lat2);
                $radLng1 = deg2rad($lng1);
                $radLng2 = deg2rad($lng2);
                //结果
                $s = acos(cos($radLat1)*cos($radLat2)*cos($radLng1-$radLng2)+sin($radLat1)*sin($radLat2))*$R;
                //精度
                $s = round($s* 10000)/10000;
                return round($s);
            }
        
}
  //    $mysql_server_name="localhost"; //数据库服务器名称
        //    $mysql_username="root"; // 连接数据库用户名
        //    $mysql_password=""; // 连接数据库密码
        //    $mysql_database="te";
        //    $con =  mysqli_connect($mysql_server_name,$mysql_username,$mysql_password);
        //    var_dump($con);
        //    if($con){
        //          $geohash=new Geohash; 
        //          $longitude = $_GET['longitude'];
        //          $latitude = $_GET['latitude'];
        //          $n = $_GET['n'];
        //          $n_geohash = $geohash->encode($latitude,$longitude);
        //          $like_geohash = substr($n_geohash, 0, $n);
        //          echo '$n_geohash='.$n_geohash;
        //          $sql = 'select * from coordinates where geohash like "'.$like_geohash.'%"';
        //          echo $sql;
        //          $re = mysql_query($sql,$con);
        //          var_dump($re);
        //          $data = mysql_fetch_row($re);
        //          var_dump($data);   
        //          foreach((array)$data as $key=>$val){
        //             $distance = getDistance($latitude,$longitude,$val['latitude'],$val['longitude']);
        //             echo 'distande='.$distance;
        //             $data[$key]['distance'] = $distance;
        //             //排序列
        //             $sortdistance[$key] = $distance;
        //      }
        //             //距离排序
        //             array_multisort($sortdistance,SORT_ASC,$data);
        //             var_dump($data);   
        //      }
        //      else echo "connect fail";
        //     $geohash=new Geohash; 
        //     $longitude = $_GET['longitude'];
        //     $latitude = $_GET['latitude'];
        //     $n = $_GET['n'];
        //     $n_geohash = $geohash->encode($latitude,$longitude);
        //     $like_geohash = substr($n_geohash, 0, $n);
            
        //     $res = $this->call("Prgs_geohash","{$like_geohash}");
        //     if($res[0][0]->res == 0){
        //         foreach((array)$res as $key => $val){
        //         $distance = getDistance($latitude,$longitude,$val['latitude'],$val['longitude']);
        //         echo $distance;
        //         $res[$key]['distance'] = $distance;
        //        //排序列
        //         $sortdistance[$key] = $distance;
        //     }
        //     array_multisort($sortdistance,$res);
        //     echo "fdgdhfhfg";
        //     var_dump($res);
        //     var_dump($sortdistance);
        //  }
        //  else {
        //      echo "ERROR!";
        //  }