<%@ page import="modelo.Servicio" %>
<%@ page import="modelo.Invitado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dar de Alta</title>
</head>
<body>
<%
    String nombre = request.getParameter("nombre");
    if (nombre != null && !nombre.trim().isEmpty()) {
        Servicio servicio = new Servicio();
        servicio.connect();

        if (!servicio.getInvitadosByNombre(nombre).isEmpty()) {
            out.println("<p>Error: El invitado con el nombre '" + nombre + "' ya está registrado.</p>");
        } else {
            servicio.saveInvitado(new Invitado(nombre));
            out.println("<p>Invitado agregado con éxito: " + nombre + "</p>");
        }
        servicio.disconnect();
    } else {
        out.println("<p>Error: El nombre no puede estar vacío.</p>");
    }
%>
<a href="index.jsp">Volver</a>
</body>
</html>
