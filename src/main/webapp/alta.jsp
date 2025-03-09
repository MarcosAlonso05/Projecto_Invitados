<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Agregar Invitado</h1>
<nav>
    <div class="contenedor_formulario">
        <form action="AltaController" method="POST">
            <input type="hidden" name="action" value="alta"/>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            <button type="submit">Agregar</button>
        </form>
    </div>
</nav>
<a href="index.jsp" class="volver">Volver</a>
</body>
</html>