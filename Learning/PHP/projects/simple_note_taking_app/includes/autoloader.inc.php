<?php
spl_autoload_register(function($class_name) {
    $extension = '.class.php';
    $directory = __DIR__ . '/../classes/';
    $full_path = $directory . $class_name . $extension;

    include_once $full_path;
});
