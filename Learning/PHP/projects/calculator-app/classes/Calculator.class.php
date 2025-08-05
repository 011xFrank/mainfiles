<?php

class Calculator {
    private $operand1;
    private $operand2;
    private $operator;
    private $result;

    function __construct(int $operand1, int $operand2){
        $this -> operand1 = $operand1;
        $this -> operand2 = $operand2;
    }

    public function setOperation(string $operator) {
        $this -> operator = $operator;
    }

    public function calculate() {
        switch($this -> operator) {
            case "add":
                $this -> result = (int)($this -> operand1 + $this -> operand2);
                break;
            case "sub":
                $this -> result = (int)($this -> operand1 - $this -> operand2);
                break;
            default:
                echo "no operand selected";
                break;
        }
    }

    public function getResult() {
        echo 'Result : ' . $this -> result . '<br>';
    }
}
