<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.supermarkethibernate.model.Usuario"%>
<%@page import="com.supermarkethibernate.service.UsuarioService"%>

<%
    // Verificar si el usuario está autenticado
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Obtener el ID del usuario en sesión
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
    if (usuarioSesion == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    int idUsuarioSesion = usuarioSesion.getId();

    // Manejo de la acción de eliminar
    String action = request.getParameter("action");
    if ("delete".equals(action)) {
        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioService usuarioService = new UsuarioService();
        usuarioService.eliminarUsuario(id);
        response.sendRedirect("gestion_usuarios.jsp");
        return;
    }
    
    // Obtener la lista de usuarios
    UsuarioService usuarioService = new UsuarioService();
    List<Usuario> usuarios = usuarioService.getAllUsuarios();
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
    <title>Gestión de Usuarios</title>
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
                <h1 class="title">Gestión de Usuarios</h1>
                <p class="description">
                    En este módulo usted puede registrar nuevos Usuarios en el sistema, actualizar la información de los usuarios existentes y eliminar usuarios si es necesario
                </p>
            </div>
            <button class="button" onclick="window.location.href='crear_usuario.jsp'" type="button">Nuevo Usuario</button>
            
            <table class="style__table">
                <thead>
                    <tr>
                        <th>ID Usuarios</th>
                        <th>Documento</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Nombre usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (Usuario u : usuarios) { %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getNdocumento() %></td>
                        <td><%= u.getNombre() %></td>
                        <td><%= u.getApellido() %></td>
                        <td><%= u.getNombreUsuario() %></td>
                        
                        <td>
                            <a href="ver_usuario.jsp?id=<%= u.getId() %>"><span class="material-symbols-outlined view">visibility</span>
                            </a>
                            <a href="editar_usuario.jsp?id=<%= u.getId() %>"><span class="material-symbols-outlined edit">edit</span></a>
                            <% if (u.getId() != idUsuarioSesion) { %>
                            <a href="gestion_usuarios.jsp?action=delete&id=<%= u.getId() %>" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');"><span class="material-symbols-outlined delet">delete</span></a>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
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
