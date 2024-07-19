<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            padding: 20px;
            margin: 20px;
            position: relative;
        }
        .edit-form {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.1);
            display: none;
            align-items: center;
            justify-content: center;
        }
        .edit-form form {
            background-color: #ccc;
            padding: 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="profile-card">
                <div class="profile-info">
                    <p><strong>Nombre:</strong> Enrique de Jesus Hernandez</p>
                    <p><strong>Teléfono:</strong> 7775091325</p>
                    <p><strong>Dirección:</strong> Priv alta tens.</p>
                    <p><strong>Código postal:</strong> 62482</p>
                    <p><strong>Tel. adicional:</strong> 7770239341</p>
                    <button class="btn btn-warning btn-sm" onclick="showEditForm()">Editar</button>
                </div>
                <div class="edit-form d-flex">
                    <form onsubmit="saveChanges(event)">
                        <div class="form-group">
                            <label for="name">Nombre</label>
                            <input type="text" class="form-control" id="name" value="Enrique de Jesus Hernandez">
                        </div>
                        <div class="form-group">
                            <label for="phone">Teléfono</label>
                            <input type="text" class="form-control" id="phone" value="7775091325">
                        </div>
                        <div class="form-group">
                            <label for="address">Dirección</label>
                            <input type="text" class="form-control" id="address" value="Priv alta tens.">
                        </div>
                        <div class="form-group">
                            <label for="postal-code">Código postal</label>
                            <input type="text" class="form-control" id="postal-code" value="62482">
                        </div>
                        <div class="form-group">
                            <label for="additional-phone">Tel. adicional</label>
                            <input type="text" class="form-control" id="additional-phone" value="7770239341">
                        </div>
                        <button type="submit" class="btn btn-success">Aceptar</button>
                        <button type="button" class="btn btn-danger" onclick="hideEditForm()">Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showEditForm() {
        document.querySelector('.edit-form').style.display = 'flex';
    }

    function hideEditForm() {
        document.querySelector('.edit-form').style.display = 'none';
    }

    function saveChanges(event) {
        event.preventDefault();
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
        const postalCode = document.getElementById('postal-code').value;
        const additionalPhone = document.getElementById('additional-phone').value;

        document.querySelector('.profile-info').innerHTML = `
            <p><strong>Nombre:</strong> ${name}</p>
            <p><strong>Teléfono:</strong> ${phone}</p>
            <p><strong>Dirección:</strong> ${address}</p>
            <p><strong>Código postal:</strong> ${postalCode}</p>
            <p><strong>Tel. adicional:</strong> ${additionalPhone}</p>
            <button class="btn btn-warning btn-sm" onclick="showEditForm()">Editar</button>
        `;
        hideEditForm();
    }
</script>

</body>
</html>
