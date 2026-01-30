<%@ page import="com.etu003184.entity.Emp, com.etu003184.entity.Dept" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste emp</title>
</head>
<body>
    <h1>Liste des employés</h1>
<%
    Emp[] employees = (Emp[]) request.getAttribute("emps");
    if (employees != null && employees.length > 0) {
%>
    <table border="1" cellpadding="6" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Département</th>
            </tr>
        </thead>
        <tbody>
<%
        for (Emp emp : employees) {
            String idVal = String.valueOf(emp.getId());
            String nameVal = emp.getName() != null ? emp.getName() : "";
            /* Construire une liste de noms de départements prenant en charge :
               - emp.getDept() retournant un Dept unique
               - emp.getDepts() / getDepartments() retournant Collection ou tableau
               Utilisation d'un peu de réflexion pour rester compatible avec plusieurs formes.
            */
            java.util.List<String> deptNames = new java.util.ArrayList<String>();
            try {
                java.lang.reflect.Method m = null;
                Object result = null;
                // essayer getDepts()
                try {
                    m = emp.getClass().getMethod("getDepts");
                    result = m.invoke(emp);
                } catch (NoSuchMethodException e1) {
                    // essayer getDepartments()
                    try {
                        m = emp.getClass().getMethod("getDepartments");
                        result = m.invoke(emp);
                    } catch (NoSuchMethodException e2) {
                        // enfin essayer getDept() (singulier)
                        try {
                            m = emp.getClass().getMethod("getDept");
                            result = m.invoke(emp);
                        } catch (NoSuchMethodException e3) {
                            result = null;
                        }
                    }
                }

                if (result != null) {
                    // Dept unique
                    if (result instanceof com.etu003184.entity.Dept) {
                        com.etu003184.entity.Dept dd = (com.etu003184.entity.Dept) result;
                        if (dd != null && dd.getName() != null) deptNames.add(dd.getName());
                    }
                    // tableau
                    else if (result.getClass().isArray()) {
                        Object[] arr = (Object[]) result;
                        for (Object o : arr) {
                            if (o instanceof com.etu003184.entity.Dept) {
                                com.etu003184.entity.Dept dd = (com.etu003184.entity.Dept) o;
                                if (dd != null && dd.getName() != null) deptNames.add(dd.getName());
                            } else if (o != null) {
                                deptNames.add(o.toString());
                            }
                        }
                    }
                    // Collection
                    else if (result instanceof java.util.Collection) {
                        for (Object o : (java.util.Collection) result) {
                            if (o instanceof com.etu003184.entity.Dept) {
                                com.etu003184.entity.Dept dd = (com.etu003184.entity.Dept) o;
                                if (dd != null && dd.getName() != null) deptNames.add(dd.getName());
                            } else if (o != null) {
                                deptNames.add(o.toString());
                            }
                        }
                    }
                    // fallback : toString()
                    else {
                        deptNames.add(result.toString());
                    }
                }
            } catch (Exception e) {
                // si erreur, on laisse la liste vide (affichera vide)
            }

            String deptVal = deptNames.isEmpty() ? "" : String.join(", ", deptNames);
%>
            <tr>
                <td><%= idVal %></td>
                <td><%= nameVal %></td>
                <td><%= deptVal %></td>
            </tr>
<%
        } // for
%>
        </tbody>
    </table>
<%
    } else {
%>
    <p>Aucun employé trouvé.</p>
<%
    }
%>
</body>
</html>