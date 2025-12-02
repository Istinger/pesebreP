<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.productos.seguridad.*" %>

<%
    HttpSession s = request.getSession(false);

    if (s == null || s.getAttribute("usuario") == null || s.getAttribute("perfil") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int perfil = (Integer) s.getAttribute("perfil");

    if (perfil != 1) {
%>
<h2 class="text-danger text-center mt-5">❌ Acceso denegado</h2>
<% 
        return;
    }

    // Obtener menú dinámico
    Pagina pg = new Pagina();
    String menu = pg.obtenerMenu(perfil);

    // Obtener lista de personajes
    Personaje p = new Personaje();
    ResultSet rs = p.consultarTodos();

    String usuario = (String) s.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Personajes</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- TU TEMA NAVIDEÑO -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">

<!-- 🧭 NAVBAR DEL SISTEMA -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">

    <a class="navbar-brand fw-bold text-light" href="index.jsp">
        <i class="fa-solid fa-star me-2 text-warning"></i>Portal de Belén
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#menuNav"><span class="navbar-toggler-icon"></span></button>

    <div class="collapse navbar-collapse" id="menuNav">
        <!-- MENÚ DINÁMICO -->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <%= menu %>
        </ul>

        <span class="navbar-text text-white me-3">
            <i class="fa-solid fa-user"></i> <%= usuario %>
        </span>

        <form action="cerrarSesion.jsp" method="post">
            <button class="btn btn-outline-light btn-sm">
                <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
            </button>
        </form>
    </div>

  </div>
</nav>

<!-- CONTENIDO -->
<main class="container mt-4 flex-fill">

    <h2 class="text-center mb-4 fw-bold text-primary">
        <i class="fa-solid fa-users me-2"></i>Gestión de Personajes
    </h2>

    <a href="admin_personajes_nuevo.jsp" class="btn btn-success mb-3">
        <i class="fa-solid fa-plus"></i> Nuevo Personaje
    </a>

    <table class="table table-bordered table-striped shadow">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Imagen</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>

        <tbody>
        <% if (rs != null) {
            while (rs.next()) { %>

            <tr>
                <td><%= rs.getInt("id_perse") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td>
                    <img src="imgs/personajes/<%= rs.getString("imagen") %>" width="70" class="rounded shadow-sm">
                </td>
                <td><%= (rs.getInt("estado") == 1 ? "Activo" : "Inactivo") %></td>

                <td>
                    <a href="admin_personajes_editar.jsp?id=<%= rs.getInt("id_perse") %>"
                       class="btn btn-warning btn-sm">
                       <i class="fa-solid fa-pen"></i> Editar
                    </a>

                    <% if (rs.getInt("estado") == 1) { %>
                        <a href="admin_personajes_estado.jsp?id=<%= rs.getInt("id_perse") %>&estado=0"
                           class="btn btn-danger btn-sm">
                           <i class="fa-solid fa-ban"></i> Desactivar
                        </a>
                    <% } else { %>
                        <a href="admin_personajes_estado.jsp?id=<%= rs.getInt("id_perse") %>&estado=1"
                           class="btn btn-success btn-sm">
                           <i class="fa-solid fa-check"></i> Activar
                        </a>
                    <% } %>

                </td>
            </tr>

        <% }} %>
        </tbody>
    </table>

</main>

<!-- FOOTER UNIFICADO -->
<footer class="bg-dark text-light text-center py-3 mt-auto">
    <ul class="list-unstyled mb-2">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>

    <p>&copy; 2025 Universidad Politecnica Salesiana.</p>
    <p>Email: pproanog@est.ups.edu.ec</p>
</footer>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
