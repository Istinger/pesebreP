<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Juego - Arma el Pesebre</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS DEL JUEGO -->
    <link rel="stylesheet" href="css/juego.css">
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top">
    <div class="container">

        <a class="navbar-brand fw-bold text-light" href="index.jsp">
            <i class="fa-solid fa-star me-2"></i>Portal de Belén
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#menuNav"><span class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="menuNav">
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
<header class="text-white text-center py-5 shadow"
    style="background: linear-gradient(#004400, #006600);">
    <div class="container">
        <h1 class="display-5 fw-bold">Arma el Pesebre</h1>
        <p class="lead">Arrastra las piezas correctas y evita las trampas</p>
    </div>
</header>

<!-- JSP LISTA DE PIEZAS -->
<%
class Pieza {
    String img;
    boolean correcta;
    Pieza(String i, boolean c) { img = i; correcta = c; }
}

Pieza[] piezas = {
    new Pieza("jesus.png", true),
    new Pieza("maria.png", true),
    new Pieza("jose.png", true),
    new Pieza("angel.png", true),
    new Pieza("pastores.png", true),
    new Pieza("melchor.png", true),
    new Pieza("gaspar.png", true),
    new Pieza("baltasar.png", true),

    // ❌ TRAMPAS
    new Pieza("santa.png", false),
    new Pieza("arbol.png", false),
    new Pieza("regalo.png", false),
    new Pieza("reno.png", false),
    new Pieza("nutcracker.png", false)
};

int totalCorrectas = 8;
%>

<!-- MAIN -->
<main class="container my-5">

    <div class="d-flex justify-content-between mb-3">
        <div class="contador-box">
            ⏳ Tiempo: <span id="tiempo">30</span>s
        </div>
        <div class="contador-box">
            ⭐ Puntaje: <span id="score">0</span>
        </div>
    </div>

    <div class="row g-4">

        <!-- PIEZAS -->
        <div class="col-lg-4">
            <div class="card shadow border-0 p-3 bg-dark text-light">
                <h4 class="fw-bold text-center mb-3">Personajes</h4>

                <div class="row g-3">

                    <% 
                    for(Pieza p : piezas) {

                        // TEXTO ALT ACCESIBLE
                        String alt = "";

                        if(p.img.equals("jesus.png")) alt = "Figura del niño Jesús";
                        else if(p.img.equals("maria.png")) alt = "Figura de la Virgen María";
                        else if(p.img.equals("jose.png")) alt = "Figura de San José";
                        else if(p.img.equals("angel.png")) alt = "Figura de un ángel";
                        else if(p.img.equals("pastores.png")) alt = "Figura de pastores";
                        else if(p.img.equals("melchor.png")) alt = "Figura del Rey Melchor";
                        else if(p.img.equals("gaspar.png")) alt = "Figura del Rey Gaspar";
                        else if(p.img.equals("baltasar.png")) alt = "Figura del Rey Baltasar";

                        else if(p.img.equals("santa.png")) alt = "Santa Claus, pieza incorrecta";
                        else if(p.img.equals("arbol.png")) alt = "Árbol de Navidad, pieza incorrecta";
                        else if(p.img.equals("regalo.png")) alt = "Regalo navideño, pieza incorrecta";
                        else if(p.img.equals("reno.png")) alt = "Reno navideño, pieza incorrecta";
                        else if(p.img.equals("nutcracker.png")) alt = "Soldado cascanueces, pieza incorrecta";
                    %>

                    <div class="col-6 text-center">
                        <img src="imgs/juego/<%=p.img%>" 
                             class="pieza-img"
                             draggable="true"
                             id="<%=p.img%>"
                             alt="<%=alt%>"
                             aria-label="<%=alt%>"
                             data-correcta="<%=p.correcta%>"
                             ondragstart="drag(event)">
                    </div>

                    <% } %>

                </div>
            </div>
        </div>

        <!-- MAQUETA -->
        <div class="col-lg-8">
            <div id="maqueta" ondrop="drop(event)" ondragover="allowDrop(event)" class="shadow">
                <p class="position-absolute top-50 start-50 translate-middle bg-dark bg-opacity-75 text-warning p-2 rounded shadow">
                    Arrastra las piezas aquí
                </p>
            </div>
        </div>

    </div>

</main>

<!-- PANEL FINAL -->
<div id="panelFinal">
    <div id="panelContenido">
        <h2 class="text-warning fw-bold">🎉 ¡Juego finalizado!</h2>
        <p class="mt-3">Tu puntaje total es:</p>
        <h1 class="text-success fw-bold" id="puntajeFinal"></h1>

        <% 
        Integer idUser = (Integer) session.getAttribute("id_us");
        boolean logeado = (idUser != null);
        %>

        <% if (logeado) { %>
            <button class="btn btn-success mt-3 w-100" onclick="guardarPuntaje(<%=idUser%>)">
                Guardar mi puntaje
            </button>
        <% } else { %>
            <p class="text-info mt-3">Inicia sesión para guardar tu puntaje</p>
        <% } %>

        <button class="btn btn-secondary mt-3 w-100" onclick="location.reload()">Jugar de nuevo</button>
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

<!-- JS DEL JUEGO -->
<script>
    var totalCorrectasJuego = <%=totalCorrectas%>;
</script>
<script src="js/juego.js"></script>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
