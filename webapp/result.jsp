<%@ page import="com.etu003184.model.UploadedFile" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Upload</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .error { color: red; }
        table { border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ccc; padding: 8px 12px; text-align: left; }
        th { background-color: #f4f4f4; }
        a { display: inline-block; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>Résultat de l'upload</h1>

<%
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
    String fileName = (String) request.getAttribute("fileName");
    Long size = (Long) request.getAttribute("size");
    UploadedFile[] files = (UploadedFile[]) request.getAttribute("files");
%>

<%-- Affichage des erreurs --%>
<% if (error != null && !error.isEmpty()) { %>
    <p class="error"><strong>Erreur :</strong> <%= error %></p>
<% } %>

<%-- Affichage du message de succès (upload simple) --%>
<% if (message != null && !message.isEmpty()) { %>
    <p class="success"><strong><%= message %></strong></p>
<% } %>

<%-- Affichage détail fichier unique --%>
<% if (fileName != null && !fileName.isEmpty()) { %>
    <h2>Fichier uploadé</h2>
    <table>
        <thead>
            <tr>
                <th>Nom du fichier</th>
                <th>Taille (octets)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= fileName %></td>
                <td><%= size != null ? size : "N/A" %></td>
            </tr>
        </tbody>
    </table>
<% } %>

<%-- Affichage liste fichiers multiples --%>
<% if (files != null && files.length > 0) { %>
    <h2>Fichiers uploadés</h2>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Nom du fichier</th>
                <th>Taille (octets)</th>
            </tr>
        </thead>
        <tbody>
<%
        int index = 1;
        for (UploadedFile f : files) {
            if (f != null && !f.isEmpty()) {
%>
            <tr>
                <td><%= index++ %></td>
                <td><%= f.getFileName() %></td>
                <td><%= f.getSize() %></td>
            </tr>
<%
            }
        }
%>
        </tbody>
    </table>
    <p class="success"><strong>Total : <%= index - 1 %> fichier(s) uploadé(s) avec succès.</strong></p>
<% } %>

<%-- Message si rien n'a été uploadé --%>
<% if (error == null && message == null && fileName == null && (files == null || files.length == 0)) { %>
    <p>Aucun fichier n'a été uploadé.</p>
<% } %>

    <a href="${pageContext.request.contextPath}/upload/form1">⬅ Retour au formulaire (fichier unique)</a>
    <br>
    <a href="${pageContext.request.contextPath}/upload/form2">⬅ Retour au formulaire (fichiers multiples)</a>
</body>
</html>
