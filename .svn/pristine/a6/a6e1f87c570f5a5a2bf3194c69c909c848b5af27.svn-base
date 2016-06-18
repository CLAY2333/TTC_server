<?php
    class shop extends auth {
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }


   public function new_shop(){
       $accountid=$_POST('accountid');
       $token=$_POST('token');
       $this->checkauth($accountid, $token);
       if($this->getcache($accountid.'shop'==1)){
           $this->json_return(erron::ERROR_NEWSHOP_ERROR,err_des::ERROR_NEWSHOP_ERROR,NULL);
       }
       require_once('geohash.class.php');
       $accountid=$_POST['accountid'];
       $longitude = $_POST['longitude'];
       $latitude = $_POST['latitude'];
       $Geo = new Geohash;
       //得到这点的hash值
       $geohash = $Geo->encode($latitude, $longitude);
       $shop_name = $_POST['shop_name'];
       $shop_type = $_POST['shop_type'];
       $manage_range = $_POST['manage_range'];
       $host_name = $_POST['host_name'];
       $phone_number = $_POST['phone_number'];
       if(preg_match("/^[0-9]{10}$/",$phone_number) == false){
          $this->json_return(erron::ERROR_PHONENUMBER_ERROR,err_des::ERROR_PHONENUMBER_ERROR,$value);
       }

       $delivery_type = $_POST['delivery_type'];
       $account = $_POST['account'];
       $rate = $_POST['rate'];
       $shop_start_fee=$_POST['shop_start_fee'];
    $outdoor =save_file($_FILES["outdoor"]['tmp_name'], "/static/mobile/res/shop", ".png");
    //dump($_FILES);
    $indoor =save_file($_FILES["indoor"]['tmp_name'], "/static/mobile/res/shop", ".png");
    $business_licence =save_file($_FILES["business_licence"]['tmp_name'], "/static/mobile/res/shop", ".png");
    $server_licence =save_file($_FILES["server_licence"]['tmp_name'], "/static/mobile/res/shop", ".png");
    $other_licence =save_file($_FILES["other_licence"]['tmp_name'], "/static/mobile/res/shop", ".png");
     $pic=array(
            'outdoor'=> $outdoor,
            'indoor'=>$indoor,
            'business_licence'=>$business_licence,
            'server_licence'=>$server_licence,
            'other_licence'=>$other_licence
        );
        $Pic_server=json_encode($pic);
        if($this->setcachenx($accountid.'shop',1)==false){
              $this->json_return(erron::ERROR_NEWSHOP_ERROR,err_des::ERROR_NEWSHOP_ERROR,NULL);
        }
       $res = $this->call("Prgs_shop_inf","'{$accountid}','{$longitude}','{$latitude}','{$geohash}','{$shop_name}','{$shop_type}','{$manage_range}','{$host_name}','{$phone_number}','{$delivery_type}','{$account}','{$Pic_server}','1'","set names utf8");
       if(false == $res[0][0]){
           $this->delcache($accountid.'shop');
           $this->json_return(erron::ERROR_DBSERVER_ERROR,err_des::ERROR_DBSERVER_ERROR,$res[0][0]);
       }

       if($res[0][0]->res == 0){
           $this->json_return(erron::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$res[0][0]);
       }

       if($res[0][0]->res == 1){
           $this->delcache($accountid.'shop');
           $this->json_return(err::ERROR_EXIST_ERROR,err_des::ERROR_EXIST_ERROR,$res[0][0]);
       }
   }


   public function manage_goods(){
       $accountid=$_POST('accountid');
       $token=$_POST('token');
       $this->checkauth($accountid, $token);
       $type = $_POST['type'];
       $goods_pic = save_file($_FILES["goods_pic"]['tmp_name'], "/static/mobile/res/goods",".png");
       if($goods_pic == null){
           $this->json_return("1","save file error",null);
      }
       $goods_name = $_POST['goods_name'];
       $goods_number = $_POST['goods_number'];
      // $speci_name1 = $_POST['speci_name1'];
      // $goods_price1 = $_POST['goods_price1'];
      // $speci_name2 = $_POST['speci_name2'];
      // $goods_price2 = $_POST['goods_price2'];
      // $goods_content = $_POST['goods_content'];
       $goods_note = $_POST['goods_note'];
       $goods_state = $_POST['goods_state'];
       $accountid=$_POST['accountid'];
       $res = $this->call("Prgs_goods_manage","'{$accountid}','{$type}','{$goods_pic}','{$goods_name}','{$goods_number}','{$goods_note}','{$goods_state}'");
       if(false == $res[0][0]){
            $this->json_return(erron::ERROR_DBSERVER_ERROR,err_des::ERROR_DBSERVER_ERROR,$res[0][0]);
       }

       if($res[0][0]->res == -1){
           $this->json_return("-1","The name of goods is exiting",$res[0][0]);
       }

       if($res[0][0]->res == 0){
           $this->json_return(erron::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$res[0][0]);
       }

   }


   //今日的新的订单数量
    public function shop_new_order(){
        $userid = $_POST['userid'];
    //    $order_money = $_POST['order_money'];
    //    $checked = $_POST['checked'];
        $res = $this->call("Prgs_new_order_numbers","'{$userid}'");
       //var_dump($res);
       if($res[0][0]->res == 0){
           $new_order_number = $res[0][0]->num;
           $this->json_return("0","The number of order is",$new_order_number);
       }else{
           $this->json_return(err::ERROR_EXIST_ERROR,err_des::ERROR_EXIST_ERROR,NULL);
       }
   }


   //今日完成的订单数量和流水收入
   public function shop_tmp_order(){
        $userid = $_POST['userid'];
        // $_date = date("Y-m-d",time());
        //    echo $_date;
        $res = $this->call("Prgs_today_money_number","'{$userid}'");
        if($res[0][0]->res == 0){
            $tmp_order_number = $res[0][0]->num;
            $tmp_order_money = $res[0][0]->money;
            $this->json_return($tmp_order_number,$tmp_order_money,null);
        }
        else{
           $this->json_return(err::ERROR_EXIST_ERROR,err_des::ERROR_EXIST_ERROR,NULL);
       }
   }


   //昨日完成的订单数量和收入
   public function shop_yesterday_order(){
       $userid = $_POST['userid'];
    //    $ydate = date('Y-m-d',time());
    //        echo $_date;
       $res = $this->call("Prgs_yesterday_money_number","'{$userid}'");

       if($res[0][0]->res == 0){
           $yesterday_order_number = $res[0][0]->num;
           $yesterday_order_money = $res[0][0]->money;
           $this->json_return( $yesterday_order_number,$yesterday_order_money,null);
       }else{
           $this->json_return("-1","The ID not exits",null);
       }
   }

    public function shop_promotion_inf(){
        $accountid=$_GET('accountid');
       $token=$_GET('token');
       $this->checkauth($accountid, $token);
        $shop_discount=$_GET['shop_discount'];
        $shop_get=$_GET['shop_get'];
        $shop_discount_fee=$_GET['shop_discount_fee'];
        $shop_discount_threshold=$_GET['shop_discount_threshold'];
        $shop_id=$_GET['shop_id'];
        $res=$this->call("Prgs_shop_promotion_inf","'{$shop_discount}','{$shop_get}','{$shop_discount_fee}','{$shop_discount_threshold}','{$shop_id}'");
        if(false==$res[0]){
           $this->json_return($res[0],"system error",$res[1][0][0]);
        }
        if($res[0][0]->res==-1){
            $this->json_return($res[0][0],"data not exchange",$res[1][0][0]);
        }
        if($res[0][0]->res==0){
           $this->json_return($res[0][0],"update succeess",$res[1][0][0]);
        }
    }

    public function goods_show(){
        $accountid=$_GET('accountid');
       $token=$_GET('token');
       $this->checkauth($accountid, $token);
        $accountid=$_GET['accountid'];
        $result = $this->querydb('SELECT * FROM goods_manage WHERE shop_id = "'.$accountid.'"');
        $count = 0;
        if($result[0]!=null){
            while($result[0][$count]!=null){
            $row[$count] = $result[0][$count];
            $count++;
            }
        $this->json_return(erron::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$row);
        }else{
        $this->json_return(-9999,"None",null);
        }
}
}
    //    $new_order = $_POST[''];
    //    $today_order = $_POST['completed_order'];
    //    $yesterday_order = $_POST['yesterday_order'];
    //    $today_income = $_POST['today_income'];
    //    $yesterday_income = $_POST['yesterday_income'];
    //    $username = $_POST['username'];
    //    $password = $_POST['password'];
    //    $userid = $_POST['userid'];
    //    $order_money = $_POST['order_money'];
    //    $_date = localtime();
    //    $checked = $_POST['checked'];
    //    //存数据
    //    $res = $this->call("Prgs_goods_orders","'{$userid}','{$order_money}','{$_date}','{$checked}'");
    //    if(false == $res[0][0]){
    //        $this->json_return("-1","system error",null);
    //    }
    //    if($res[0][0]->res == 0){
    //        $this->json_return(erron::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$value);
    //    }

    //    $curdate = $_POST['curdate'];
    //    $ydate = $_POST['ydate'];
    //    $result = $this->call("Prgs_","{$curdate}")
       //if($res[0][0]->res == 0){
//            $con = mysqli_connect("localhost","root","");
//            //新的订单数量
//            if($con){
//                $new_sql = "select * from goods_orders where goods_orders.userid = $userid and goods_orders.checked = 1";
//                $num_result = mysql_query($new_sql,$con);
//                //$new_order_number = mysql_fetch_field($num_result);
//                while( $new_order_number = mysql_fetch_field($num_result)){
//                    echo $new_order_number."<br />";
//                }
//                //echo $new_order_number;
//                mysql_close($conn);
//            }else die('cannot connect mysql:'.mysql.error());

//            $conn = mysql_connect("localhost","root","");
//            //今日已完成的订单数量以及流水收入
//            if($conn){
//             //   $time = $res[0][0]->date;
//             //   date('Y m d H i s',$time);
//             //   convert(varchar(10),getdate(),110);
//               $T_sql = "select * from goods_orders where goods_orders.userid = $userid and goods_orders._date = CURDATE() and goods.orders.checked = 0";
//               $Torders_result = mysql_query($sql,$conn);
//               $Tcompleted_order_number = mysql_fetch_row($num_result);
//               $Tsql_income =
//               $Ttmp_income = "select * from goods_orders where goods_orders.userid = $userid and good.orders.$res[0][0]->orderid";
//               print_r($Tcompleted_order_number);
//               echo $Ttmp_income;
//               mysql_close($conn);
//        }else die('cannot connect mysql:'.mysql.error());

//        $connn = mysql_connect("localhost","root","");
//        //昨日完成的订单数量和收入
//         if($conn){
//               $Y_sql = "select * from goods_orders where goods_orders.userid = $userid and goods_orders._date = DATE_SUB(CURDATE,INTERVAL 1 DAY) and goods.orders.checked = 0";
//               $Yorders_result = mysql_query($sql,$conn);
//               $Ycompleted_order_number = mysql_fetch_row($num_result);
//               $Ysql_income =
//               $Ytmp_income = "select * from goods_orders where goods_orders.userid = $userid and good.orders.$res[0][0]->orderid";
//               print_r($Ycompleted_order_number);
//               echo $Ytmp_income;
//               mysql_close($connn);
//        }else die('cannot connect mysql:'.mysql.error());
//    }
           //今日的新订单数量
