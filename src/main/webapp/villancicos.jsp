<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Villancicos Navideños</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS GLOBAL NAVIDAD -->
    <link href="css/style-navidad.css" rel="stylesheet">

    <!-- CSS ESPECÍFICO DE VILLANCICOS -->
    <link href="css/villancicos.css" rel="stylesheet">
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
<header class="header-villancicos text-white text-center py-5 shadow">
    <h1 class="display-5 fw-bold">Villancicos Navideños</h1>
    <p class="lead">Canta, celebra y vive la magia de la Navidad</p>
</header>

<!-- ⭐ MAIN -->
<div class="container my-5">

    <div class="row g-4">

        <%!
            class Cancion {
                String titulo, imagen, audio, letra;
                Cancion(String t, String i, String a, String l) {
                    titulo=t; imagen=i; audio=a; letra=l;
                }
            }
        %>

        <%
            java.util.List<Cancion> lista = new java.util.ArrayList<>();

            // Los Peces en el río
            lista.add(new Cancion(
                "Los peces en el río",
                "imgs/villancicos/pecesrio.png",
                "audios/pecesenelrio.mp3",
                "La Virgen se está peinando entre cortina y cortina.<br>" +
                "Los cabellos son de oro y el peine de plata fina.<br><br>" +

                "Pero mira cómo beben los peces en el río,<br>" +
                "pero mira cómo beben por ver al Dios nacido.<br>" +
                "Beben y beben y vuelven a beber,<br>" +
                "los peces en el río por ver a Dios nacer.<br><br>" +

                "La Virgen está lavando y tendiendo en el romero.<br>" +
                "Los pajaritos cantando y el romero floreciendo.<br>"
            ));

            // Campana sobre campana
            lista.add(new Cancion(
                "Campana sobre campana",
                "imgs/villancicos/campana.png",
                "audios/campana.mp3",
                "Campana sobre campana,<br>" +
                "y sobre campana una...<br><br>" +
                "Belén, campanas de Belén,<br>" +
                "que los ángeles tocan,<br>" +
                "¿qué nueva me traéis?<br><br>" +
                "Campana sobre campana,<br>" +
                "y sobre campana dos...<br>" +
                "Asómate a esa ventana,<br>" +
                "porque ha nacido Dios.<br>"
            ));

            // Burrito sabanero
            lista.add(new Cancion(
                "Mi Burrito Sabanero",
                "imgs/villancicos/burritosabanero.png",
                "audios/burritosabanero.mp3",
                "Con mi burrito sabanero voy camino de Belén.<br>" +
                "Si me ven, si me ven, voy camino de Belén.<br><br>" +
                "El lucerito mañanero ilumina mi sendero,<br>" +
                "con mi cuatrico voy cantando,<br>" +
                "mi burrito va trotando.<br>"
            ));
        %>

        <% for(Cancion v : lista) { %>

        <div class="col-md-6 col-lg-4">
            <div class="villan-card shadow p-3">

                <img src="<%=v.imagen%>" class="villan-img mb-3" alt="<%=v.titulo%>">

                <h4 class="villan-title text-center"><%=v.titulo%></h4>

                <audio controls class="w-100 mt-3">
                    <source src="<%=v.audio%>" type="audio/mpeg">
                </audio>

                <h6 class="mt-3">Letra:</h6>
                <div class="villan-letra">
                    <%= v.letra %>
                </div>

            </div>
        </div>

        <% } %>

    </div>

</div>

<!-- ⭐ FOOTER -->
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
     ❄ SCRIPT DE NIEVE (Integrado)
=========================================================== -->
<script>
function createSnowflake(){
    const s = document.createElement("div");
    s.classList.add("snowflake");
    s.textContent = "❄";

    s.style.left = Math.random() * 100 + "vw";
    s.style.fontSize = (Math.random() * 10 + 10) + "px";
    s.style.animationDuration = (Math.random() * 5 + 3) + "s";

    document.body.appendChild(s);
    setTimeout(() => s.remove(), 8000);
}
setInterval(createSnowflake, 250);
</script>

<style>
.snowflake {
    position: fixed;
    top: -10px;
    color: white;
    pointer-events: none;
    animation-name: fall;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    z-index: 9999;
}

@keyframes fall {
    to { transform: translateY(110vh) rotate(360deg); }
}
</style>


<!-- ===========================================================
     ♿ ACCESIBILIDAD (integrado)
=========================================================== -->
<script>
let fontBase = 100;

document.getElementById("increaseFont").onclick = () => {
    fontBase += 10;
    if (fontBase > 200) fontBase = 200;
    document.documentElement.style.fontSize = fontBase + "%";
};

document.getElementById("decreaseFont").onclick = () => {
    fontBase -= 10;
    if (fontBase < 60) fontBase = 60;
    document.documentElement.style.fontSize = fontBase + "%";
};

document.getElementById("contrastBtn").onclick = () => {
    document.body.classList.toggle("high-contrast");
};
</script>

<!-- NAVBAR RESPONSIVE -->
<script>
document.querySelector(".navbar-toggle").addEventListener("click", () => {
    document.querySelector(".navbar-list").classList.toggle("active");
});
</script>

</body>
</html>
