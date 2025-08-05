<?php foreach ($jokes_list as $joke): ?>
    <blockquote>
        <p>
            <?= htmlspecialchars($joke['joke'], ENT_QUOTES, 'UTF-8'); ?>
            <form action="deletejoke.php" method="post">
                <input type="hidden" name="id" value="<?= $joke['id'] ?>">
                <input type="submit" value="delete">
            </form>
        </p>
    </blockquote>
<?php endforeach; ?>
