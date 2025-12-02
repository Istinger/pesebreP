<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*,java.sql.*,java.util.*"%>

<%
    // ============================
    // VERIFICAR SESIÓN
    // ============================
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Debe iniciar sesión para acceder al sistema."/>
</jsp:forward>
<%
        return;
    }

    // ============================
    // VERIFICAR PERFIL ADMIN
    // ============================
    Integer perfil = (Integer) sesion.getAttribute("perfil");
    if (perfil != 1) {
%>
    <h2 class="text-danger text-center mt-5">⚠ Acceso denegado</h2>
<%
        return;
    }

    String usuario = (String) sesion.getAttribute("usuario");

    // ============================
    // OBTENER MENÚ DINÁMICO
    // ============================
    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfil);

    // ============================
    // CONSULTAR BITÁCORA
    // ============================
    Bitacora b = new Bitacora();
    String tablaBitacora = b.consultarBitacora();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bitácora del Sistema</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>
</head>

<body class="bg-light">

    <!-- ===================== NAVBAR DINÁMICO ===================== -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">

    <a class="navbar-brand fw-bold text-light" href="menu.jsp">
        <i class="fa-solid fa-star me-2"></i>Portal de Belén
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menuNav">

      <!-- MENU DINÁMICO CARGADO DESDE LA BASE -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <%= menu %>
      </ul>

      <span class="navbar-text text-white me-3">
        <i class="fa-solid fa-user-gear me-1"></i> <%= usuario %>
      </span>

      <!-- Logout -->
      <form action="cerrarSesion.jsp" method="post">
        <button class="btn btn-outline-light btn-sm">
          <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
        </button>
      </form>
    </div>

  </div>
</nav>


<!-- ===================== CONTENIDO ===================== -->
<div class="container mt-4">

    <h2 class="text-center fw-bold text-primary mb-4">
        <i class="fa-solid fa-book me-2"></i> Bitácora del Sistema
    </h2>

    <%= tablaBitacora %>  <!-- TABLA DINÁMICA -->
</div>


<!-- ===================== FOOTER ===================== -->
<footer class="bg-dark text-light text-center py-3 mt-5">
    <ul class="list-unstyled mb-2">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>
    <p>&copy; 2025 Universidad Politécnica Salesiana</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
