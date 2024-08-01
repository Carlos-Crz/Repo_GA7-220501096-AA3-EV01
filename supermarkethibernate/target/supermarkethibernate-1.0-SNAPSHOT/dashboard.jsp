<%@page import="com.supermarkethibernate.service.UsuarioService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.supermarkethibernate.model.Usuario"%>
<%
    // Verificar si el usuario está en la sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        // Si no hay usuario en la sesión, redirigir al login
        response.sendRedirect("index.jsp"); // Cambia "index.jsp" por la página de login
        return;
    }
    
    // Obtener el conteo de usuarios
    UsuarioService usuarioService = new UsuarioService();
    long countUsuarios = usuarioService.countUsuarios();
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
    <title>Dashboard</title>
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
                <h1 class="title">Dashboard</h1>
                <h2 class="subtitle">¡ Bienvenido <%= usuario.getNombre() %> <%= usuario.getApellido()%>!</h2>
                <p class="description">
                    Aquí encontrarás atajos para acceder a los diferentes módulos y gestionar el sistema según tus privilegios.
                </p>
            </div>
            <div class="dashboard">
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Clientes_Img.png" alt="Item 1">
                    <h3>Clientes</h3>
                    <p># Clientes registrados</p>
                </div>
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Productos_Img.png" alt="Item 2">
                    <h3>Productos</h3>
                    <p># Productos registrados</p>
                </div>
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Cajas_Img.png" alt="Item 2">
                    <h3>Cajas</h3>
                    <p># Cajas en total</p>
                </div>
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Ventas_Img.png" alt="Item 2">
                    <h3>Ventas</h3>
                    <p># Ventas Realizadas</p>
                </div>
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Proveedores_Img.png" alt="Item 2">
                    <h3>Proveedores</h3>
                    <p># Proveedores en total</p>
                </div>
                <div class="item">
                    <img src="https://rawcdn.githack.com/Carlos-Crz/Repo_Code-Supermarket/56d216c5ce1ce572bc99c2fd85df7bc3b42c732f/Imagenes/Usuarios_Img.png" alt="Item 2">
                    <h3>usuarios</h3>
                    <p><%= countUsuarios %> Usuarios en el sistema</p>
                </div>
            </div>
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

