<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.productos.seguridad.*" %>

<%
    // VALIDAR SESIÓN
    HttpSession ses = request.getSession(false);
    if (ses == null || ses.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idUsuario = (Integer) ses.getAttribute("id_us");
    int perfil = (Integer) ses.getAttribute("perfil");
    String usuario = (String) ses.getAttribute("usuario");

    // MENÚ DINÁMICO
    Pagina pg = new Pagina();
    String menu = pg.obtenerMenu(perfil);

    // CARGAR MIS PUNTAJES
    Puntaje puntosBD = new Puntaje();
    List<Puntaje> misPuntajes = puntosBD.puntajesDeUsuario(idUsuario);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Puntajes - Portal de Belén</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Iconos -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- TEMA NAVIDEÑO -->
    <style>
        body {
            background: #0b0f11;
            color: white;
        }

        .header-bg {
            background: linear-gradient(#006000, #009000);
            border-bottom: 4px solid gold;
        }

        .panel-box {
            background: #1c1f21;
            border: 3px solid gold;
            border-radius: 12px;
        }

        .table thead th {
            background: gold !important;
            color: black !important;
        }
    </style>
</head>

<body class="d-flex flex-column min-vh-100">

<!-- NAVBAR IGUAL QUE menu.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold text-light" href="index.jsp">
        <i class="fa-solid fa-star me-2 text-warning"></i>Portal de Belén
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menuNav">

      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <%= menu %>
      </ul>

      <span class="navbar-text text-white me-3">
        <i class="fa-solid fa-user me-1"></i> <%= usuario %>
      </span>

      <form action="cerrarSesion.jsp" method="post">
          <button class="btn btn-outline-light btn-sm">
              <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
          </button>
      </form>

    </div>
  </div>
</nav>

<!-- HEADER -->
<header class="text-center py-5 mb-4 header-bg">
    <h1 class="fw-bold display-5">
        <i class="fa-solid fa-trophy text-warning"></i> Mis Puntajes
    </h1>
    <p class="lead">Historial del jugador 
        <span class="fw-bold text-warning"><%= usuario %></span>
    </p>
</header>

<!-- MAIN -->
<main class="container flex-fill">

    <div class="card shadow-lg panel-box">

        <div class="card-header bg-warning text-dark text-center">
            <h3 class="fw-bold">
                <i class="fa-solid fa-list-ol me-2"></i>
                Historial de Puntajes
            </h3>
        </div>

        <div class="card-body p-4">

            <table class="table table-dark table-striped table-hover text-center">
                <thead>
                    <tr>
                        <th>Puntaje</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Puntaje p : misPuntajes) { %>
                        <tr>
                            <td class="fw-bold text-warning"><%= p.getPuntaje() %></td>
                            <td><%= p.getFecha() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <% if (misPuntajes.isEmpty()) { %>
                <div class="alert alert-info text-center">
                    <i class="fa-solid fa-info-circle me-1"></i>
                    Todavía no tienes puntajes registrados. ¡Juega para guardar tu primera puntuación!
                </div>
            <% } %>

        </div>
    </div>

</main>

<!-- FOOTER IGUAL A menu.jsp -->
<footer class="bg-dark text-light text-center py-3 mt-5">
    <ul class="list-unstyled mb-2">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>
    <p>&copy; 2025 Universidad Politecnica Salesiana.</p>
    <p>Email: pproanog@est.ups.edu.ec</p>
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
