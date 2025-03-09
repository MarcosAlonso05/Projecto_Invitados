<%@ page import="modelo.Servicio" %>
<%@ page import="modelo.Invitado" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Invitados</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Lista de Todos los Invitados</h1>
<%
    Servicio servicio = new Servicio();
    servicio.connect();

    List<Invitado> invitados = servicio.getInvitados();

    if (!invitados.isEmpty()) {
        out.println("<ul>");
        for (Invitado invitado : invitados) {
            out.println("<li>" + invitado.getNombre() + "</li>");
        }
        out.println("</ul>");
    } else {
        out.println("<p>No hay invitados registrados.</p>");
    }

    servicio.disconnect();
%>

<a href="index.jsp" class="volver">Volver</a>
</body>
</html>
