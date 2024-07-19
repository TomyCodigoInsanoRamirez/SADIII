<%--
  Created by IntelliJ IDEA.
  User: Tomy
  Date: 07/07/2024
  Time: 07:04 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Proveedores</title>
    <link rel="stylesheet" href="css/registrarEntradas.css">
</head>
<body>
<div class="form-container">
    <h2>Registro de Salidas</h2>
    <form action="registroSalidas" method="post">
        <div class="form-group">
            <label for="folio_S">Folio:</label>
            <input type="text" id="folio_S" name="folio_S">
        </div>
        <div class="form-group">
            <label for="empleado_S">Empleado que envía:</label>
            <input type="number" id="empleado_S" name="empleado_S">
        </div>
        <div class="form-group">
            <label for="empleado_E">Empleado que recibe:</label>
            <input type="number" id="empleado_E" name="empleado_E">
        </div>
        <div class="form-group">
            <label for="area">Área:</label>
            <input type="text" id="area" name="area">
        </div>
        <div class="form-group">
            <label for="fecha">Fecha de Salida:</label>
            <input type="date" id="fecha" name="fecha">
        </div>
        <div class="form-group">
            <label for="cantidad_S">Cantidad:</label>
            <input type="number" id="cantidad_S" name="cantidad_S">
        </div>
        <div class="form-group">
            <label for="claveProducto">Clave del Producto:</label>
            <input type="text" id="claveProducto" name="claveProducto">
        </div>
        <div class="form-group">
            <label for="unidadMedida">Unidad de Medida:</label>
            <input type="text" id="unidadMedida" name="unidadMedida">
        </div>
        <button type="submit">Agregar</button>
        <a href="salidas.jsp">Volver</a>
    </form>
</div>
<script>
    // Script para mostrar RFC en hover
    document.querySelectorAll('select').forEach(select => {
        select.addEventListener('mouseover', function(event) {
            const option = event.target.querySelector('option:checked');
            if (option && option.title) {
                const rfcTooltip = document.createElement('span');
                rfcTooltip.className = 'rfc-tooltip';
                rfcTooltip.textContent = option.title;
                option.parentNode.appendChild(rfcTooltip);
            }
        });

        select.addEventListener('mouseout', function(event) {
            const tooltip = event.target.querySelector('.rfc-tooltip');
            if (tooltip) {
                tooltip.remove();
            }
        });
    });
</script>
</body>
</html>
