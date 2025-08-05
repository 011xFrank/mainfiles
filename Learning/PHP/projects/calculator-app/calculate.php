<?php
include __DIR__ . '/includes/autoloader.inc.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $operand1 = (int)($_POST['operand1']);
    $operand2 = (int)($_POST['operand2']);
    $operation = $_POST['operation'];

    $user_data = new Calculator($operand1,$operand2);
    $user_data -> setOperation($operation);
    $user_data -> calculate();

    $user_data -> getResult();
}
