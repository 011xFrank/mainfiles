<?php
$uri = parse_url($_SERVER['REQUEST_URI'])['path'];

$routes = [
    '/' => BASE_DIR . 'controllers/index.php',
    '/books' => BASE_DIR . 'controllers/books.php'
];

function abort(int $code = 404) {
    http_response_code($code);
    $output = "Page Not Found";
    require BASE_DIR . 'views/layout.view.php';
}

function routeToController(string $uri, array $routes) {
    if(array_key_exists($uri,$routes)){
        require $routes[$uri];
    } else {
        abort(404);
    }
}


routeToController($uri,$routes);
