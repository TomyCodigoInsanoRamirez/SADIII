<!--
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login SADI</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/bootstrap.css">
  <style>
    /* Estilo personalizado para la imagen */
    .custom-small-image {
      max-width: 300px; /* Define el ancho máximo de la imagen */
      height: auto; /* Mantiene la relación de aspecto original */
    }
  </style>
</head>
<body class="d-flex align-items-center justify-content-center" style="min-height: 100vh;">
<div  class="align-items-center text-center justify-content-center d-flex ">


  <div  class="text-center rounded-3  shadow-lg text-black d-flex">
    <div class=" rounded-start  d-flex align-items-center" >
      <img src="img/login.png" alt="" class="img-fluid rounded d-flex align-items-right rounded-start" width="70%">
    </div>

    <div  class="align-items-center mx-auto text-center justify-content-center d-flex ">

      <form method="post" action="inicioSesion">

        <div class="row">
          <div class=" mb-3">
            <label  class="form-label">Correo Electronico: </label>
            <input type="email" id="email" class="form-control" placeholder="ejemplo: cinestomisl@gmail.com" name="correo" required>
            <div id="emailHelp" class="form-text">Nunca compartiremos su correo electrónico con nadie más.</div>
          </div>
          <div class=" mb-3">
            <label  class="form-label">Contraseña: </label>
            <input type="password" id="password" class="form-control" placeholder="XXXXXXXXXXX" required name="contra">
          </div>
          <br>
          <div class="justify-content-center align-items-center d-flex">
            <button type="submit" class="btn btn-primary" >Enviar</button>
          </div>
        </div>
      </form>
    </div>

  </div>
</div>


<div id="errorModal" class="modal">
  <div class="modal-content">
    <span class="close-button">&times;</span>
    <h2>Algo salió mal :(</h2>
    <p>Credenciales incorrectas.</p>
  </div>
</div>
<style>
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0);
      background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 300px;
      text-align: center;
    }

    .close-button {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      background-color: #f13f3f;
      height: 40px;
      width: 40px;
      border-radius: 50%;
      position: relative;
      left: 230px;
      top: -17px;
      display: grid;
      place-content: center;
    }

    .close-button:hover,
    .close-button:focus {
      color: white;
      text-decoration: none;
      cursor: pointer;
      background-color: red;
    }
    /*---------------------------------*/
    .text-center rounded-3  shadow-lg text-black d-flex{
      border-top-right-radius: 500px; /* Ajusta el valor según lo necesites */
      border-bottom-right-radius: 500px;
    }
</style>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const params = new URLSearchParams(window.location.search);
    if (params.has('error')) {
      document.getElementById('errorModal').style.display = 'block';
    }

    document.querySelector('.close-button').onclick = function() {
      document.getElementById('errorModal').style.display = 'none';
    }
  });
</script>
<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login SADI</title>
  <link rel="stylesheet" href="index.css">
</head>
<body>
<div class="container">
  <div class="login-box">
    <div class="left-panel">
      <img src="img/login.png" alt="SADI" class="logo">
    </div>
    <div class="right-panel">
      <form method="post" action="inicioSesion">
        <div class="form-group">
          <label for="email">Correo:</label>
          <div class="input-container">
            <input type="email" id="email" placeholder="ejemplo: cinestomisl@gmail.com" name="correo" required>
            <span class="icon">@</span>
          </div>
        </div>
        <div class="form-group">
          <label for="password">Contraseña:</label>
          <div class="input-container">
            <input type="password" id="password" placeholder="XXXXXXXXXXX" required name="contra">
            <span class="icon">&#x1F512;</span>
          </div>
        </div>
        <div class="form-group">
          <button type="submit">Iniciar sesión</button>
        </div>
        <div class="form-group">
          <a href="#">Olvidé mi contraseña</a>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div id="errorModal" class="modal">
  <div class="modal-content">
    <span class="close-button">&times;</span>
    <h2>Algo salió mal :(</h2>
    <p>Credenciales incorrectas.</p>
  </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const params = new URLSearchParams(window.location.search);
    if (params.has('error')) {
      document.getElementById('errorModal').style.display = 'block';
    }

    document.querySelector('.close-button').onclick = function() {
      document.getElementById('errorModal').style.display = 'none';
    }
  });
</script>
</body>
</html>
