<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Modificar Nombre de Invitado</h1>
<nav>
    <form action="darModificacion.jsp" method="POST">
        <label for="nombreActual">Nombre Actual:</label>
        <input type="text" id="nombreActual" name="nombreActual" required>

        <label for="nuevoNombre">Nuevo Nombre:</label>
        <input type="text" id="nuevoNombre" name="nuevoNombre" required>

        <button type="submit">Modificar</button>
    </form>
</nav>

<a href="index.jsp">Volver</a>
</body>
</html>
