<%@ page import="modelo.Invitado" %>
<%@ page import="modelo.Servicio" %><%--
  Created by IntelliJ IDEA.
  User: danie
  Date: 06/03/2025
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dar de baja</title>
</head>
<body>
<%
    String nombre = request.getParameter("nombre");

    if (nombre != null && !nombre.trim().isEmpty()){
        Servicio s = new Servicio();
        s.connect();
        s.deleateInvitado(new Invitado(nombre));
        s.disconnect();
        out.println("<p>Invitado agregado con éxito: " + nombre + "</p>");
    }else {
        out.println("<p>Error: El nombre no puede estar vacío.</p>");
    }

%>

</body>
</html>
