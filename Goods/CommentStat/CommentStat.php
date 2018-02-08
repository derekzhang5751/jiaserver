<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-06
 * Time: 09:02 PM
 */

class CommentStat extends \Bricker\RequestLifeCircle
{
    private $goodsId;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'stat' => []
    ];
    
    protected function prepareRequestParams() {
        $goodsId = isset($_POST['goodsid']) ? trim($_POST['goodsid']) : '0';
        $this->goodsId = intval($goodsId);
        if ($this->goodsId <= 0) {
            return false;
        }
        return true;
    }
    
    protected function process() {
        $rankList = db_comment_rank_list($this->goodsId);

        if ($rankList) {
            $i = 0;
            foreach ($rankList as $rank) {
                $this->return['stat'][$i]['rank'] = $rank['comment_rank'];
                $count = db_count_comment_rank($this->goodsId, $rank['comment_rank']);
                $this->return['stat'][$i]['size'] = $count;
                
                $i++;
            }
        }
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['stat']);
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