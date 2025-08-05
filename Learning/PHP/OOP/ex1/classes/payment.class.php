<?php

interface IPaymentGateway {
    function processPayment(Order $Order, $amount);
    function refundPayment(Order $order, $amount);
}

class PaypalGateway implements IPaymentGateway {
    function processPayment(Order $Order, $amount){}
    function refundPayment(Order $order, $amount){}
}

class StripeGateway implements IPaymentGateway {
    function processPayment(Order $Order, $amount){}
    function refundPayment(Order $order, $amount){}
}

$paypal = new PaypalGateway();
$stripe = new StripeGateway();
