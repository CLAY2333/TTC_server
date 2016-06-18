<?php
	class test extends action {
		public function login() {
			$nid = $_POST['nid'];
			$password = $_POST['password'];
			//Prgs_chat_account_login
			$res = $this->call("Prgs_chat_account_login", "'{$nid}', '{$password}'");
			if($res[0][0]->res != 0) {
				$this->json_return(-1, err_des::ERROR_REGISTER_ERROR, $res[0][0]); 
			}
			$this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0][0]);  
		}
		
		public function register() {
			//icon,username,sex,age,phone,info,nid
			$icon = $_POST['icon'];
			$username = $_POST['username'];
			$sex = $_POST['sex'];
			$age = $_POST['age'];
			$phone = $_POST['phone'];
			$info = $_POST['info'];
			$nid = $_POST['nid'];
			$passwd = $_POST['passwd'];
			$res = $this->call("Prgs_chat_account_register", "'{$icon}', '{$username}', '{$sex}', '{$age}', '{$phone}', '{$info}', '{$nid}','{$passwd}'");
			if($res[0][0]->res != 0) {
				$this->json_return(erron::ERROR_REGISTER_ERROR, err_des::ERROR_REGISTER_ERROR, $res[0][0]); 
			}
			$this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0][0]);  
		}
	}
	//localhost/test/login

?>