<?php
declare(strict_types=1);

$title = 'Home';

ob_start();
include_once BASE_DIR . 'views/index.view.php';
$output = ob_get_clean();

include BASE_DIR . 'views/layout.view.php';

echo $_SERVER['REQUEST_URI'];
