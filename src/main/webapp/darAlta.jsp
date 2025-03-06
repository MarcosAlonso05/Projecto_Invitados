
<%@ page import="modelo.Servicio" %>
<%@ page import="modelo.Invitado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dar de alta</title>
</head>
<body>
<%
    String nombre = request.getParameter("nombre");

    if (nombre != null && !nombre.trim().isEmpty()){
        Servicio s = new Servicio();
        s.connect();
        s.saveInvitado(new Invitado(nombre));
        s.disconnect();
        out.println("<p>Invitado agregado con éxito: " + nombre + "</p>");
    }else {
        out.println("<p>Error: El nombre no puede estar vacío.</p>");
    }

%>
<a href="index.jsp">Volver</a>
</body>
</html>
