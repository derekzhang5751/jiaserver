<?php
/*!
 * Bricklayer PHP framework
 * Version 1.0.0
 *
 * Copyright 2017, Derek Zhang
 * Released under the MIT license
 */

namespace Bricker;

function email_address_check($email)
{
    $pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
    
    if (preg_match($pattern, $email)) {
        // email address
        return true;
    } else {
        return false;
    }
}


///////////// Test Code /////////////////
/*
echo "\nemail.php test begin\n\n";
$email = 'derek@gmail.com.cn';
if (email_address_check($email) === true) {
    $result = 'true';
} else {
    $result = 'false';
}
echo $email . " return " . $result . "\n";
echo "\nemail.php test end\n\n";
// */
