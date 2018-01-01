<?php

/**
 *  返回结果集
 *
 *  @param   mixed      $data       返回的有效数据集或是错误说明
 *  @param   string     $result     请求成功或是失败的标识
 *  @param   string     $msg        为空或是错误类型代号
 *
 */
function jsonResponse($result = 'success', $msg='', $data=[])
{
    $data_arr = array(
        'result' => $result,
        'msg'    => $msg,
        'data'   => $data);
    
    $json = json_encode($data_arr);
    exit($json);
}
