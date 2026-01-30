<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emp form</title>
</head>
<body>
    <h1>ETU 3208</h1>
    <form action="${pageContext.request.contextPath}/emp/save" method="post">
        <label for="emp[0].id">ID:</label>
        <input type="text" id="emp[0].id" name="emp[0].id" required>
        <br>
        <label for="emp[0].name">Name:</label>
        <input type="text" id="emp[0].name" name="emp[0].name" required>
        <br>

        <input type="hidden" name="emp[0].dept[0].id" value="1">
        <input type="hidden" name="emp[0].dept[0].name" value="IT">
        <input type="hidden" name="emp[0].dept[1].id" value="4">
        <input type="hidden" name="emp[0].dept[1].name" value="Marketing">

        <label for="emp[2].id">ID:</label>
        <input type="text" id="emp[2].id" name="emp[2].id" required>
        <br>
        <label for="emp[2].name">Name:</label>
        <input type="text" id="emp[2].name" name="emp[2].name" required>
        <br>

        <input type="hidden" name="emp[2].dept[0].id" value="2">
        <input type="hidden" name="emp[2].dept[0].name" value="RH">
        <input type="hidden" name="emp[2].dept[1].id" value="3">
        <input type="hidden" name="emp[2].dept[1].name" value="Finance">
        
        <button type="submit">Save</button>
    </form>
</body>
</html>