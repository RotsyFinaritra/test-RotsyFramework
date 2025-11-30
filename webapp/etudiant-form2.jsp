<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Etudiant Form 2</h1>
    <form action="${pageContext.request.contextPath}/etudiant/save/3184" method="post">
        <label for="age">age:</label>
        <input type="text" id="age" name="age" required>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        Hobbies:
        <br>
        <input type="checkbox" id="sport" name="hobbies" value="sport">
        <label for="sport">Sport</label>
        <br>
        <input type="checkbox" id="music" name="hobbies" value="music">
        <label for="music">Music</label>
        <br>
        <button type="submit">Save</button>
    </form>
</body>
</html>