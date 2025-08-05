<?php
declare(strict_types=1);

class User {
    private $id;
    private $username;
    private $email;
    private $password_hash;

    private function hashPass($raw_password,$action = 'encrypt') : array {
        $hashed_password = fn() => $raw_password;
        if ($action == 'encrypt') {
            return [true, $hashed_password];
        } elseif ($action = 'decrypt') {
            return [true, $hashed_password];
        } else {
            return [false, 'Error Executing hashPass() function : invalid action'];
        }
    }


    public function register($username,$email,$password){
        $this -> username = $username;
        $this -> email = $email;
        $this -> password_hash = $this -> hashPass($password);
    }

    public function login($username,$password) {
        $login_username = $this -> username;
        $decrypted_pass = $this -> hashPass($this -> password_hash,'decrypt');

        if ($login_username === $username && $password === $decrypted_pass) {
            return true;
        } else {
            return false;
        }
    }

    public function changePassword($new_password) {
        $this->password_hash = $this->hashPass($new_password);
    }
}

class AdminUser extends User {
    public function manageUsers(){}
}

class CustomerUser extends user{
    public function viewOrderHistory(){}
}
