<?php

/**
 *  编译密码函数
 *
 * @access  public
 * @param   array   $cfg 包含参数为 $password, $md5password, $salt, $type
 *
 * @return void
 */
function compile_password ($cfg)
{
    if (isset($cfg['password']))
    {
        $cfg['md5password'] = md5($cfg['password']);
    }
    if (empty($cfg['type']))
    {
        $cfg['type'] = PWD_MD5;
    }

    switch ($cfg['type'])
    {
        case PWD_MD5 :
            if (!empty($cfg['ec_salt']))
            {
                return md5($cfg['md5password'].$cfg['ec_salt']);
            }
            else
            {
                return $cfg['md5password'];
            }

        case PWD_PRE_SALT :
            if (empty($cfg['salt']))
            {
                $cfg['salt'] = '';
            }

            return md5($cfg['salt'] . $cfg['md5password']);

        case PWD_SUF_SALT :
            if (empty($cfg['salt']))
            {
                $cfg['salt'] = '';
            }

            return md5($cfg['md5password'] . $cfg['salt']);

        default:
            return '';
    }
}

/**
 * 创建像这样的查询: "IN('a','b')";
 *
 * @access   public
 * @param    mix      $item_list      列表数组或字符串
 * @param    string   $field_name     字段名称
 *
 * @return   void
 */
function db_create_in($item_list, $field_name = '')
{
    if (empty($item_list))
    {
        return $field_name . " IN ('') ";
    }
    else
    {
        if (!is_array($item_list))
        {
            $item_list = explode(',', $item_list);
        }
        $item_list = array_unique($item_list);
        $item_list_tmp = '';
        foreach ($item_list AS $item)
        {
            if ($item !== '')
            {
                $item_list_tmp .= $item_list_tmp ? ",'$item'" : "'$item'";
            }
        }
        if (empty($item_list_tmp))
        {
            return $field_name . " IN ('') ";
        }
        else
        {
            return $field_name . ' IN (' . $item_list_tmp . ') ';
        }
    }
}

function auto_replace($db, $table, $field_values, $update_values, $where = '', $querymode = '')
{
    //$field_descs = $this->getAll('DESC ' . $table);
    $field_descs = $db->query('DESC '.$table)->fetchAll();

    $primary_keys = array();
    foreach ($field_descs AS $value)
    {
        $field_names[] = $value['Field'];
        if ($value['Key'] == 'PRI')
        {
            $primary_keys[] = $value['Field'];
        }
    }

    $fields = $values = array();
    foreach ($field_names AS $value)
    {
        if (array_key_exists($value, $field_values) == true)
        {
            $fields[] = $value;
            $values[] = "'" . $field_values[$value] . "'";
        }
    }

    $sets = array();
    foreach ($update_values AS $key => $value)
    {
        if (array_key_exists($key, $field_values) == true)
        {
            if (is_int($value) || is_float($value))
            {
                $sets[] = $key . ' = ' . $key . ' + ' . $value;
            }
            else
            {
                $sets[] = $key . " = '" . $value . "'";
            }
        }
    }

    $sql = '';
    if (empty($primary_keys))
    {
        if (!empty($fields))
        {
            $sql = 'INSERT INTO ' . $table . ' (' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')';
        }
    }
    else
    {
        if (!empty($fields))
        {
            $sql = 'INSERT INTO ' . $table . ' (' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')';
            if (!empty($sets))
            {
                $sql .=  'ON DUPLICATE KEY UPDATE ' . implode(', ', $sets);
            }
        }
    }

    if ($sql)
    {
        //return $this->query($sql, $querymode);
        $db->query($sql);
        return true;
    }
    else
    {
        return false;
    }
}
