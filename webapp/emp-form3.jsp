<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emp form</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/emp/save" method="post">
        <label for="emp.id">ID:</label>
        <input type="text" id="emp.id" name="emp.id" required>
        <br>
        <label for="emp.name">Name:</label>
        <input type="text" id="emp.name" name="emp.name" required>
        <br>

        <input type="hidden" name="emp.dept[0].id" value="1">
        <input type="hidden" name="emp.dept[0].name" value="IT">
        <input type="hidden" name="emp.dept[1].id" value="4">
        <input type="hidden" name="emp.dept[1].name" value="Marketing">
        
        <button type="submit">Save</button>
    </form>
</body>
</html>