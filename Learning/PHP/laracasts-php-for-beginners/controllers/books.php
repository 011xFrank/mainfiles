<?php
declare(strict_types=1);

const  BASE_DIR = __DIR__ . '/../';

$title = 'Books';

$books = [
    [
        'name' => 'The Hitchhiker\'s Guide to the Galaxy',
        'author' => 'Douglas Adams',
        'release_year' => 1979,
        'purchase_url' => 'https://example.com/hitchhikers-guide'
    ],
    [
        'name' => 'Pride and Prejudice',
        'author' => 'Jane Austen',
        'release_year' => 1813,
        'purchase_url' => 'https://example.com/pride-and-prejudice'
    ],
    [
        'name' => '1984',
        'author' => 'George Orwell',
        'release_year' => 1949,
        'purchase_url' => 'https://example.com/1984'
    ],
    [
        'name' => 'To Kill a Mockingbird',
        'author' => 'Harper Lee',
        'release_year' => 1960,
        'purchase_url' => 'https://example.com/to-kill-a-mockingbird'
    ],
    [
        'name' => 'The Great Gatsby',
        'author' => 'F. Scott Fitzgerald',
        'release_year' => 1925,
        'purchase_url' => 'https://example.com/the-great-gatsby'
    ]
];

$filtered_books = array_filter($books,function ($book) {
    return $book['author'] > 'Harper Lee';
});

ob_start();
include_once BASE_DIR . 'views/books.view.php';
$output = ob_get_clean();

include BASE_DIR . 'views/layout.view.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET'){
    echo 'Text input : ' . $_REQUEST['test-text'];
}
