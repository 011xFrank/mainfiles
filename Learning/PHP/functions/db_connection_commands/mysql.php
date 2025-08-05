<?php
function mysql_database_connect(string $host,string $user_name, string $db_name, string $password, string $db_encoding) {
    $dsn = "mysql:host={$host};dbname={$db_name};charset={$db_encoding}";

    try {
        $pdo = new PDO($dsn, $user_name, $password);
        echo "Connected successfully with PDO\n";
        return $pdo;
    } catch (PDOException $e) {
        echo "Error Connecting To database : " . $e -> getMessage() . 'on line : ' . $e ->getLine();
    }
}
