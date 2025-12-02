<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*,java.util.*" %>

<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Debe iniciar sesión para acceder al sistema."/>
</jsp:forward>
<%
        return;
    }

    String usuario = (String) sesion.getAttribute("usuario");
    Integer perfil = (Integer) session.getAttribute("perfil");
   

    // Fecha de creación de sesión (hora de login)
    Date fechaLogin = new Date(sesion.getCreationTime());
    String fechaFormateada = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(fechaLogin);
    

    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfil);

%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú del Sistema</title>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>
    <!-- ESTILOS PROPIOS -->
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body class="d-flex flex-column min-vh-100">

<!-- 🧭 NAVBAR -->
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
    <%
        // Normalizar el menú para hacerlo responsive
        String menuHtml = menu;

        // Asegurar <li> con nav-item
        menuHtml = menuHtml.replace("<li", "<li class='nav-item'");

        // Asegurar <a> con nav-link
        menuHtml = menuHtml.replace("<a", "<a class='nav-link text-white'");

        out.print(menuHtml);
    %>
</ul>


      <span class="navbar-text text-white me-3">
        <i class="fa-solid fa-user me-1"></i> <%= usuario %>
      </span>

      <form class="d-inline" action="cerrarSesion.jsp" method="post">
        <button class="btn btn-outline-light btn-sm">
          <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
        </button>
      </form>
    </div>
  </div>
</nav>

<!-- CONTENIDO PRINCIPAL -->
<main class="container my-5 flex-fill">
    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary">Bienvenido: <%= usuario %></h2>
        <p class="text-muted">
            <i class="fa-solid fa-calendar-days me-2"></i>Inicio de sesión: <%= fechaFormateada %>
        </p>
    </div>
</main>

<!-- FOOTER -->
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
