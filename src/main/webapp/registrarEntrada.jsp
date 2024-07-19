<%--
  Created by IntelliJ IDEA.
  User: Tomy
  Date: 06/07/2024
  Time: 06:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de  entradas</title>
    <link rel="stylesheet" href="css/registrarEntradas.css">
</head>
<body>
<div id="capa-obscurecer"></div>
<div class="form-container">
    <h2>Registro de Entradas</h2>

    <form action="registroEntradas" method="post">
        <div class="form-group">
            <label for="folio-E">Folio:</label>
            <input type="text" id="folio-E" name="folio-E">
        </div>
        <div class="form-group">
            <label for="billing-number">Número de facturación:</label>
            <input type="text" id="billing-number" name="billing-number">
        </div>
        <div class="form-group">
            <label for="provider-name">Nombre del proveedor:</label>
            <select id="provider-name" name="provider-name">
                <option value="RFC123456">Proveedor 1</option>
                <option value="RFC654321">Proveedor 2</option>
            </select>
        </div>
        <div class="form-group">
            <label for="entry-date">Fecha de entrada:</label>
            <input type="date" id="entry-date" name="entry-date">
        </div>
        <div class="form-group">
            <label for="receiver-name">Nombre completo (almacenista receptor):</label>
            <select id="receiver-name" name="receiver-name">
                <option value="1">Almacenista 1</option>
                <option value="2">Almacenista 2</option>
            </select>
        </div>
        <div class="form-group">
            <label for="product">Producto:</label>
            <select id="product" name="product">
                <option value="Producto 1">Producto 1</option>
                <option value="Producto 2">Producto 2</option>
            </select>
        </div>
        <div class="form-group">
            <label for="unit">Unidad de medida:</label>
            <select id="unit" name="unit">
                <option value="Unidad 1">Unidad 1</option>
                <option value="Unidad 2">Unidad 2</option>
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
        <button id="btn-enviarr" type="submit" class="btn-to-actions">Agregar</button>
        <a id="add-desdeEntrada" class="btn-to-actions">Agregar Producto</a>
        <a id="btn-backl" href="entradas.jsp" class="btn-to-actions">Volver</a>
    </form>
</div>

<!---->
<div id="popup-container" class="popup-container">
    <div class="popup-header">
        <h2>Registro de Productos</h2>
        <button id="close-desdeEntradas" class="close-btn" >✖</button>
    </div>
    <form>
        <div class="form-group">
            <label for="product-key">CLAVE:</label>
            <input type="text" id="product-key" name="product-key" placeholder="EJEMPLO:">
        </div>
        <div class="form-group">
            <label for="product-name">NOMBRE:</label>
            <input type="text" id="product-name" name="product-name" placeholder="EJEMPLO:">
        </div>
        <div class="form-group">
            <label for="description">DESCRIPCIÓN:</label>
            <textarea id="description" name="description" placeholder="EJEMPLO:"></textarea>
        </div>
        <button type="submit" class="add-btn">Agregar</button>
    </form>
</div>
<script>
    document.getElementById("add-desdeEntrada").addEventListener("click",function (event) {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        let btnSent = document.getElementById("btn-enviarr")
        let btnAdd = document.getElementById("add-desdeEntrada")
        let btnback = document.getElementById("btn-backl")
        if (pop.style.display === "none") {
            pop.style.display = "block";
            capa.style.backgroundColor = "rgba(0,0,0,0.7)";
            btnSent.style.zIndex = 0;
            btnAdd.style.zIndex = 0;
            btnback.style.zIndex = 0;
        } else {
            pop.style.display = "none";
            capa.style.backgroundColor = "rgba(255,255,255,0)";
            btnSent.style.zIndex = 2;
            btnAdd.style.zIndex = 2;
            btnback.style.zIndex = 2;
        }
        event.preventDefault();
    })
    document.getElementById("close-desdeEntradas").addEventListener("click", function (event) {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        let btnSent = document.getElementById("btn-enviarr")
        let btnAdd = document.getElementById("add-desdeEntrada")
        let btnback = document.getElementById("btn-backl")
        if (pop.style.display === "none") {
            pop.style.display = "block";
            capa.style.backgroundColor = "rgba(0,0,0,0.7)";
            btnSent.style.zIndex = 0;
            btnAdd.style.zIndex = 0;
            btnback.style.zIndex = 0;
        } else {
            pop.style.display = "none";
            capa.style.backgroundColor = "rgba(255,255,255,0)";
            btnSent.style.zIndex = 2;
            btnAdd.style.zIndex = 2;
            btnback.style.zIndex = 2;
        }
        /*let pop = document.getElementById("popup-container");
        if (pop.style.display === "none") {
            pop.style.display = "block";
        }else{
            pop.style.display = "none";
        }*/
        event.preventDefault();
    })
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
