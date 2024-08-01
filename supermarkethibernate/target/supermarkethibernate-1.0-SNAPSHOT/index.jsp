<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/04063f494823a589107a1c9bc3388b4914e0c5e7/CSS/stylelogin.css">
    <link rel="stylesheet" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/7d11893b05e7978a38cfa19edb448502f80f48ec/CSS/styleguide.css">
    <link rel="shortcut icon" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Icon.png" type="image/x-icon">
    <title>Login</title>
    
</head>
<body>
    <section>
        <form class="formulario" action="login" method="post">
            <h1>Inicia Sesión</h1>
            <!-- Mensaje de error si los datos de ingreso son incorrectos -->
                <% if (request.getParameter("error") != null) { %>
                <div class="error-message">
                    <p>Nombre de usuario o contraseña incorrectos. Inténtalo de nuevo.</p>
                </div>
                <% } %>
            <div class="hola">
                <label class="formulario_label" for="nombre-usuario">Nombre de usuario</label>
                <input id="nombre-usuario" class="formulario_input" name="nombre-usuario" type="text" placeholder="Ingresa tu nombre de usuario" required>
            </div>
            <div>
                <label class="formulario_label" for="contrasenia">Contraseña</label>
                <input id="contrasenia" class="formulario_input" name="contrasenia" type="password" placeholder="Ingresa tu contraseña" required>
            </div>

            <div class="button">
                <input type="checkbox" id="btn-switch">
                <label class="lbl-switch" for="btn-switch"></label>
                <label for="" class="label">Recuerdame</label>
            </div>
            

            <input class="formulario_button" type="submit" value="Iniciar Sesión">
        </form>
    </section>
</body>
</html>

