<?php

spl_autoload_register(
    function($class_name) {
        $directory = 'classes/';
        $extension = '.class.php';

        $path = $directory . $class_name . $extension;

        if(!file_exists($path)) {
            echo 'test';
            return false;
        }

        include_once $path;
    }
);
