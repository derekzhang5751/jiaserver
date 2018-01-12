<?php
/**
 * Created by PhpStorm.
 * User: derek
 * Date: 2018-01-12
 * Time: 11:16 AM
 */

namespace Bricker;


interface ISession
{
    public function init($db, $session_id = '');
    public function getSessionId();
    public function response();
    public function deleteSession();
}