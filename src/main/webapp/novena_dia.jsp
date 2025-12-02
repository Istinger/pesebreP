<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.productos.seguridad.* " %>
<%
    String parameter = request.getParameter("dia");
    int dia = 0;

    try { dia = Integer.parseInt(parameter); }
    catch(Exception e){ dia = 0; }

    Novena n = new Novena().obtenerPorDia(dia);
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novena - Día <%= dia %></title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS NAVIDEÑO -->
    <link href="css/style-navidad.css" rel="stylesheet">
</head>

<body>

<!-- ===========================================================
    ♿ ACCESIBILIDAD
=========================================================== -->
<div class="accessibility-bar">
    <button id="increaseFont" class="access-btn">A+</button>
    <button id="decreaseFont" class="access-btn">A-</button>
    <button id="contrastBtn" class="access-btn">Contraste</button>
</div>

<!-- ===========================================================
    ⭐ NAVBAR
=========================================================== -->
<!-- ⭐ NAVBAR UNIVERSAL RESPONSIVE -->
<nav class="navbar-custom">

    <div class="navbar-logo">
        <a href="index.jsp">
            <i class="fa-solid fa-star"></i> Portal de Belén
        </a>
    </div>

    <button class="navbar-toggle" aria-label="Abrir menú">
        <i class="fa-solid fa-bars"></i>
    </button>

    <ul class="navbar-list">
        <li><a href="novena.jsp"><i class="fa-solid fa-book-bible"></i> Novena</a></li>
        <li><a href="personajes.jsp"><i class="fa-solid fa-users"></i> Personajes</a></li>
        <li><a href="villancicos.jsp"><i class="fa-solid fa-music"></i> Villancicos</a></li>
        <li><a href="juego.jsp"><i class="fa-solid fa-gamepad"></i> Juego</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-user"></i> Login</a></li>
        <li><a href="scoreboard.jsp"><i class="fa-solid fa-trophy"></i> Scoreboard</a></li>
    </ul>
</nav>

<!-- ===========================================================
    ⭐ HEADER NAVIDEÑO
=========================================================== -->
<header class="header-novena">
    <h1>Día <%= dia %> de la Novena</h1>
    <p>Momento especial de oración</p>
</header>

<!-- ===========================================================
    🕯 CONTENIDO DEL DÍA
=========================================================== -->
<div class="container mt-4">

    <% if (n == null) { %>

        <div class="alert alert-danger text-center">
            Día no encontrado.
        </div>

    <% } else { %>

        <div class="card card-navidad p-4 shadow-lg">

            <img src="imgs/<%= n.getImagen() %>" class="img-fluid rounded mb-3">

            <h2 class="text-center fw-bold"><%= n.getTitulo() %></h2>

            <p style="white-space: pre-line; font-size: 1.2rem;">
                <%= n.getContenido() %>
            </p>

            <div class="text-center mt-4">
                <a class="btn btn-danger" href="novena.jsp">Volver</a>
            </div>

        </div>

    <% } %>

</div>

<!-- ===========================================================
    ⭐ FOOTER
=========================================================== -->
<footer class="footer-navidad">
    <ul class="list-unstyled mb-2">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>
    <p>&copy; 2025 Universidad Politecnica Salesiana.</p>
    <p>Email: pproanog@est.ups.edu.ec</p>
</footer>

<script>
/* 🔠 ACCESIBILIDAD REAL GLOBAL */
let fontBase = 100; // porcentaje base

document.getElementById("increaseFont").onclick = () => {
    fontBase += 10;
    if (fontBase > 200) fontBase = 200; // límite recomendado accesible
    document.documentElement.style.fontSize = fontBase + "%";
}

document.getElementById("decreaseFont").onclick = () => {
    fontBase -= 10;
    if (fontBase < 60) fontBase = 60; // límite mínimo accesible
    document.documentElement.style.fontSize = fontBase + "%";
}

document.getElementById("contrastBtn").onclick = () => {
    document.body.classList.toggle("high-contrast");
}
</script>


<script>
document.querySelector(".navbar-toggle").addEventListener("click", () => {
    document.querySelector(".navbar-list").classList.toggle("active");
});
</script>


<!-- BOOTSTRAP -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
