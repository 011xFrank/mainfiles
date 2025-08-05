<?php

class Order {
    private $orders = [];

    public function addProduct(Product $product, int $quantity = 1){
        if ($quantity > 1){
            while($quantity > 0){
                $this -> orders[] = $product;
                $quantity--;
            }
        } else {
            $this -> orders[] = $product;
        }
    }

    public function removeProduct(Product $product){
        $length = count($this -> orders);
        for($count = 0;$count < $length;$count++){
            if (($this -> orders)[$count] == $product){
                unset(($this->orders)[$count]);
            }
        }
    }

    public function getTotalAmount(){
        $total = 0;
        foreach($this -> orders as $order){
            $total += $order -> getPrice();
        }
        return $total;
    }

    public function getOrderedProducts(){
        foreach($this -> orders as $order){
            echo 'Id : ' . $order -> getId() . '<br>';
            echo 'Name : ' . $order -> getName() . '<br>';
            echo 'Price : ' . $order -> getPrice() . '<br>';
            echo 'Description : ' . $order -> getDescription() . '<br>';
            echo 'Amount : ' . $order -> getOrderAmount() . '<br>';
            echo '-------------------------------------------------------------- <br>';
        }
        echo 'Total Products : ' . count($this -> orders) . '<br>';
    }
}
