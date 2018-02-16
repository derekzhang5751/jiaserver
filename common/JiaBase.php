<?php
/**
 * User: Derek
 * Date: 2018-02-15
 * Time: 11:09 PM
 */

class JiaBase extends \Bricker\RequestLifeCircle {
    protected $rateCAD2RMB = 1.0;


    public function __construct() {
        if ( $GLOBALS['LifeCfg']['NEED_EXCHANGE_RATE'] ) {
            $this->rateCAD2RMB = db_get_exchange_rate('CAD', 'RMB', 0);
        }
    }
    
    protected function prepareRequestParams() {
        return false;
    }
    
    protected function process() {
        return false;
    }
    
    protected function responseHybrid() {
        exit('Not support !!');
    }
    
    protected function responseWeb() {
        exit('Not support !!');
    }
    
    protected function responseMobile() {
        exit('Not support !!');
    }
    
    protected function adapterPrice($price) {
        $p = floatval($price);
        
        $rate = $this->rateCAD2RMB;
        if (!$rate) {
            $rate = 10.0;
        }
        
        $p = $p * $rate;
        $p = ceil($p);
        $p = number_format($p, 2, '.', '');
        return $p;
    }
}
