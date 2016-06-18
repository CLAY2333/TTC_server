<?php
    class receipt_address extends auth {
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }
        //增加新的收货地址
		public function add_receipt_address() {
            $accountid = $_GET['accountid'];
           // echo $accountid;
            $token = $_GET['token'];
           // echo $token;
           // dump($this->getcache($accountid));
          // $this->checkauth($accountid,$token);
           if($this->setcachenx($accountid.'flag',0)==false){
                $this->delcache($accountid.'flag');
              $this->json_return(erron::ERROR_REDIS_ERROR,err_des::ERROR_REDIS_ERROR,NULL);//不能一个id同时操控两个事件
            }
            if($this->getcache($accountid.'address')==5){
                $this->delcache($accountid.'flag');
                $this->json_return(erron::ERROR_MUCHADDRESS_ERROR,err_des::ERROR_MUCHADDRESS_ERROR,NULL);//收货地址超过5个
            }
            $contact_name = $_GET['contact_name'];
            $sex = $_GET['sex'];
            $receipt_address = $_GET['receipt_address'];
          //  $door_number = $_GET["door_number"];
            $phone_number = $_GET['phone_number'];
            $address_default=$_GET['default'];
            if(preg_match("/^[0-9]{10}$/",$phone_number) == false){
               $this->delcache($accountid.'flag'); 
               $this->json_return(erron::ERROR_PHONENUMBER_ERROR,err_des::ERROR_PHONENUMBER_ERROR,$phone_number);
            }
            $num=$this->getcache($accountid.'address');
           
            $res = $this->call("Prgs_add_receipt_address","'{$contact_name}','{$sex}','{$address_default}','{$receipt_address}','{$phone_number}','{$accountid}'");
            if($res[0][0]->res == 0){
                if($this->getcache($accountid.'address')==NULL){//为空就新建一个为1
                  $this->setcachenx($accountid.'address',1);
                }
                else{
                  $this->setcache($accountid.'address',$this->getcache($accountid.'address')+1);
                }
                $this->delcache($accountid.'flag');//删�个flag
                $this->json_return(erron::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$res[0][0]);
            }
            if($res[0][0]->res == -1){
                $this->delcache($accountid.'flag');
            
                $this->json_return(erron::ERROR_DBSERVER_ERROR,err_des::ERROR_DBSERVER_ERROR,$res[0][0]);
            }
        }
        // public function update_receipt_address(){
        //     $id = $_POST["id"];
        //     $contact_name = $_POST["contact_name"];
        //     $sex = $_POST["sex"];
        //     $receipt_address = $_POST["receipt_address"];
        //     $door_number = $_POST["door_number"];
        //     $phone_number = $_POST["phone_number"];
        //     $accountid = $_POST["accountid"];
        //     $token = $_POST["token"];
        //     $this->checkauth($accountid,$token);
        //     $res = $this->call("Prgs_update_receipt_address","'{$id}','{$contact_name}','{$sex}','{$receipt_address}','{door_number}','{phone_number}'");
        //     if($res[0][0]->res == 0){
        //          $this->json_return(666,"success!",NULL);
        //     }
        //     if($res[0][0]->res == -1){
        //          $this->json_return(555,"error!",NULL);
        //     }
        // }
        public function delete_receipt_address(){
            $accountid = $_POST["accountid"];
            $token = $_POST["token"];
            $this->checkauth($accountid,$token);
            if($this->setcachenx($accountid.'flag',0)==false){
              $this->json_return(erron::ERROR_REDIS_ERROR,err_des::ERROR_REDIS_ERROR,$value);//不能一个id同时操控两个事件
            }
            $id = $_POST["id"];
            $res = $this->call("Prgs_delete_receipt_address","'{$id}'");
            if($res[0][0]->res == 0){
                $this->setcache($accountid.'address',$this->getcache($accountid.'address')-1);
                $this->delcache($accountid.'flag');
                 $this->json_return(err::ERROR_NO_ERROR,err_des::ERROR_NO_ERROR,$res[0][0]);
            }
            if($res[0][0]->res == -1){
                 $this->json_return(err::ERROR_NOTEXIST_ERROR,err_des::ERROR_NOTEXIST_ERROR,$res[0][0]);
            }
        }
    }
