<?php
/**
 * User: Derek
 * Date: 2018-02-06
 * Time: 9:23 PM
 */
function db_comment_rank_list($goodsId)
{
    $sql = 'select distinct(comment_rank) from ecs_comment where id_value='.$goodsId.' and status=1 order by comment_rank desc';
    
    return $GLOBALS['db']->query($sql);
}

function db_count_comment_rank($goodsId, $rank)
{
    $count = $GLOBALS['db']->count('comment',
        [
            'id_value' => $goodsId,
            'status' => 1,
            'comment_rank' => $rank
        ]
    );
    return $count;
}

function db_count_comment_total($goodsId)
{
    $count = $GLOBALS['db']->count('comment',
        [
            'id_value' => $goodsId,
            'status' => 1
        ]
    );
    return $count;
}

function db_get_comment_list($goodsId)
{
    return $GLOBALS['db']->select('comment',
        [
            'comment_id', 'comment_type', 'id_value', 'email', 'user_name',
            'content', 'comment_rank', 'add_time'
        ],
        [
            'id_value' => $goodsId,
            'status' => 1,
            'ORDER' => ['add_time' => 'DESC']
        ]
    );
}

function db_get_user_info($userId)
{
    $user = $GLOBALS['db']->get('users',
        ['user_id', 'email', 'user_name'],
        [
            'user_id' => $userId,
            'is_validated' => 1
        ]
    );
    return $user;
}

function db_insert_comment($comment)
{
    $data = [
        'comment_type' => 0,
        'id_value' => $comment['goodsId'],
        'email' => $comment['email'],
        'user_name' => $comment['userName'],
        'content' => $comment['content'],
        'comment_rank' => $comment['rank'],
        'add_time' => time(),
        'ip_address' => \Bricker\client_real_ip(),
        'status' => 1,
        'parent_id' => 0,
        'user_id' => $comment['userId']
    ];
    $stat = $GLOBALS['db']->insert('comment', $data);
    if ($stat->rowCount() == 1) {
        return $GLOBALS['db']->id();
    } else {
        return false;
    }
}
