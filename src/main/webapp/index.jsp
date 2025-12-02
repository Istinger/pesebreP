<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal de Belén - Inicio</title>

    <!-- BOOTSTRAP CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- ESTILOS -->
    <link href="css/index.css" rel="stylesheet">

    <!-- MODEL VIEWER -->
    <script type="module" 
            src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js">
    </script>
</head>

<body>

<!-- ===========================================================
   🔧 BARRA DE ACCESIBILIDAD
=========================================================== -->
<div class="accessibility-bar">
    <button id="increaseFont" class="access-btn" aria-label="Aumentar tamaño de texto">A+</button>
    <button id="decreaseFont" class="access-btn" aria-label="Disminuir tamaño de texto">A-</button>
    <button id="contrastBtn" class="access-btn" aria-label="Modo alto contraste">Contraste</button>
</div>

<!-- ===========================================================
   ⭐ HEADER
=========================================================== -->
<header class="header" role="banner">
    <h1>¡Bienvenido al Portal de Belén!</h1>
    <p>Adornemos juntos el nacimiento de Jesús</p>
</header>

<!-- ===========================================================
   ⭐ NAVBAR SUPERIOR (REEMPLAZA EL SIDEBAR)
=========================================================== -->
<nav class="navbar-custom" role="navigation" aria-label="Menú principal">
    <ul class="navbar-list">
        <li><a href="novena.jsp"><i class="fa-solid fa-book-bible"></i> Novena</a></li>
        <li><a href="personajes.jsp"><i class="fa-solid fa-users"></i> Personajes</a></li>
        <li><a href="villancicos.jsp"><i class="fa-solid fa-music"></i> Villancicos</a></li>
        <li><a href="juego.jsp"><i class="fa-solid fa-gamepad"></i> Juegos</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-user"></i> Login</a></li>
    </ul>
</nav>

<!-- ===========================================================
   ⭐ TARJETA CENTRAL (VIDEO CENTRADO)
=========================================================== -->
<section class="card-central">
    <h2 class="card-title">★ Portal de Belén ★</h2>

    <div class="tarjeta-video">
        <div class="iframe-container">
            <iframe 
                src="https://www.youtube.com/embed/I67ARqpk22c?si=0EBJzZyY-ih5TULa"
                title="Video introductorio del Portal de Belén"
                aria-label="Video introductorio del Portal de Belén"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
            </iframe>
        </div>
    </div>
</section>

<!-- ===========================================================
   ⭐ GRID DE SECCIONES
=========================================================== -->
<div class="container my-4">
    <div class="row g-4 justify-content-center">

        <!-- Novena -->
        <div class="col-md-3">
            <div class="card shadow border-0 menu-card">
                <model-viewer 
                    src="model3D/biblia.glb"
                    alt="Modelo 3D de una Biblia"
                    aria-label="Modelo 3D Biblia"
                    camera-controls auto-rotate shadow-intensity="1"
                    style="width: 100%; height: 250px; background: #fff; border-radius: 10px;">
                </model-viewer>

                <div class="card-body text-center">
                    <a href="novena.jsp" class="fw-bold card-link">Novena</a>
                </div>
            </div>
        </div>

        <!-- Personajes -->
        <div class="col-md-3">
            <div class="card shadow border-0 menu-card">
                <model-viewer 
                    src="model3D/personajes.glb"
                    alt="Personajes en 3D del portal"
                    aria-label="Personajes 3D"
                    camera-controls auto-rotate shadow-intensity="1"
                    style="width: 100%; height: 250px; background: #fff; border-radius: 10px;">
                </model-viewer>

                <div class="card-body text-center">
                    <a href="personajes.jsp" class="fw-bold card-link">Personajes</a>
                </div>
            </div>
        </div>

        <!-- Villancicos -->
        <div class="col-md-3">
            <div class="card shadow border-0 menu-card">
                <model-viewer 
                    src="model3D/villancicos.glb"
                    alt="Personas cantando villancicos en 3D"
                    aria-label="Villancicos 3D"
                    camera-controls auto-rotate shadow-intensity="1"
                    style="width: 100%; height: 250px; background: #fff; border-radius: 10px;">
                </model-viewer>

                <div class="card-body text-center">
                    <a href="villancicos.jsp" class="fw-bold card-link">Villancicos</a>
                </div>
            </div>
        </div>

        <!-- Juego -->
        <div class="col-md-3">
            <div class="card shadow border-0 menu-card">
                <model-viewer 
                    src="model3D/juego.glb"
                    alt="Juego en una tableta 3D"
                    aria-label="Juego 3D"
                    camera-controls auto-rotate shadow-intensity="1"
                    style="width: 100%; height: 250px; background: #fff; border-radius: 10px;">
                </model-viewer>

                <div class="card-body text-center">
                    <a href="juego.jsp" class="fw-bold card-link">Juego</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- ===========================================================
   ⭐ FOOTER
=========================================================== -->
<footer class="footer-dorado" role="contentinfo">
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


<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
