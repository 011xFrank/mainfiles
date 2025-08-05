<?php foreach($db_jokes_results as $joke) : ?>
    <p>
        <?= htmlspecialchars($joke["joke"], ENT_QUOTES, 'UTF-8'); ?>
    </p>
<?php endforeach; ?>
