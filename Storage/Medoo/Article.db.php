<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-15
 * Time: 10:57 AM
 */

function db_get_article_list_by_cat($catId, $maxSize)
{
    $articleList = $GLOBALS['db']->select('article',
        ['article_id', 'title', 'author', 'add_time', 'file_url', 'open_type', 'cover_img'],
        [
            'cat_id' => $catId,
            'is_open' => 1,
            'ORDER' => ['article_type'=>'DESC', 'article_id'=>'DESC'],
            'LIMIT' => $maxSize
        ]
    );
    return $articleList;
}

function db_get_article_record($articleId)
{
    $article = $GLOBALS['db']->get('article',
        ['article_id', 'cat_id', 'title', 'content', 'author', 'article_type', 'add_time', 'open_type', 'cover_img'],
        [
            'article_id' => $articleId,
            'is_open' => 1
        ]
    );
    return $article;
}
