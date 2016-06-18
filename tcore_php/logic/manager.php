<?php
    class manager extends action {
        public function __instance() {
            $this->show("login.html");
        }
        public function index(){
            $this->show("login.html");
        }
        
        public function login() {
            $username = $_POST["username"];
            $passwd = $_POST["password"];
            $res = $this->querydb("select * from manager where username='{$username}' and passwd='{$passwd}'");
            //dump($res);
            if($res[0]) {
                echo "<script>var username = '{$username}'</script>";
                $this->show("index.html");
            } else {
                $this->show("err.html");
            }
        }
        public function admininfo() {
            $username = $_POST["username"];
            $res = $this->querydb("select * from manager where username='{$username}'");
            if($res[0]) {
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res);
            }else{
                $this->json_return(erron::ERROR_UNKNOWN, err_des::ERROR_UNKNOWN, null);           
            }
        }
        
        public function queryallad() {
            $res = $this->querydb("select * from admanage");
            if($res[0]) {
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0]);    
            }else {
                $this->json_return(erron::ERROR_UNKNOWN, err_des::ERROR_UNKNOWN, null);      
            }
        }
        
        public function uploadad() {
           // dump($_FILES["icon"]);
			$pic = save_file($_FILES["icon"]['tmp_name'], "/static/mobile/adv",".png");
            $url = $_POST['url'];
           // dump($pic);
            $res = $this->call("Prgs_insert_ad", "'{$url}', '{$pic}'");
			
			if (null == $res[0]) { 
				$this->json_return($res[0], "system error", $res[1][0][0]);
				return;
            } 
			if ($res[0][0]->res == 0) {
                $this->show("admanage.html");
				return;
            }
            if ($res[0][0]->res == -1) {
                $this->show("admanage.html");
				echo("<script>alert('Advertising amount shall not exceed 10, please delete after upload');</script>"); 
				return;
            }
        }
        
        public function delad() {
            $id = $_POST['id'];
            //echo "delete from ad where id={$id}";
            $res = $this->querydb("delete from admanage where id={$id}");
           $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res);
        }
        
        public function queryauditall(){
			$pagecount=$_POST['pagecount']; 
			$pagesize = 3;
			$count = $this->querydb("select count(*) as 'count' from shop_inf where checked > 0"); 
			$totalNumber = $count[0][0]->count;
			$totalpage=ceil($totalNumber/$pagesize); 
			if (!isset($pagecount)) {
				$pagecount=1;
			}
			$startCount=($pagecount-1) * $pagesize;
            $res = $this->querydb("select * from shop_inf where checked > 0 limit {$startCount},{$pagesize}");
			$res[1]->totalpage = $totalpage;
			$res[1]->pagecount = $pagecount;
			//dump($res);
            if($res != null) {
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res);
            }else{
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, null);         
            }
        }
        
        public function queryauditfailall(){
			$pagecount=$_POST['pagecount']; 
			$pagesize = 3;
			$count = $this->querydb("select count(*) as 'count' from shop_inf where checked < 0"); 
			$totalNumber = $count[0][0]->count;
			$totalpage=ceil($totalNumber/$pagesize); 
			if (!isset($pagecount)) {
				$pagecount=1;
			}
			$startCount=($pagecount-1) * $pagesize;
            $res = $this->querydb("select * from shop_inf where checked < 0 limit {$startCount},{$pagesize}");
			$res[1]->totalpage = $totalpage;
			$res[1]->pagecount = $pagecount;
            if($res != null) {
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res);
            }else{
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, null);         
            }
        }
        
        
        public function queryauditpassall(){
			$pagecount=$_POST['pagecount']; 
			$pagesize = 3;
			$count = $this->querydb("select count(*) as 'count' from shop_inf where checked = 0"); 
			$totalNumber = $count[0][0]->count;
			$totalpage=ceil($totalNumber/$pagesize); 
			if (!isset($pagecount)) {
				$pagecount=1;
			}
			$startCount=($pagecount-1) * $pagesize;
            $res = $this->querydb("select * from shop_inf where checked = 0 limit {$startCount},{$pagesize}");
			$res[1]->totalpage = $totalpage;
			$res[1]->pagecount = $pagecount;
            if($res != null) {
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res);
            }else{
                 $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, null);         
            }
        }
        
         public function auditbyid(){
             $id = $_GET["id"];
             echo "<script>var id={$id}</script>";
             $this->show("auditinfo.html");
         }
        
        public function queryauditbyid(){
            $id = $_POST["id"];
            $res = $this->querydb("select * from shop_inf where id={$id}");
            if($res[0]) {
                $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0][0]);
            }else{
                $this->json_return(erron::ERROR_UNKNOWN, err_des::ERROR_UNKNOWN, null);           
            }
        }
        
        public function passaudit(){
            $id = $_POST["id"];
            $res = $this->querydb("update shop_inf set checked=0 where shop_inf.id={$id}");
        }
        
        public function failaudit(){
            $id = $_POST["id"];
            $res = $this->querydb("update shop_inf set checked=-1*checked where shop_inf.id={$id}");
        }
        public function shopbyid(){
             $id = $_GET["id"];
             echo "<script>var id={$id}</script>";
             $this->show("shopinfo.html");
         }
    }
    
