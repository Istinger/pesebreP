<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Registro | Portal de Belén</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <!-- CSS GLOBAL NAVIDAD -->
    <link href="css/style-navidad.css" rel="stylesheet">

    <!-- CSS ESPECÍFICO REGISTRO -->
    <link href="css/registro.css" rel="stylesheet">
</head>

<body>

<!-- ♿ ACCESIBILIDAD -->
<div class="accessibility-bar">
    <button id="increaseFont" class="access-btn">A+</button>
    <button id="decreaseFont" class="access-btn">A-</button>
    <button id="contrastBtn" class="access-btn">Contraste</button>
</div>

<!-- ⭐ NAVBAR UNIVERSAL -->
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
<header class="header-novena text-white text-center py-5 shadow">
    <h1 class="display-5 fw-bold">Registro de Usuario</h1>
    <p class="lead">Únete al Portal de Belén para vivir la magia completa</p>
</header>

<!-- ✨ FORMULARIO NAVIDEÑO -->
<main class="container mt-4 mb-5">

    <div class="card shadow-lg mx-auto registro-card p-3 p-md-4">

        <div class="card-header text-dark text-center">
            <h4><i class="fa-solid fa-angel me-2"></i>Formulario de Registro</h4>
        </div>

        <div class="card-body mt-3">

            <form action="confirmarRegistro.jsp" method="post" id="formCliente" onsubmit="return validarFormulario();">

                <!-- Nombre + Cédula -->
                <div class="row g-3">
                    <div class="col-12 col-md-6">
                        <label class="form-label">Nombre completo</label>
                        <input type="text" class="form-control" name="txtNombre" required>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label">Cédula</label>
                        <input type="text" id="cedula" class="form-control"
                               name="txtCedula"
                               maxlength="10"
                               pattern="^[0-9]{10}$"
                               required>
                    </div>
                </div>

                <!-- Estado civil + Residencia -->
                <div class="row g-3 mt-1">
                    <div class="col-12 col-md-6">
                        <label class="form-label">Estado Civil</label>
                        <select class="form-select" name="cmbEstado" required>
                            <option value="">Seleccione</option>
                            <option value="1">Casado</option>
                            <option value="2">Soltero</option>
                            <option value="3">Divorciado</option>
                            <option value="4">Unión Libre</option>
                            <option value="5">Viudo</option>
                        </select>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label">Lugar de Residencia</label>
                        <div class="residencia-group mt-1">
                            <label><input type="radio" name="rdResidencia" value="Sur" required> Sur</label>
                            <label><input type="radio" name="rdResidencia" value="Norte"> Norte</label>
                            <label><input type="radio" name="rdResidencia" value="Centro"> Centro</label>
                        </div>
                    </div>
                </div>

                <!-- Fecha + Color -->
                <div class="row g-3 mt-1">
                    <div class="col-12 col-md-6">
                        <label class="form-label">Fecha de nacimiento</label>
                        <input type="date" id="fecha" class="form-control" name="mFecha" required>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label">Color Favorito</label>
                        <input type="color" class="form-control form-control-color color-big" name="cColor" required>
                    </div>
                </div>

                <!-- Email -->
                <div class="mt-3">
                    <label class="form-label">Correo electrónico</label>
                    <input type="email" class="form-control" name="txtCorreo" required>
                </div>

                <!-- Password -->
                <div class="mt-3">
                    <label class="form-label">Contraseña (mínimo 8 caracteres)</label>
                    <input type="password" class="form-control"
                           minlength="8"
                           name="txtClave"
                           required>
                </div>

                <!-- Botones -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-gold px-4">
                        <i class="fa-solid fa-check"></i> Registrar
                    </button>
                    <button type="reset" class="btn btn-secondary px-4 ms-2">
                        <i class="fa-solid fa-eraser"></i> Limpiar
                    </button>
                </div>

            </form>

        </div>
    </div>

</main>

<!-- ⭐ FOOTER -->
<footer class="footer-navidad">
    <p>&copy; 2025 Portal de Belén — Universidad Politécnica Salesiana</p>
</footer>

<!-- ❄ NIEVE -->
<script>
function createSnowflake(){
    const s=document.createElement("div");
    s.classList.add("snowflake");
    s.textContent="❄";
    s.style.left=Math.random()*100+"vw";
    s.style.animationDuration=(Math.random()*5+3)+"s";
    document.body.appendChild(s);
    setTimeout(()=>s.remove(),8000);
}
setInterval(createSnowflake,200);
</script>

<!-- ⭐⭐⭐ VALIDACIONES (TUS EXPRESIONES REGULARES + LÓGICA) -->
<script>
    // ================== VALIDACIÓN DE CÉDULA ECUATORIANA ==================
    function validarCedulaEcuatoriana(cedula) {
        if (!/^\d{10}$/.test(cedula)) return false;

        let provincia = parseInt(cedula.substring(0, 2));
        if (provincia < 1 || provincia > 24) return false;

        let suma = 0;
        for (let i = 0; i < 9; i++) {
            let num = parseInt(cedula[i]);

            if (i % 2 === 0) {
                num = num * 2;
                if (num > 9) num -= 9;
            }
            suma += num;
        }

        let verificador = (10 - (suma % 10)) % 10;
        return verificador === parseInt(cedula[9]);
    }

    // ================== VALIDACIÓN FECHA (≥ 18 años) ==================
    function validarFechaNacimiento(fecha) {
        let nacimiento = new Date(fecha);
        let hoy = new Date();

        if (nacimiento > hoy) return false;

        let edad = hoy.getFullYear() - nacimiento.getFullYear();
        let m = hoy.getMonth() - nacimiento.getMonth();
        if (m < 0 || (m === 0 && hoy.getDate() < nacimiento.getDate())) {
            edad--;
        }
        return edad >= 18;
    }

    // ================== VALIDACIÓN FINAL ==================
    function validarFormulario() {
        let cedula = document.getElementById("cedula").value.trim();
        let fecha = document.getElementById("fecha").value;

        if (!validarCedulaEcuatoriana(cedula)) {
            alert("La cédula ingresada NO es válida.");
            return false;
        }

        if (!validarFechaNacimiento(fecha)) {
            alert("Debe ser mayor de 18 años.");
            return false;
        }

        return true;
    }

    window.onload = () => {
        document.getElementById("fecha").max = new Date().toISOString().split("T")[0];
    };
</script>

<!-- ACCESIBILIDAD -->
<script>
let fontBase = 100;
document.getElementById("increaseFont").onclick = () => {
    fontBase = Math.min(200, fontBase + 10);
    document.documentElement.style.fontSize = fontBase + "%";
};
document.getElementById("decreaseFont").onclick = () => {
    fontBase = Math.max(60, fontBase - 10);
    document.documentElement.style.fontSize = fontBase + "%";
};
document.getElementById("contrastBtn").onclick = () => {
    document.body.classList.toggle("high-contrast");
};
document.querySelector(".navbar-toggle").onclick = () => {
    document.querySelector(".navbar-list").classList.toggle("active");
};
</script>

</body>
</html>
