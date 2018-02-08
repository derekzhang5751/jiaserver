<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-07
 * Time: 09:18 PM
 */

class CommentPost extends \Bricker\RequestLifeCircle
{
    private $goodsId;
    private $goodsRank;
    private $goodsComment;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'data' => []
    ];
    
    protected function prepareRequestParams() {
        $goodsId = isset($_POST['goodsid']) ? trim($_POST['goodsid']) : '0';
        $goodsRank = isset($_POST['rank']) ? trim($_POST['rank']) : '0';
        $goodsComment = isset($_POST['comment']) ? trim($_POST['comment']) : '';
        
        $this->goodsId = intval($goodsId);
        if ($this->goodsId <= 0) {
            return false;
        }
        
        $this->goodsRank = intval($goodsRank);
        if ($this->goodsRank < 1 || $this->goodsRank > 5) {
            return false;
        }
        
        $this->goodsComment = $goodsComment;
        if (empty($this->goodsComment)) {
            return false;
        }
        
        return true;
    }
    
    protected function process() {
        $userId = isset($GLOBALS['_SESSION']['user_id']) ? $GLOBALS['_SESSION']['user_id'] : '0';
        $userName = isset($GLOBALS['_SESSION']['user_name']) ? $GLOBALS['_SESSION']['user_name'] : '';
        
        $userId = intval($userId);
        if ($userId <= 0 || empty($userName)) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['user_not_signin'];
            return true;
        }
        
        if (!db_exist_goods_id($this->goodsId)) {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['goods_not_exist'];
            return true;
        }
        
        $user = db_get_user_info($userId);
        if ($user) {
            $comment = array(
                'goodsId'  => $this->goodsId,
                'email'    => $user['email'],
                'userName' => $user['user_name'],
                'content'  => $this->goodsComment,
                'rank'     => $this->goodsRank,
                'userId'   => $userId,
            );
            $ret = db_insert_comment($comment);
            if ($ret == false) {
                $this->return['result'] = false;
                $this->return['msg'] = $GLOBALS['LANG']['comment_error'];
                return true;
            }
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['user_not_signin'];
            return true;
        }
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '');
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