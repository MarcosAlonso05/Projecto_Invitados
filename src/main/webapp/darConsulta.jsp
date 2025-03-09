<%@ page import="modelo.Servicio" %>
<%@ page import="modelo.Invitado" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consulta de Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Resultado de la Consulta</h1>

<%
    String nombre = request.getParameter("nombre");

    if (nombre != null && !nombre.trim().isEmpty()) {
        Servicio servicio = new Servicio();
        servicio.connect();

        List<Invitado> invitados = servicio.getInvitadosByNombre(nombre);

        if (!invitados.isEmpty()) {
            out.println("<h2>Invitados encontrados con el nombre '" + nombre + "':</h2>");
            out.println("<ul>");
            for (Invitado invitado : invitados) {
                out.println("<li>" + invitado.getNombre() + "</li>");
            }
            out.println("</ul>");
        } else {
            out.println("<p>No se encontró ningún invitado con el nombre '" + nombre + "'.</p>");
        }

        servicio.disconnect();
    } else {
        out.println("<p>Error: Debe ingresar un nombre para realizar la consulta.</p>");
    }
%>

<a href="consulta.jsp">Volver</a>
</body>
</html>
