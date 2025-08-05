<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $note_id = $_POST['id'];

    $db = new Database('127.0.0.1','snta_user','snta','1Sijuip@ssword!');

    $query = "DELETE FROM notes WHERE id=:id AND user_id=:user_id";

    $db -> query($query, [$note_id,User::user_id]);

    header("location: /notes");
    exit();
}
