<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Multiple Files</title>
</head>

<body>
    <h1>Upload Multiple Files</h1>
    <form action="${pageContext.request.contextPath}/upload/multiple" method="post" enctype="multipart/form-data">
        <label for="files">Fichiers:</label>
        <input type="file" name="files" multiple required>
        <br>
        <button type="submit">Uploader</button>
    </form>
</body>

</html>