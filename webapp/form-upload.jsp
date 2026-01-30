<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload file</title>
</head>

<body>
    <h1>Upload single file</h1>
    <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
        <label for="title">Titre:</label>
        <input type="text" name="title" required>
        <br>
        <label for="file">Fichier:</label>
        <input type="file" name="file" required>
        <br>
        <button type="submit">Uploader</button>
    </form>
</body>

</html>