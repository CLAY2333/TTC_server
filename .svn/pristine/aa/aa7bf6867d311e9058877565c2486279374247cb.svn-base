<?php
    class adv extends auth{
        public function getAdvInfo(){
            $res = $this->call("Prgs_adv_get_random");
			if ($res[0][0]->res != 0) {
				$this->json_return(erron::ERROR_NO_ADVIMG, err_des::ERROR_NO_ADVIMG, null);
			}
            $res[0][0]->pic = "http://" . config('CDN_DOMAIN') . $res[0][0]->pic;
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, $res[0][0]);
        }
        
        public function setAdvInfo() {
            $url = $_POST['url'];
            $file = $_FILES['adv'];
            
            if ($file['type'] != "image/png") {
                $this->json_return(erron::ERROR_FILE_TYPE_ERROR, err_des::ERROR_FILE_TYPE_ERROR, null);
            }
            
            if ($file['size'] > appdef::ADV_IMG_MAX_SIZE) {
                $this->json_return(erron::ERROR_FILE_SIZE_ERROR, err_des::ERROR_FILE_SIZE_ERROR, null);
            }
            
            $path = save_file($file['tmp_name'], "/static/mobile/adv", ".png");
            if (null == $path) {
                $this->json_return(erron::ERROR_SAVE_FILE_ERROR, err_des::ERROR_SAVE_FILE_ERROR, null);
            }
            
            $res = $this->call("Prgs_adv_set", "'{$path}', '{$url}'");
            $this->json_return(erron::ERROR_NO_ERROR, err_des::ERROR_NO_ERROR, null);
        }
    }
 