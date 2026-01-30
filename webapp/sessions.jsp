<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<html>
<head>
    <title>Session Data</title>
</head>
<body>
    <h2>Données de la session <%= session.getAttribute("test") %></h2>
    
    <table border="1">
        <tr>
            <th>Clé</th>
            <th>Valeur</th>
        </tr>
        <%
            Map<String, Object> sessionMap = (Map<String, Object>) request.getAttribute("sessionMap");
            if (sessionMap != null) {
                for (Map.Entry<String, Object> entry : sessionMap.entrySet()) {
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
</body>
</html>
