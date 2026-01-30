<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<html>
<head>
    <title>Session - Suppression</title>
</head>
<body>
    <h2>Suppression en session</h2>
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
            Map<String, Object> sessionMap = (Map<String, Object>) request.getAttribute("session");
            if (sessionMap == null) {
                sessionMap = (Map<String, Object>) request.getAttribute("sessionMap");
            }
            if (sessionMap != null) {
                for (Entry<String, Object> entry : sessionMap.entrySet()) {
        %>
        <tr>
            <td><%= entry.getKey() %></td>
            <td><%= entry.getValue() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="2">Aucune donnée de session disponible.</td></tr>
        <%
            }
        %>
    </table>
    <a href="sessions/form">Retour au formulaire</a>
</body>
</html>
