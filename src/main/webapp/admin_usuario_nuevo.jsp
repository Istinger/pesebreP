<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>
    
<script>
    // ================== VALIDACIÓN CÉDULA ==================
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

    // ================== VALIDACIÓN FECHA ==================
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
        let fecha = document.getElementById("fecha");
        if (fecha) fecha.max = new Date().toISOString().split("T")[0];
    };
</script>

</head>

<body class="bg-light">

<%
    // ========== VALIDAR SESIÓN ==========
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Debe iniciar sesión." />
</jsp:forward>
<%
        return;
    }

    Integer perfilSesion = (Integer) sesion.getAttribute("perfil");

    // SOLO ADMIN
    if (perfilSesion != 1) {
%>
    <h2 class="text-danger text-center mt-5">⚠ Acceso denegado</h2>
<%
        return;
    }

    String usuarioLog = (String) sesion.getAttribute("usuario");

    // Navbar dinámico →
    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfilSesion);

    // Perfil del nuevo usuario
    String tipo = request.getParameter("tipo");
    int perfil = ("admin".equals(tipo)) ? 1 : 2;
%>

<!-- 🧭 NAVBAR DINÁMICO -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">

        <a class="navbar-brand fw-bold text-light" href="menu.jsp">
            <i class="fa-solid fa-star me-2"></i>Portal de Belén
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#menuNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="menuNav">

            <ul class="navbar-nav me-auto">
                <%= menu %>
            </ul>

            <span class="navbar-text text-white me-3">
                <i class="fa-solid fa-user"></i> <%= usuarioLog %>
            </span>

            <form action="cerrarSesion.jsp" method="post">
                <button class="btn btn-outline-light btn-sm">
                    <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
                </button>
            </form>
        </div>
    </div>
</nav>


<!-- ================== FORMULARIO ================== -->
<div class="container mt-5">

<div class="card shadow mx-auto" style="max-width: 600px;">
    <div class="card-header bg-primary text-white text-center">
        <h4>Registrar Nuevo <%= perfil == 1 ? "Administrador" : "Estudiante" %></h4>
    </div>

    <div class="card-body">
        <form id="formNuevoUsuario" action="admin_usuario_guardar.jsp" method="post" onsubmit="return validarFormulario();">

            <input type="hidden" name="perfil" value="<%= perfil %>">

            <label class="form-label">Nombre Completo</label>
            <input type="text" name="nombre" class="form-control" required>

            <label class="form-label mt-3">Cédula</label>
            <input type="text" id="cedula" name="cedula" class="form-control" maxlength="10" required>

            <label class="form-label mt-3">Correo</label>
            <input type="email" name="correo" class="form-control" required>

            <label class="form-label mt-3">Clave</label>
            <input type="password" name="clave" class="form-control" required>

            <label class="form-label mt-3">Fecha Nacimiento</label>
            <input type="date" id="fecha" name="fecha" class="form-control" required>

            <button type="button" class="btn btn-success mt-4 w-100" onclick="confirmarRegistro()">
    		<i class="fa-solid fa-save"></i> Registrar
			</button>


        </form>
    </div>
</div>

</div>
<!-- Modal de Confirmación -->
<div class="modal fade" id="modalConfirmar" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title"><i class="fa-solid fa-circle-question me-2"></i>Confirmar Registro</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        ¿Está seguro de que desea registrar este usuario?
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-success" onclick="enviarFormulario()">
            Sí, Registrar
        </button>
      </div>

    </div>
  </div>
</div>
<script>
function confirmarRegistro() {
    let modal = new bootstrap.Modal(document.getElementById('modalConfirmar'));
    modal.show();
}

function enviarFormulario() {
    document.getElementById("formNuevoUsuario").submit();
}
</script>


<!-- ================== FOOTER ================== -->
<footer class="bg-dark text-light text-center py-3 mt-5">
    <ul class="list-unstyled">
        <li>Facebook <i class="fa-brands fa-facebook"></i></li>
        <li>Instagram <i class="fa-brands fa-instagram"></i></li>
        <li>Twitter <i class="fa-brands fa-twitter"></i></li>
    </ul>
    <p>&copy; 2025 Universidad Politécnica Salesiana</p>
    <p>Email: pproanog@est.ups.edu.ec</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
