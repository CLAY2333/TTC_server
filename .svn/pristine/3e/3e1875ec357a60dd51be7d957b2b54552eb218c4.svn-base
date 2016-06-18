<?php 
    class Geohash{
        private $coding="0123456789BCDEFGHJKMNPQRSTUVWXYZ";
        private $codingMap=array();
        public function Geohash(){   
            //将0-32转化成二进制，并从左到右5个一组
            for($i=0; $i<32; $i++){
                $this->codingMap[substr($this->coding,$i,1)]=str_pad(decbin($i), 5, "0", STR_PAD_LEFT);  
        }
    }
    
    
    public function decode($hash){
        $binary="";
        $hl=strlen($hash);  //计算$hash的长度
        for($i=0; $i<$hl; $i++){
            $binary.=$this->codingMap[substr($hash,$i,1)];
        }
        $bl=strlen($binary);
        $blat="";
        $blong="";
        for ($i=0; $i<$bl; $i++){
        if ($i%2){
                $blat=$blat.substr($binary,$i,1);
            }
        else{
            $blong=$blong.substr($binary,$i,1);
        }
      }
        $lat=$this->binDecode($blat,-90,90);
        $long=$this->binDecode($blong,-180,180);
        $latErr=$this->calcError(strlen($blat),-90,90);
        $longErr=$this->calcError(strlen($blong),-180,180);
        $latPlaces=max(1, -round(log10($latErr))) - 1;
        $longPlaces=max(1, -round(log10($longErr))) - 1;
        $lat=round($lat, $latPlaces);
        $long=round($long, $longPlaces);
        return array($lat,$long);
    }
    
    
     private function binDecode($binary, $min, $max){
        $mid=($min+$max)/2;
        if (strlen($binary)==0)
            return $mid;
        $bit=substr($binary,0,1);
        $binary=substr($binary,1);
        if ($bit==1)
            return $this->binDecode($binary, $mid, $max);
        else
            return $this->binDecode($binary, $min, $mid);
    }
    
    
     private function calcError($bits,$min,$max){
        $err=($max-$min)/2;
        while ($bits--)
        $err/=2;
        return $err;
        }
    
    
     private function precision($number){
        $precision=0;
        $pt=strpos($number,'.'); //$pt是查找lonitude和latitude的小数点位置
        if ($pt!==false){
            $precision=-(strlen($number)-$pt-1);
        }
        return pow(10,$precision)/2;
    }
    
    
    public function encode($lat,$long){
        //err控制要取的经纬度位数，来最后的编码长度
        $plat=$this->precision($lat);
        $latbits=1;
        $err=45;
        while($err>$plat){
            $latbits++;
            $err/=2;
        }
        //echo '纬度的二进制数目'.$latbits;
        $plong=$this->precision($long);
        $longbits=1;
        $err=90;
        while($err>$plong){
            $longbits++;
            $err/=2;
        }
        //echo $longbits;
        
        //$bits是最终的位数，取两者的最大值
        $bits=max($latbits,$longbits);
        $longbits=$bits;
        $latbits=$bits;
        $addlong=1;
        
        //为了使两个二进制数组组码后是5位数一组
        while (($longbits+$latbits)%5 != 0){
            $longbits+=$addlong;
            $latbits+=!$addlong;
            $addlong=!$addlong;  //取反
        }
        //echo $longbits.$latbits;
        //$blat和$blong是经纬度的二进制数组
            $blat=$this->binEncode($lat,-90,90, $latbits);    //$latbits $longbits分别是纬度和经度的位数
            //echo '第一个$blat='.$blat;
            $blong=$this->binEncode($long,-180,180,$longbits);
            $uselong=1;
            $binary="";
            while (strlen($blat)+strlen($blong)){
            if ($uselong){
                $binary=$binary.substr($blong,0,1);
                //echo '$binary'.$binary;
                $blong=substr($blong,1);
        }
        
        else{
            $binary=$binary.substr($blat,0,1);
            //echo '$binary='.$binary;
            // echo "\n";
            $blat=substr($blat,1);
           // echo '$blat'.$blat;
            //echo "\n";
        }
        $uselong=!$uselong;
    }
        $hash="";
        for ($i=0; $i<strlen($binary); $i+=5){
            $n=bindec(substr($binary,$i,5));
            $hash=$hash.$this->coding[$n];
            //echo $hash."   ";
    }
        return $hash;
}


    //进行经纬度的二进制编码
    //$bitcount是位数
    private function binEncode($number, $min, $max, $bitcount){
        if ($bitcount == 0)
            return "";
        $mid=($min+$max)/2;
        if ($number>$mid)
            return "1".$this->binEncode($number, $mid, $max,$bitcount-1);
        else
            return "0".$this->binEncode($number, $min, $mid,$bitcount-1);
    }
        
}


    // class Geohash extends auth {
    //     public function __instance() {
    //         //dump($GLOBALS);
    //         $this->show();
    //     }
        
    //     public function Geohash(){
    //         $con=mysqli_connect('localhost','root','');
    //         if(!$con){
    //            echo "查询失败";
    //            mysql_close($con);
    //         }
    //        $sql = "SELECT * FROM coordinates WHERE coordinates.`longitude`<`current_longitude` + `distance` /(111.1 / COS(RADIANS(`current_latitude`))) AND coordinates.`latitude` < `current_latitude` +`distance` /(111.1/COS(RADIANS(`current_longitude`)))";
    //        $sqll = "SELECT * FROM coordinates WHERE coordinates.`longitude`<`current_longitude` - `distance` /(111.1 / COS(RADIANS(`current_latitude`))) AND coordinates.`latitude` < `current_latitude` -`distance` /(111.1/COS(RADIANS(`current_longitude`)))";
    //        $result = mysql_query($sql,$con);
    //        $re = mysql_query($sqll,$con);
    //        echo $result;
    //        echo (mysql_fetch_row($result));
    //        echo (mysql_fetch_row($re));
    //        mysql_close($con);
    //     }
    //}
    
       