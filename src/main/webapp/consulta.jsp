<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Invitados</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Consulta de Invitados</h1>
<nav>
    <form action="darConsulta.jsp" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        <button type="submit">Consultar</button>
    </form>
</nav>


<a href="index.jsp">Volver</a>
</body>
</html>