<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Invitado" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Resultado de la Consulta</h1>

<%
    String mensaje = (String) request.getAttribute("mensaje");
    if (mensaje != null) {
        out.println("<p>" + mensaje + "</p>");
    } else {
        List<Invitado> invitados = (List<Invitado>) request.getAttribute("invitados");
        String nombre = (String) request.getAttribute("nombre");

        if (invitados != null && !invitados.isEmpty()) {
            out.println("<h2>Invitados encontrados con el nombre '" + nombre + "':</h2>");
            out.println("<ul>");
            for (Invitado invitado : invitados) {
                out.println("<li>" + invitado.getNombre() + "</li>");
            }
            out.println("</ul>");
        }
    }
%>

<a href="consulta.jsp">Volver</a>
</body>
</html>