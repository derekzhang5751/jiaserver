<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 10:07 PM
 */

class Detail extends \Bricker\RequestLifeCircle
{
    private $articleId;

    private $return = [
        'result' => false,
        'msg' => '',
        'article' => []
    ];

    protected function prepareRequestParams() {
        $articleId = isset($_POST['articleid']) ? trim($_POST['articleid']) : '0';
        $this->articleId = intval( $articleId );
        if ($this->articleId <= 0) {
            return false;
        }
        return true;
    }

    protected function process() {
        $article = db_get_article_record($this->articleId);

        if ($article) {
            $this->return['result'] = true;

            $this->return['article']['article_id']   = $article['article_id'];
            $this->return['article']['cat_id']       = $article['cat_id'];
            $this->return['article']['title']        = $article['title'];
            $this->return['article']['content']      = $article['content'];
            $this->return['article']['author']       = $article['author'];
            $this->return['article']['article_type'] = $article['article_type'];
            $this->return['article']['add_time']     = date('Y-m-d', $article['add_time']);
            $this->return['article']['open_type']    = $article['open_type'];
            $this->return['article']['cover_img']    = $article['cover_img'];
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['article_not_exist'];
        }

        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['article']);
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