<?php

define('TEMPLATES', __DIR__ . '/templates/');

$title = "Calculator";

ob_start();
include TEMPLATES . 'calculator.html.php';
$output = ob_get_clean();

include TEMPLATES . 'layout.html.php';
