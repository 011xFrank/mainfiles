<?php
$title = "Notes";

$db = new Database('127.0.0.1','snta_user','snta','1Sijuip@ssword!');

$query = <<<string_
SELECT * FROM notes WHERE user_id = :id;
string_;

$notes = $db -> query($query, [User::user_id]) -> find();

ob_start();
include VIEWS_DIR . 'notes.view.php';
$output = ob_get_clean();

include VIEWS_DIR . 'layout.view.php';
