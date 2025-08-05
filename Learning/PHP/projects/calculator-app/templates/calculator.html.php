<form action="calculate.php" method="post">
    <label for="operand1">Enter first digit : </label>
    <input type="number" id="operand1" name="operand1" required>

    <label for="operand2">Enter first digit : </label>
    <input type="number" id="operand2" name="operand2" required>

    <br>

    <input type="radio" id="addition" name="operation" value="add" required>
    <label for="addition">Addition</label>

    <br>

    <input type="radio" id="subtraction" name="operation" value="sub" required>
    <label for="subtraction">Subtraction</label>

    <br>

    <input type="submit" value="submit">
</form>
