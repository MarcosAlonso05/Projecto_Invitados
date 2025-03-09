<%@ page import="modelo.Invitado" %>
<%@ page import="modelo.Servicio" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dar de baja</title>
</head>
<body>
<%
    String nombre = request.getParameter("nombre");

    if (nombre != null && !nombre.trim().isEmpty()) {
        Servicio servicio = new Servicio();
        servicio.connect();

        // Obtener la lista de invitados con ese nombre
        List<Invitado> invitados = servicio.getInvitadosByNombre(nombre);

        if (invitados != null && !invitados.isEmpty()) {
            for (Invitado invitado : invitados) {
                servicio.deleteInvitado(invitado.getId()); // Elimina cada invitado con el nombre dado
                out.println("<p>Invitado eliminado con éxito: " + invitado.getNombre() + "</p>");
            }
        } else {
            out.println("<p>Error: No se encontró ningún invitado con el nombre '" + nombre + "'.</p>");
        }

        servicio.disconnect();
    } else {
        out.println("<p>Error: El nombre no puede estar vacío.</p>");
    }
%>
<a href="index.jsp">Volver</a>
</body>
</html>
