<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-06
 * Time: 09:22 PM
 */

class CommentList extends \Bricker\RequestLifeCircle
{
    private $goodsId;
    
    private $return = [
        'result' => false,
        'msg' => '',
        'comments' => []
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
        $commentList = db_get_comment_list($this->goodsId);

        if ($commentList) {
            $i = 0;
            foreach ($commentList as $comment) {
                $this->return['comments'][$i]['comment_id'] = $comment['comment_id'];
                $this->return['comments'][$i]['comment_type'] = $comment['comment_type'];
                $this->return['comments'][$i]['id_value'] = $comment['id_value'];
                $this->return['comments'][$i]['email'] = $comment['email'];
                if (empty($comment['user_name'])) {
                    $this->return['comments'][$i]['user_name'] = '匿名用户';
                } else {
                    $this->return['comments'][$i]['user_name'] = $comment['user_name'];
                }
                $this->return['comments'][$i]['content'] = $comment['content'];
                $this->return['comments'][$i]['comment_rank'] = $comment['comment_rank'];
                $this->return['comments'][$i]['add_time'] = date('Y-m-d H:i:s', $comment['add_time']);
                
                $i++;
            }
        }
        
        $this->return['result'] = true;
        return true;
    }
    
    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['comments']);
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