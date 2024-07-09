<%--
  Created by IntelliJ IDEA.
  User: kikel
  Date: 27/06/2024
  Time: 11:16 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
    <link rel="stylesheet" href="css/profile.css">

</head>
<body>
<div class="header">
    <img src="img/login.png" alt="SADI">
    <img src="img/perfil.png" alt="Perfil">
</div>
<div class="container">

    <h2>Perfil de Usuario</h2>
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre">
    </div>
    <div class="form-group">
        <label for="telefono">Teléfono</label>
        <input type="text" id="telefono" name="telefono">
    </div>
    <div class="form-group">
        <label for="direccion">Dirección</label>
        <input type="text" id="direccion" name="direccion">
    </div>
    <div class="form-group">
        <label for="codigo_postal">Código Postal</label>
        <input type="text" id="codigo_postal" name="codigo_postal">
    </div>
    <div class="form-group">
        <label for="telefono_adicional">Teléfono Adicional</label>
        <input type="text" id="telefono_adicional" name="telefono_adicional">
    </div>
    <div class="actions">
        <button class="save">Guardar</button>
        <button class="cancel">Cancelar</button>
    </div>
</div>
</body>
</html>

