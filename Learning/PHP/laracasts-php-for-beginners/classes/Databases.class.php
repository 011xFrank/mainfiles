<?php
class Database {
    private $host;
    private $port;
    private $db_name;
    private $user_name;
    private $password;

    public function __construct(string $host,string $user_name, string $db_name, string $password){
        $this -> host = $host;
        $this -> db_name = $db_name;
        $this -> user_name = $user_name;
        $this -> password = $password;
    }

    public function database_connect(string $database){
        if ($database === 'mysql'){
            $host = $this -> host;
            $port = $this -> port;
            $db_name = $this -> db_name;
            $user_name = $this -> user_name;
            $password = $this -> password;
            $dsn = "mysql:host={$host};dbname={$db_name};charset=utf-8";

            try {
                $pdo = new PDO($dsn, $user_name, $password);
                echo "Connected successfully with PDO\n";
                return $pdo;
            } catch (PDOException $e) {
                echo "Error Connecting To database : " . $e -> getMessage() . 'on line : ' . $e ->getLine();
            }
        } elseif ($database === 'pgsql'){
            $port = '5432';
            $host = $this -> host;
            $db_name = $this -> db_name;
            $user_name = $this -> user_name;
            $password = $this -> password;
            $dsn = "pgsql:host={$host};port={$port};dbname={$db_name}";

            try {
                $pdo = new PDO($dsn, $user_name, $password);
                echo "Connected successfully with PDO\n";
                return $pdo;
            } catch (PDOException $e) {
                echo "Error Connecting To database : " . $e -> getMessage() . 'on line : ' . $e ->getLine();
            }
        } else {
            echo "Invalid Database Name";
        }
    }
}
