<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Milay e</h1>
    <h1>Liste des depts</h1>

    <%
        // Cast explicite de Object vers String[]
        String[] depts = (String[]) request.getAttribute("listDept");
        String[] emps = (String[]) request.getAttribute("listEmp");
        if (depts != null) {
            for (String dept : depts) {
    %>
    <li><%= dept %></li>
    <%
            }
        } else {
            out.println("<p>Aucun département trouvé dans les attributs</p>");
        } %>


    <h1>Liste des emps</h1>
        <% if (emps != null) {
            for (String emp : emps) { %>
    <li><%= emp %></li>
    <%
            }
        } else {
            out.println("<p>Aucun employé trouvé dans les attributs</p>");
        }
    %>
</body>
</html>