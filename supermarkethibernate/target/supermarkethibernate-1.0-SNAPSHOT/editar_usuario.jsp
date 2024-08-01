<%@ page import="com.supermarkethibernate.service.UsuarioService" %>
<%@ page import="com.supermarkethibernate.model.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Verificar si el usuario está en la sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        // Si no hay usuario en la sesión, redirigir al login
        response.sendRedirect("index.jsp"); // Cambia "index.jsp" por la página de login
        return;
    }
    
    // Obtener el ID del usuario que se va a editar
    int id = Integer.parseInt(request.getParameter("id"));
    UsuarioService usuarioService = new UsuarioService();
    usuario = usuarioService.obtenerUsuarioPorId(id);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String ndocumento = request.getParameter("ndocumento");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nombreUsuario = request.getParameter("nombre_usuario");
        String contrasenia = request.getParameter("contrasenia");

        usuarioService.actualizarUsuario(id, ndocumento, nombre, apellido, nombreUsuario, contrasenia);
        response.sendRedirect("gestion_usuarios.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/7d11893b05e7978a38cfa19edb448502f80f48ec/CSS/styleguide.css">
    <link rel="stylesheet" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/1e24c24f0e12729f4d1cfabeb4164a44280ea17b/CSS/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="shortcut icon" href="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Icon.png" type="image/x-icon">
    <title>Gestión de Usuarios - Editar </title>
</head>
<body>
    <!-- HEADER --> 
    <header class="Header">
        <div class="Header__menu" onclick="toggleSidebar()">
            <span class="material-symbols-outlined" >menu</span>
        </div>
        <div class="Header__slidebar">
            <img class="img" src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Logotipo.svg" alt="Logotipo"/>
            <span class="material-symbols-outlined">account_circle</span>
        </div>
    </header>
    <!-- END HEADER  -->
    
    <div class="main-container">

        <!-- SLIDEBAR -->
        <aside class="slidebar">
            <nav class="slidebar__nav">
            <ul>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        home
                    </span>
                    <a href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        category
                    </span>
                    <a href="">Gestión de categorías</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        inventory_2
                    </span>
                    <a href="">Gestión de productos</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        credit_card
                    </span>
                    <a href="">Gestión de cajas</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        local_shipping
                    </span>
                    <a href="">Gestión de proveedores</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        supervisor_account
                    </span>
                    <a href="">Gestión de clientes</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        payments
                    </span>
                    <a href="">Gestión de ventas</a>
                </li>
                <li class="slidebar__item">
                    <span class="material-symbols-outlined">
                        account_circle
                    </span>
                    <a href="gestion_usuarios.jsp">Gestión de usuarios</a>
                </li>
            </ul>
            </nav>
            <div class="sidebar_colp">
                <ul>
                    <li>
                        <span class="material-symbols-outlined">logout</span>
                        <a href="logout">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </aside>
        <!-- END SLIDEBAR -->
        
        <!-- CONTENIDO -->
        <main class="conteiner">
            <div class="title-description">
                <h1 class="title">Editar Usuario</h1>
            </div>
            
            <form class="inputs"  method="post">
                <h3>Información del Usuario</h3>
                <div>
                    <label class="inputs_label" for="Ndoc">Número de documento</label>
                    <input id="Ndoc" class="inputs_input" type="text" name="ndocumento" value="<%= usuario.getNdocumento() %>" required>
                </div>
                <div>
                    <label class="inputs_label" for="nom">Nombre</label>
                    <input id="nom" class="inputs_input" type="text" name="nombre" value="<%= usuario.getNombre() %>" required>
                </div>
                <div>
                    <label class="inputs_label" for="Ape">Apellidos</label>
                    <input id="Ape" class="inputs_input" type="text" name="apellido" value="<%= usuario.getApellido() %>" required>
                </div>
                <div>
                    <label class="inputs_label" for="Nuser">Nombre de usuario</label>
                    <input id="Nuser" class="inputs_input" type="text" name="nombre_usuario" value="<%= usuario.getNombreUsuario() %>" required>
                </div>
                <div>
                    <label class="inputs_label" for="pass">Contraseña</label>
                    <input id="pass" class="inputs_input" type="text" name="contrasenia" value="<%= usuario.getContrasenia() %>" required>
                </div>
                <div class="button-container">
                    <button class="Nbutton Can" onclick="window.location.href='gestion_usuarios.jsp'" type="button">Cancelar</button>
                    <button class="Nbutton" type="submit">Actualizar Usuario</button> 
                </div>
            </form>                 
        </main>
        <!-- END CONTENIDO --> 
        
    </div>
    
    <script>
        function toggleSidebar() {
            document.querySelector('.slidebar').classList.toggle('active');
            document.querySelector('.conteiner').classList.toggle('expanded');
        }
        document.querySelectorAll('li').forEach(function(li) {
            li.addEventListener('click', function() {
                const a = li.querySelector('a');
                if (a) {
                    window.location.href = a.href;
                }
            });
        });
    </script>
</body>
</html>