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
    <div class="contenedor_formulario">
        <form action="ModificadorController" method="POST">
            <input type="hidden" name="action" value="modificar"/>

            <label for="nombreActual">Nombre Actual:</label>
            <input type="text" id="nombreActual" name="nombreActual" required>

            <label for="nuevoNombre">Nuevo Nombre:</label>
            <input type="text" id="nuevoNombre" name="nuevoNombre" required>

            <button type="submit">Modificar</button>
        </form>
    </div>
</nav>

<a href="index.jsp" class="volver" >Volver</a>
</body>
</html>
