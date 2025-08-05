<?php foreach($notes as $note): ?>
    <form action="/delete_note" method="post">
        <p> <?= $note['note'] ?> </p>
        <input type="hidden" name="id" value="<?= $note['id'] ?>">
        <button type="submit">Delete Note</button>
    </form>
<?php endforeach; ?>
