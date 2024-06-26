<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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


  <!--**************************************************************-->
  <div  class="text-center rounded-3  shadow-lg text-black d-flex">
    <div class=" rounded-start  d-flex align-items-center" >
      <img src="img/login.png" alt="" class="img-fluid rounded d-flex align-items-right rounded-start" width="70%">
    </div>
    <!-- *************************************************************-->
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

<script src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
