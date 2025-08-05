<?php
function pgsql_database_connect(string $host,string $user_name, int $port, string $db_name, string $password) {
    $dsn = "pgsql:host={$host};port={$port};dbname={$db_name}";

    try {
        $pdo = new PDO($dsn, $user_name, $password);
        echo "Connected successfully with PDO\n";
        return $pdo;
    } catch (PDOException $e) {
        echo "Error Connecting To database : " . $e -> getMessage() . 'on line : ' . $e ->getLine();
    }
}
