<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Invitados</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Consulta de Invitados</h1>
<nav>
    <form action="ConsultaController" method="GET">
        <input type="hidden" name="action" value="consulta"/>

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        <button type="submit">Consultar</button>
    </form>
</nav>

<a href="index.jsp">Volver</a>
</body>
</html>