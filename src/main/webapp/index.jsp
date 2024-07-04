<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login SADI</title>
  <link rel='stylesheet' type='text/css' media='screen' href='css/index.css'>
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
          <center> <label for="email">Correo:</label> </center>
          <br>
          <div class="input-container">
            <input type="email" id="email" placeholder="ejemplo: cinestomisl@gmail.com" name="correo" required>
            <span class="icon">@</span>
          </div>
        </div>
        <div class="form-group">
          <center><label for="password">Contraseña:</label></center>
          <br>
          <div class="input-container">
            <input type="password" id="password" placeholder="XXXXXXXXXXX" required name="contra">
            <span class="icon" ><img src="img/visibility_24dp.png" width="30px" id="ojo"></span>
          </div>
        </div>
        <div class="form-group">
          <center><button type="submit">Iniciar sesión</button></center>
        </div>
        <div class="form-group">
          <center><a href="#">Olvidé mi contraseña</a></center>
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
  const campoContra = document.getElementById("password");
  const ojito = document.getElementById("ojo")

  ojito.addEventListener("click",function () {
    if(ojito.getAttribute("src") === "img/visibility_24dp.png"){
      verContra();
    }else{
      ocultarContra();
    }
  })

  function verContra(){
    campoContra.setAttribute("type","text");
    ojito.setAttribute("src","img/visibility_off_24dp.png")
  }

  function ocultarContra(){
    campoContra.setAttribute("type","password");
    ojito.setAttribute("src","img/visibility_24dp.png")
  }
</script>
</body>
</html>