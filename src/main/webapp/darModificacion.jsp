<%@ page import="modelo.Servicio" %>
<%@ page import="modelo.Invitado" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Resultado de la Modificación</h1>

<%
    String nombreActual = request.getParameter("nombreActual");
    String nuevoNombre = request.getParameter("nuevoNombre");

    if (nombreActual != null && !nombreActual.trim().isEmpty() &&
            nuevoNombre != null && !nuevoNombre.trim().isEmpty()) {

        Servicio servicio = new Servicio();
        servicio.connect();

        List<Invitado> invitados = servicio.getInvitadosByNombre(nombreActual);

        if (!invitados.isEmpty()) {
            for (Invitado invitado : invitados) {
                Invitado nuevoInvitado = new Invitado();
                nuevoInvitado.setNombre(nuevoNombre);
                nuevoInvitado.setId(invitado.getId());
                servicio.saveInvitado(nuevoInvitado);
            }
            out.println("<p>Invitado modificado con éxito: " + nombreActual + " → " + nuevoNombre + "</p>");
        } else {
            out.println("<p>Error: No se encontró ningún invitado con el nombre '" + nombreActual + "'.</p>");
        }

        servicio.disconnect();
    } else {
        out.println("<p>Error: Ambos campos son obligatorios.</p>");
    }
%>

<a href="modificador.jsp">Volver</a>
</body>
</html>
