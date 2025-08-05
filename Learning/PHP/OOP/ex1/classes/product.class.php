<?php
declare(strict_types=1);
class Product {
    private $id;
    private $name;
    private $price;
    private $description;
    private $stock_quantity = 0;
    private $order_amount;

    public function __construct(int $id,string $name,float $price,string $description,int $amount) {
        $this -> id = $id;
        $this -> name = $name;
        $this -> price = $price;
        $this -> description = $description;
        $this -> order_amount = $amount;
    }

    public function getId() : int {
        return $this -> id;
    }

    public function getName() : string {
        return $this -> name;
    }

    public function getPrice() : float {
        return $this -> price;
    }

    public function getDescription() : string {
        return $this -> description;
    }

    public function getOrderAmount() : int {
        return $this -> order_amount;
    }
}
