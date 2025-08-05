<?php
declare(strict_types=1);
$title = "Delete Joke";
$title = 'Add new Joke';

define('DB_HOST', '127.0.0.1');
define('DB_NAME', 'ijdb');
define('DB_USER', 'root');
define('DB_PASS', '!123456789');
define('DB_ENCODNG', 'utf8');

function database_connecton_parameters(string $db_host, string $db_name, string $db_encoding) {
    $final_parameter = 'mysql:host=' . $db_host . ';dbname=' . $db_name. ';charset=' . $db_encoding;
    return $final_parameter;
}

try {
    $pdo = new PDO(database_connecton_parameters(DB_HOST, DB_NAME, DB_ENCODNG), DB_USER, DB_PASS);

    $query = <<<query_
    SELECT `id`, `joke` FROM `jokes`;
    query_;

    $jokes_list = $pdo -> query($query);

    ob_start();
    include __DIR__ . '/../templates/deletejoke.html.php';
    $output = ob_get_clean();
} catch (PDOException $e) {
    $output = 'Unable To Establish Database Connection : ' . $e -> getMessage() . ' in line ' . $e -> getLine();
}

try {
    if (isset($_POST['id'])){
        $query = <<<query_
        DELETE FROM `jokes` WHERE `id` = :id;
        query_;

        $statement = $pdo -> prepare($query);
        $statement -> bindValue(':id', $_POST['id']);
        $statement -> execute();

        header("location: jokes.php");
        exit();
    }
} catch (PDOException $e) {
    $output = 'Unable To Establish Database Connection : ' . $e -> getMessage() . ' in line ' . $e -> getLine();
}

include __DIR__ . '/../templates/layout.html.php';

$pdo = null;
