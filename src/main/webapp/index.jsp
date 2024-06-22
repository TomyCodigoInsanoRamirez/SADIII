<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login SADI</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
  <div class="row w-100">
    <div class="col-lg-4 d-flex flex-column justify-content-center align-items-center bg-brown text-white text-center p-4">
      <img src="path_to_your_logo_image.png" alt="SADI Logo" class="img-fluid mb-3" style="max-width: 100px;">
      <h1>SADI</h1>
    </div>
    <div class="col-lg-8 d-flex flex-column justify-content-center align-items-center p-4">
      <form class="w-100" style="max-width: 400px;" method="post" action="inicioSesion">
        <div class="form-group">
          <label for="email">Correo:</label>
          <div class="input-group">
            <input type="email" id="email" class="form-control" placeholder="ejemplo: cinestomisl@gmail.com" name="correo" required>
            <div class="input-group-append">
              <span class="input-group-text">@</span>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="password">Contraseña:</label>
          <div class="input-group">
            <input type="password" id="password" class="form-control" placeholder="XXXXXXXXXXX" required name="contra">
            <div class="input-group-append">
              <span class="input-group-text">🔒</span>
            </div>
          </div>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
        <a href="#" class="d-block text-center mt-3">Olvidé mi contraseña</a>
      </form>
      <div class="text-center mt-3">
        Versión 1.0
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
