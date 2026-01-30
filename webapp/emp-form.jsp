<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emp form</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/emp/save" method="post">
        <label for="emp.id">ID emp 1:</label>
        <input type="text" id="emp.id" name="emp.id" required>
        <br>
        <label for="emp.name">Name emp 1:</label>
        <input type="text" id="emp.name" name="emp.name" required>
        <br>

        <input type="hidden" name="emp.dept.id" value="1">
        <input type="hidden" name="emp.dept.name" value="IT">
        
        <button type="submit">Save</button>
    </form>
</body>
</html>