<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.seguridad.Personaje, java.util.*" %>

<%
    List<Personaje> lista = new Personaje().listarActivos();
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personajes del Pesebre</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- MODEL VIEWER -->
    <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>

    <!-- CSS NAVIDAD GLOBAL -->
    <link href="css/style-navidad.css" rel="stylesheet">
</head>

<body>

<!-- ♿ ACCESIBILIDAD -->
<div class="accessibility-bar">
    <button id="increaseFont" class="access-btn">A+</button>
    <button id="decreaseFont" class="access-btn">A-</button>
    <button id="contrastBtn" class="access-btn">Contraste</button>
</div>

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


<!-- 🎄 HEADER -->
<header class="header-novena" style="background: linear-gradient(#715800,#5B4700);">
    <h1>Personajes del Pesebre</h1>
    <p>Conoce a cada protagonista del nacimiento</p>
</header>

<!-- 🌟 CONTENIDO PRINCIPAL -->
<main class="container my-5">

    <div class="row g-4">

        <!-- PERSONAJES DINÁMICOS -->
        <section class="col-lg-8">
            <div class="row g-4">

                <% for (Personaje p : lista) { %>

                <div class="col-md-6">
                    <div class="card card-navidad shadow border-0">

                        <img src="imgs/personajes/<%= p.getImagen() %>" class="card-img-top rounded">

                        <div class="card-body text-center">
                            <h5 class="fw-bold" style="color:#715800;"><%= p.getNombre() %></h5>
                            <p class="text-muted"><%= p.getDescripcion() %></p>
                        </div>

                    </div>
                </div>

                <% } %>

                <% if(lista.isEmpty()) { %>
                    <p class="text-center text-danger fw-bold">No hay personajes activos.</p>
                <% } %>

            </div>
        </section>

        <!-- ASIDE -->
        <aside class="col-lg-4">

            <div class="card card-navidad shadow mb-4">
                <h5 class="fw-bold mb-2"><i class="fa-solid fa-crown me-2"></i>Curiosidad</h5>
                <p>Cada personaje representa una virtud dentro del nacimiento de Jesús.</p>
            </div>

            <div class="alert alert-warning text-center shadow">
                <i class="fa-solid fa-star me-2"></i>Una historia llena de fe y amor
            </div>

        </aside>

    </div>

</main>

<!-- 🌟 FOOTER -->
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


</body>
</html>
