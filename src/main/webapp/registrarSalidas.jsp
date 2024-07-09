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
    <form>
        <div class="form-group">
            <label for="area-name">Área:</label>
            <select id="area-name" name="area-name">
                <option value="Area 1" title="RFC123456">CDS</option>
                <option value="Area 2" title="RFC654321">Docencia 2</option>
                <!-- Agrega más opciones según sea necesario -->
            </select>
        </div>
        <div class="form-group">
            <label for="almacenista-envia-name">Almacenista que envía:</label>
            <select id="almacenista-envia-name" name="almacenista-envia-name">
                <option value="Tomas " title="RFC123456">Tomas</option>
                <option value="Kike" title="RFC654321">Kike</option>
                <!-- Agrega más opciones según sea necesario -->
            </select>
        </div>
        <div class="form-group">
            <label for="almacenista-recibe-name">Almacenista que envía:</label>
            <select id="almacenista-recibe-name" name="almacenista-recibe-name">
                <option value="Proveedor 1" title="RFC123456">Tomas</option>
                <option value="Proveedor 2" title="RFC654321">Kike</option>
                <!-- Agrega más opciones según sea necesario -->
            </select>
        </div>
        <div class="form-group">
            <label for="entry-date">Fecha de Salida:</label>
            <input type="date" id="entry-date" name="entry-date">
        </div>

        <div class="form-group">
            <label for="product">Producto:</label>
            <select id="product" name="product">
                <option value="Producto 1">Producto 1</option>
                <option value="Producto 2">Producto 2</option>
                <!-- Agrega más opciones según sea necesario -->
            </select>
        </div>
        <div class="form-group">
            <label for="unit">Unidad de medida:</label>
            <select id="unit" name="unit">
                <option value="Unidad 1">Unidad 1</option>
                <option value="Unidad 2">Unidad 2</option>
                <!-- Agrega más opciones según sea necesario -->
            </select>
        </div>
        <div class="form-group">
            <label for="quantity">Cantidad:</label>
            <input type="number" id="quantity" name="quantity">
        </div>
        <div class="form-group">
            <label for="unit-price">Precio unitario:</label>
            <input type="number" id="unit-price" name="unit-price">
        </div>
        <div class="form-group">
            <label for="total-price">Precio total de productos:</label>
            <input type="number" id="total-price" name="total-price" readonly>
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
