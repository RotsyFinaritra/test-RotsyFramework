<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Etudiant Form 1</h1>
    <form action="${pageContext.request.contextPath}/etudiant/1" method="get">
        <label for="age">Age:</label>
        <input type="text" id="age" name="age" required>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <button type="submit">Save</button>
    </form>
</body>
</html>