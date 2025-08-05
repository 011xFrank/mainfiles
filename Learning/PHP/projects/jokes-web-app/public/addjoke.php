<?php
declare(strict_types=1);
$title = 'Add new Joke';

define('DB_HOST', '127.0.0.1');
define('DB_NAME', 'ijdb');
define('DB_USER', 'root');
define('DB_PASS', '!123456789');
define('DB_ENCODNG', 'utf8');

// function database_connecton_parameters(string $db_host, string $db_name, string $db_encoding) {
    // $final_parameter = 'mysql:host=' . $db_host . ';dbname=' . $db_name. ';charset=' . $db_encoding;
    // return $final_parameter;
// }

# pgsql:host=$host;port=$port;dbname=$dbname;user=$user;password=$password
#
function pgsql_database_connecton_parameters(string $host, int $port, string $db_name, string $user, string $password) {
    $db_connection_command = 'pgsql:host=' . $host . ';port=' . $port . ';db_name=' . $db_name . ';user=' . $user . ';password=' . $password;
    return $db_connection_command;
}

if(isset($_POST['addjoke'])){
    try {
        $joke = $_POST['addjoke'];

        $pdo = new PDO(database_connecton_parameters(DB_HOST, DB_NAME, DB_ENCODNG), DB_USER, DB_PASS);

        $query = <<<string___
        INSERT INTO jokes SET
        `joke` = :joke,
        `date` = CURDATE();
        string___;

        $statement = $pdo -> prepare($query);
        $statement -> bindValue(':joke', $joke);
        $statement -> execute();

        header('location: jokes.php');
    } catch (PDOException $e) {
        $output = 'Unable to Establish Database Connection: ' . $e -> getMessage() . 'in line' . $e -> getLine();
    }
} else {
    ob_start();

    include __DIR__ . '/../templates/addjoke.html.php';

    $output = ob_get_clean();
}

include __DIR__ . '/../templates/layout.html.php';

$pdo = null;
