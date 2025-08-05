<?php
const BASE_DIR = __DIR__ . '/';
const CLASSES_DIR = __DIR__ . '/classes/';
const AUTO_INCLUDE_DIR = __DIR__ . '/includes/';
const CONTROLLERS_DIR = __DIR__ . '/controllers/';
const VIEWS_DIR = __DIR__ . '/views/';
const FUNCTIONS_FOLDER = __DIR__ . '/functions/';

require AUTO_INCLUDE_DIR . 'autoloader.inc.php';
require BASE_DIR . 'router.php';
