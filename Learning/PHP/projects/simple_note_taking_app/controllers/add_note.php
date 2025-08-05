<?php
$title = "Add Note";

ob_start();
require VIEWS_DIR . 'add_note.view.php';
$output = ob_get_clean();

require VIEWS_DIR . 'layout.view.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST'){
    $note = $_POST['note'];

    $db = new Database('127.0.0.1','snta_user','snta','1Sijuip@ssword!');
    $query = "INSERT INTO notes (note,user_id) VALUES (?,?);";
    $db -> query($query, [$note,User::user_id]);
}
