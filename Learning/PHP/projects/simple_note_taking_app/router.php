<?php
$uri = parse_url($_SERVER['REQUEST_URI'])['path'];

$routes = [
    '/' => CONTROLLERS_DIR . 'home.php',
    '/notes' => CONTROLLERS_DIR . 'notes.php',
    '/delete_note' => CONTROLLERS_DIR . 'delete_note.php',
    '/add_note' => CONTROLLERS_DIR . 'add_note.php'
];

function abort($code = Response::NOT_FOUND){
    http_response_code($code);
    require CONTROLLERS_DIR . 'error404.php';
}

function routeToController(string $uri, array $routes) {
    if (array_key_exists($uri, $routes)) {
        require $routes[$uri];
    } else {
        abort();
    }
}

routeToController($uri,$routes);
