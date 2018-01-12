<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 12:13 PM
 */
function db_insert_session($params)
{
    return $GLOBALS['db']->insert('sessions', $params);
}

function db_get_session($session_id)
{
    $session = $GLOBALS['db']->get('sessions',
        ['userid', 'adminid', 'user_name', 'user_rank', 'discount', 'email', 'data', 'expiry'],
        ['sesskey' => $session_id]);
    return $session;
}

function db_get_session_data($session_id)
{
    $session_data = $GLOBALS['db']->get('sessions_data',
        ['data', 'expiry'],
        ['sesskey' => $session_id]);
    return $session_data;
}

function db_update_sessioin($session_id, $params)
{
    return $GLOBALS['db']->update('sessions', $params, ['sesskey' => $session_id]);
}
