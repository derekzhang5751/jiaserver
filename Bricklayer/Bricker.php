<?php
/*!
 * Bricklayer PHP framework
 * Version 1.0.0
 *
 * Copyright 2017, Derek Zhang
 * Released under the MIT license
 */

namespace Bricker;

if (!defined('USE_BRICKER')) {
    die('Hacking attempt');
}

define('BRICKER_PATH', dirname(__FILE__));

require BRICKER_PATH . '/Config.php';
require BRICKER_PATH . '/Database/Database.php';
require BRICKER_PATH . '/Log/Log.php';

class Bricker {
    
    public $db = null;
    
    private $applog = null;
    
    public function __construct() {
        $this->db = getDatabase();
        $this->applog = getAppLog();
    }
    
    public function applog($strLogType, $strMsg) {
        global $gConfig;
        if ($gConfig['log']['logging'] === true) {
            $this->applog->log($strLogType, $strMsg);
        }
    }
    
}

$gBricker = new Bricker();
// The End
