<main>
    <ul>
        <?php foreach($filtered_books as $book): ?>
            <li>
                <?php
                $author = $book['author'];
                $name = $book['name'];
                $release_year = $book['release_year'];

                echo "$name by $author ($release_year)";
                ?>
            </li>
        <?php endforeach;?>
    </ul>

    <form action="/books" method="get">
        <label for="text">Text : </label>
        <input type="text" id="text" name="test-text" placeholder="enter text">
        <input type="submit" value="submit">
    </form>
</main>
