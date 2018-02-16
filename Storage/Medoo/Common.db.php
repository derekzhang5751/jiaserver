<?php
/**
 * Created by PhpStorm.
 * User: Derek
 * Date: 2018-02-15
 * Time: 11:26 PM
 */

function db_get_exchange_rate($from, $to, $type=0)
{
    $rate = $GLOBALS['db']->get('exchange_rate', 'rate',
        [
            'cry_from' => $from,
            'cry_to' => $to,
            'type' => $type
        ]
    );
    return $rate;
}
