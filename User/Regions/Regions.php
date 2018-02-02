<?php
/**
 * Description of Collection
 *
 * @author Derek
 */
class Regions extends \Bricker\RequestLifeCircle {
    private $level;
    private $parentId;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'regions' => []
    ];
    
    protected function prepareRequestParams() {
        $this->level    = isset($_POST['level']) ? trim($_POST['level']) : '-1';
        $this->parentId = isset($_POST['parentid']) ? trim($_POST['parentid']) : '-1';
        
        $this->level = intval($this->level);
        if ($this->level < 0 || $this->level > 3) {
            return false;
        }
        
        $this->parentId = intval($this->parentId);
        if ($this->parentId < 0) {
            return false;
        }
        
        return true;
    }
    
    protected function process() {
        $regions = db_get_regions($this->level, $this->parentId);
        
        if ($regions) {
            $this->return['regions'] = $regions;
            $this->return['result'] = true;
        } else {
            $this->return['result'] = true;
            //$this->return['msg'] = $GLOBALS['db']->error();
        }
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['regions']);
        } else {
            $this->jsonResponse('fail', $this->return['msg']);
        }
    }
    
    protected function responseWeb() {
        exit('Not support !!');
    }
    
    protected function responseMobile() {
        exit('Not support !!');
    }
}
