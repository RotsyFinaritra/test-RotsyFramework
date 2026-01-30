<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<html>
<head>
    <title>Session - Ajout</title>
</head>
<body>
    <h2>Ajout en session</h2>
    <p style="color:green;">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </p>
    <hr>
    <h2>Données actuelles de la session</h2>
    <table border="1">
        <tr>
            <th>Clé</th>
            <th>Valeur</th>
        </tr>
        <%
            java.util.Enumeration<String> attrNames = session.getAttributeNames();
            boolean hasData = false;
            while (attrNames.hasMoreElements()) {
                hasData = true;
                String key = attrNames.nextElement();
        %>
        <tr>
            <td><%= key %></td>
            <td><%= session.getAttribute(key) %></td>
        </tr>
        <%
            }
            if (!hasData) {
        %>
        <tr><td colspan="2">Aucune donnée de session disponible.</td></tr>
        <%
            }
        %>
    </table>
    <a href="sessions/form">Retour au formulaire</a>
</body>
</html>
