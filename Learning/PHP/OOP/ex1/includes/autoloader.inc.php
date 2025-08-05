<?php

spl_autoload_register(function($class_name){
    $directory = __DIR__ . '/classes/';
    $extension = '.class.php';
    $full_path = $directory . $class_name . $extension;
    include_once $full_path;
});
