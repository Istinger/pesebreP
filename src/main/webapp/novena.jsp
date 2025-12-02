<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novena de Navidad</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS NAVIDEÑO -->
    <link href="css/style-navidad.css" rel="stylesheet">
</head>

<body>

<!-- ===========================================================
    ♿ BARRA DE ACCESIBILIDAD
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
    🎄 HEADER
=========================================================== -->
<header class="header-novena">
    <h1>Novena de Navidad</h1>
    <p>Ora y prepara tu corazón para el nacimiento de Jesús</p>
</header>

<!-- ===========================================================
    🕯 CONTENIDO PRINCIPAL
=========================================================== -->
<main class="container my-5">

    <div class="row g-4">

        <!-- LISTA DE DÍAS -->
        <section class="col-lg-8">

            <div class="row g-4">

                <% for(int i = 1; i <= 9; i++) { %>
                    <div class="col-md-6">
                        <div class="card card-navidad card-dia shadow">

                            <img src="imgs/novena/dia<%=i%>.png" class="card-img-top" alt="Día <%=i%>">

                            <div class="card-body text-center">
                                <h5>Día <%=i%></h5>
                                <a href="novena_dia.jsp?dia=<%=i%>" 
                                   class="btn btn-danger w-100">Leer</a>
                            </div>

                        </div>
                    </div>
                <% } %>

            </div>

        </section>

        <!-- ASIDE -->
        <aside class="col-lg-4">

            <div class="card card-navidad shadow mb-4">
                <h5 class="fw-bold mb-2"><i class="fa-solid fa-book-bible me-2"></i>Significado</h5>
                <p>
                    La novena es una tradición que prepara nuestros corazones 
                    para la llegada de Jesús, recordando su amor y su humildad.
                </p>
            </div>

            <div class="alert alert-info text-center shadow">
                <i class="fa-solid fa-bell me-2"></i>¡Feliz Novena!
            </div>

        </aside>

    </div>

</main>

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

<!-- ===========================================================
    JS ACCESIBILIDAD
=========================================================== -->
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
