<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*,java.util.*" %>

<%
    HttpSession ses = request.getSession(false);

    if (ses == null || ses.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int perfil = (Integer) ses.getAttribute("perfil");
    if (perfil != 1) {
%>
<h2 class="text-danger text-center mt-5">❌ Acceso denegado</h2>
<% return; }

    Pagina pg = new Pagina();
    String menu = pg.obtenerMenu(perfil);

    Novena nv = new Novena();
    List<Novena> lista = nv.listar();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administrar Novena</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>
    <!-- TU CSS NAVIDEÑO -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">

<!-- 🧭 NAVBAR GENERAL DEL SISTEMA -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold text-light" href="index.jsp">
        <i class="fa-solid fa-star me-2"></i>Portal de Belén
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menuNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <%= menu %>
      </ul>

      <span class="navbar-text text-white me-3">
        <i class="fa-solid fa-user"></i> <%= ses.getAttribute("usuario") %>
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
<main class="container my-4 flex-fill">

<h2 class="fw-bold text-center text-primary mb-4">
    <i class="fa-solid fa-book-bible me-2"></i>Gestión de Novena
</h2>

<div class="text-end mb-3">
    <a href="admin_novena_nuevo.jsp" class="btn btn-success">
        <i class="fa-solid fa-plus"></i> Nuevo Día
    </a>
</div>

<table class="table table-bordered table-striped shadow">
    <thead class="table-dark">
        <tr>
            <th>Día</th>
            <th>Título</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>
        <% for (Novena n : lista) { %>
        <tr>
            <td><%= n.getDia() %></td>
            <td><%= n.getTitulo() %></td>
            <td><%= n.getEstado()==1 ? "Activo" : "Inactivo" %></td>
            <td>
                <a href="admin_novena_editar.jsp?dia=<%=n.getDia()%>" class="btn btn-warning btn-sm">
                    <i class="fa-solid fa-pen"></i> Editar
                </a>

                <% if(n.getEstado()==1) { %>
                    <a href="admin_novena_estado.jsp?dia=<%=n.getDia()%>&estado=2"
                       class="btn btn-danger btn-sm">Desactivar</a>
                <% } else { %>
                    <a href="admin_novena_estado.jsp?dia=<%=n.getDia()%>&estado=1"
                       class="btn btn-success btn-sm">Activar</a>
                <% } %>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

</main>

<!-- FOOTER NAVIDEÑO GENERAL -->
<footer class="bg-dark text-light text-center py-3 mt-auto">
    <ul class="list-unstyled mb-2">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>
    <p>&copy; 2025 Universidad Politecnica Salesiana.</p>
    <p>Email: pproanog@est.ups.edu.ec</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
