<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/jokes.css">
    <title> <?= $title ?> </title>
</head>
<body>
    <header>Internet Joke Database</header>

    <nav>
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="jokes.php">Jokes</a></li>
            <li><a href="addjoke.php">Add Joke</a></li>
            <li><a href="deletejoke.php">Delete Joke</a></li>
        </ul>
    </nav>

    <main>
        <?= $output ?>
    </main>

    <footer>&copy; IJDB 2025</footer>
</body>
</html>
