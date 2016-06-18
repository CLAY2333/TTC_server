<?php
    class address extends auth{
        public function __instance() {
            //dump($GLOBALS);
            $this->show();
        }
        
        public function address() {
            $accountid=$_POST['accountid'];            
            $token = $_POST['token'];
            $this->checkauth($accountid,$token);
            $name = $_POST['name'];
            $number = $_POST['number'];
            if(strlen($number) != 11)
            $this->json_return("1","please input correct phone number",$value);
            $address = $_POST['address'];
            $postcode = $_POST['postcode'];
            if(strlen($postcode) != 6)
            $this->json_return("1","please input correct postcode",$value);
            $userid = $_POST['userid'];

            $res = $this->call("Prgs_add_address","'{$userid}','{$name}', '{$number}', '{$address}', '{$postcode}'");
            //if (1 == $res[0][0]->res){
                //$this->json_return($res[0], "system error", $res[0][0]);
           //}
             if ($res[0][0]->res == 1){
                 $this->json_return(erron::ERROR_ADDADDRESS_ERROR, err_des::ERROR_ADDADDRESS_ERROR,$value);
             }
           if ($res[0][0]->res == 0){
                //$value = $this->getcache(rediskey::ACCOUNT_INFO . $res[0][0]->userid);
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $value);
               // $this->json_return($res[0], "Add success", $res[0][0]);
            }
        }
    }
    
   
