<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Portal de Belén</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- ESTILOS LOGIN -->
    <link href="css/login.css" rel="stylesheet" type="text/css">
</head>

<body>

    <!-- 🧭 NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm sticky-top">
        <div class="container">

            <a class="navbar-brand fw-bold text-light" href="index.jsp">
                <i class="fa-solid fa-star-of-david me-2"></i> Portal de Belén
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#menuNav">
                <span class="navbar-toggler-icon"></span>
            </button>

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

    <!--  FORMULARIO LOGIN -->
    <main class="d-flex justify-content-center align-items-center min-vh-100">
        <div class="wrapper mt-5">
            <form action="validarLogin.jsp" method="post">
                <h1 class="text-light"><i class="fa-solid fa-angel me-2"></i>Login</h1>
 <label for="usuario" class="visually-hidden">Correo electronico</label>
                <div class="input-box">
                    <input type="text" name="usuario" placeholder="Correo electronico" required>
                    <i class="fa-solid fa-envelope"></i>
                </div>
<label for="clave" class="visually-hidden">Contraseña</label>
         <div class="input-box">
    <input type="password" name="clave" id="clave" placeholder="Contraseña" required>
    <i class="fa-solid fa-eye" id="togglePassword" style="cursor:pointer;"></i>
</div>



                <% if (request.getParameter("error") != null) { %>
                    <p class="error-msg">
                        <%= request.getParameter("error") %>
                    </p>
                <% } %>

                <button type="submit" class="btn">Ingresar</button>

                <div class="register-link">
                    <p>¿No tienes cuenta? <a href="registro.jsp">Regístrate</a></p>
                </div>
            </form>
        </div>
    </main>

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
<script>
document.getElementById("togglePassword").addEventListener("click", function () {
    let input = document.getElementById("clave");

    if (input.type === "password") {
        input.type = "text";
        this.classList.remove("fa-eye");
        this.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        this.classList.remove("fa-eye-slash");
        this.classList.add("fa-eye");
    }
});
</script>


    <!-- BOOTSTRAP JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
