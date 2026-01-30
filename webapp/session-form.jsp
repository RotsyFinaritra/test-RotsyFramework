<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<html>
<head>
    <title>Formulaire Session</title>
</head>
<body>
    <h2>Ajouter une donnée à la session</h2>
    <form action="${pageContext.request.contextPath}/sessions/save" method="post">
        <label for="key">Clé :</label>
        <input type="text" id="key" name="key" required>
        <br>
        <label for="value">Valeur :</label>
        <input type="text" id="value" name="value" required>
        <br>
        <button type="submit">Ajouter</button>
    </form>
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
</body>
</html>
