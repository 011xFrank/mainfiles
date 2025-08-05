<?php
interface Notifier {
    function send(string $recipent, string $message):bool;
}

class EmailNotifier implements Notifier {
    function send(string $recipent, string $message):bool {
        echo 'Sending email to : ' . $recipent . ' : ' . $message . '<br>';
        return true;
    }
}

class SmsNotifier implements Notifier {
    function send(string $recipent, string $message):bool {
        echo 'Sending SMS to : ' . $recipent . ' : ' . $message . '<br>';
        return true;
    }
}

class NotificationService {
    private Notifier $service;

    public function __construct(Notifier $service){
        $this -> service = $service;
    }

    function notifyuser(string $recipent, string $message) {
        $this -> service -> send($recipent,$message);
    }
}
