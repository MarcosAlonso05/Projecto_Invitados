<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Invitado</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Eliminar Invitado</h1>
<nav>
    <div class="contenedor_formulario">
        <form action="BajaController" method="POST">
            <input type="hidden" name="action" value="baja"/>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            <button type="submit">Eliminar</button>
        </form>
    </div>
</nav>
<a href="index.jsp" class="volver">Volver</a>
</body>
</html>