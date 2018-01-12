<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-11
 * Time: 2:05 PM
 */

namespace Bricker;


abstract class RequestLifeCircle
{
    protected $db = null;
    protected $log = null;

    public function run() {
        if (isset($GLOBALS['db'])) {
            $this->db = $GLOBALS['db'];
        }

        if (isset($GLOBALS['log'])) {
            $this->log = $GLOBALS['log'];
        }

        if ($this->prepareRequestParams() === true) {
            if ($this->process() === true) {
                switch ($GLOBALS['DeviceType']) {
                    case DEVICE_HYBRID:
                        $this->responseHybrid();
                        break;
                    case DEVICE_MOBILE:
                        $this->responseMobile();
                        break;
                    default:
                        $this->responseWeb();
                        break;
                }
            } else {
                exit('Application Error !!');
            }
        } else {
            exit('Invalid Request !!');
        }
    }

    abstract protected function prepareRequestParams();
    abstract protected function process();
    abstract protected function responseWeb();
    abstract protected function responseHybrid();
    abstract protected function responseMobile();

    protected function jsonResponse($result = 'success', $msg='', $data=[]) {
        $data_arr = array(
            'result'     => $result,
            'msg'        => $msg,
            'SESSION_ID' => SESSION_ID,
            'data'       => $data);

        $json = json_encode($data_arr);
        exit($json);
    }

}
