<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 10:07 PM
 */

class Find extends \Bricker\RequestLifeCircle
{
    private $articleCatId = 15;

    private $return = [
        'result' => false,
        'msg' => '',
        'articlelist' => []
    ];

    protected function prepareRequestParams() {
        return true;
    }

    protected function process() {
        $maxSize = 100;
        $articleList = db_get_article_list_by_cat($this->articleCatId, $maxSize);

        if ($articleList) {
            $this->return['result'] = true;
            $index = 0;
            foreach ($articleList as $article) {
                $this->return['articlelist'][$index]['article_id'] = $article['article_id'];
                $this->return['articlelist'][$index]['title'] = $article['title'];
                $this->return['articlelist'][$index]['author'] = $article['author'];
                $this->return['articlelist'][$index]['url'] = 'article.php?id=' . $article['article_id'];
                $this->return['articlelist'][$index]['add_time'] = $article['add_time'];
                $this->return['articlelist'][$index]['cover_img'] = $article['cover_img'];

                $index++;
            }
        } else {
            $this->return['result'] = false;
            $this->return['msg'] = $GLOBALS['LANG']['article_empty'];
        }

        return true;
    }

    protected function responseHybrid() {
        if ($this->return['result'] === true) {
            $this->jsonResponse('success', '', $this->return['articlelist']);
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