<?php
$title = "home";

ob_start();
include VIEWS_DIR . 'home.view.php';
$output = ob_get_clean();

include VIEWS_DIR . 'layout.view.php';
