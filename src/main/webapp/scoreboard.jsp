<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*,com.productos.seguridad.*" %>

<%
    // Consultar solo Top 10 global
    Puntaje puntosBD = new Puntaje();
    List<Puntaje> top10 = puntosBD.top10();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Scoreboard - Portal de Belén</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Iconos -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS NAVIDEÑO -->
    <style>
        body {
            background: linear-gradient(#001f24, #003b44);
            color: white;
        }

        .header-bg {
            background: linear-gradient(#006400, #007f00);
            border-bottom: 4px solid gold;
        }

        .table thead th {
            background: #ffcc00 !important;
            color: #000 !important;
        }

        .top-box {
            border: 3px solid gold;
            border-radius: 12px;
            background: #1d1f20;
        }
    </style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top border-bottom border-danger">
    <div class="container">

        <a class="navbar-brand fw-bold text-light" href="index.jsp">
            <i class="fa-solid fa-star me-2 text-warning"></i>Portal de Belén
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navMenu"><span class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto">

 <li class="nav-item"><a class="nav-link" href="novena.jsp">
                        <i class="fa-solid fa-book-bible me-1"></i>Novena</a></li>

                    <li class="nav-item"><a class="nav-link" href="personajes.jsp">
                        <i class="fa-solid fa-users me-1"></i>Personajes</a></li>

                    <li class="nav-item"><a class="nav-link" href="villancicos.jsp">
                        <i class="fa-solid fa-music me-1"></i>Villancicos</a></li>

                    <li class="nav-item"><a class="nav-link" href="juego.jsp">
                        <i class="fa-solid fa-gamepad me-1"></i>Juego</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">
                     <i class="fa-solid fa-users me-1"></i>Login</a></li>
					<li class="nav-item">
					    <a class="nav-link" href="scoreboard.jsp">
					        <i class="fa-solid fa-trophy me-1"></i>Scoreboard
					    </a>
					</li>

            </ul>
        </div>

    </div>
</nav>

<!-- HEADER -->
<header class="text-center py-5 mb-4 header-bg">
    <h1 class="fw-bold display-5">
        <i class="fa-solid fa-trophy text-warning"></i> Top 10 del Pesebre
    </h1>
    <p class="lead">Los jugadores con los mejores puntajes</p>
</header>

<!-- MAIN CONTENT -->
<div class="container">

    <div class="card bg-dark shadow-lg border-warning top-box">

        <div class="card-header bg-danger text-white text-center">
            <h3 class="fw-bold">
                <i class="fa-solid fa-ranking-star me-2"></i>
                Top 10 Global
            </h3>
        </div>

        <div class="card-body p-4">

            <table class="table table-dark table-striped table-hover text-center">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Jugador</th>
                        <th>Puntaje</th>
                        <th>Fecha</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        int pos = 1;
                        for (Puntaje p : top10) {
                    %>
                    <tr>
                        <td><%= pos++ %></td>
                        <td><%= p.getNombreUsuario() %></td>
                        <td class="fw-bold text-warning"><%= p.getPuntaje() %></td>
                        <td><%= p.getFecha() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <% if (top10.isEmpty()) { %>
                <div class="alert alert-info text-center">
                    <i class="fa-solid fa-circle-info me-2"></i>
                    Aún no hay puntajes registrados.
                </div>
            <% } %>

        </div>
    </div>

</div>

<!-- FOOTER -->
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
