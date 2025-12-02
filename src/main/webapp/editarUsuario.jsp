<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*,java.sql.*"%>

<%
    // Verificar sesión
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Debe iniciar sesión para acceder." />
</jsp:forward>
<%
        return;
    }

    // SOLO ADMIN
    Integer perfil = (Integer) sesion.getAttribute("perfil");
    if (perfil != 1) {
%>
<h2 class="text-danger text-center mt-5">⚠ Acceso denegado</h2>
<%
        return;
    }

    String id = request.getParameter("id");
    Usuario u = new Usuario();
    Usuario usuarioEditar = u.buscarUsuarioPorId(id);

    if (usuarioEditar == null) {
%>
<h2 class="text-danger text-center mt-5">⚠ Usuario no encontrado</h2>
<%
        return;
    }

    // Navbar dinámico
    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfil);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

<script>
// VALIDACIÓN CÉDULA ECUATORIANA
function validarCedula(cedula){
    if (!/^\d{10}$/.test(cedula)) return false;

    let provincia = parseInt(cedula.substring(0,2));
    if (provincia < 1 || provincia > 24) return false;

    let suma = 0;
    for (let i=0; i<9; i++){
        let num = parseInt(cedula[i]);
        if (i % 2 === 0){
            num *= 2;
            if (num > 9) num -= 9;
        }
        suma += num;
    }

    let verificador = (10 - (suma % 10)) % 10;
    return verificador === parseInt(cedula[9]);
}

function validarFormulario(){
    let ced = document.getElementById("cedula").value.trim();

    if(!validarCedula(ced)){
        alert("La cédula ingresada NO es válida");
        return false;
    }

    let modal = new bootstrap.Modal(document.getElementById("modalConfirmar"));
    modal.show();
    return false;
}

function enviarFormulario(){
    document.getElementById("formEditar").submit();
}
</script>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold text-light" href="index.jsp">
      <i class="fa-solid fa-star me-2"></i>Portal de Belén
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menuNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <%= menu %>
      </ul>

      <span class="navbar-text text-white me-3">
        <i class="fa-solid fa-user-gear me-1"></i> <%= sesion.getAttribute("usuario") %>
      </span>

      <form class="d-inline" action="cerrarSesion.jsp" method="post">
        <button class="btn btn-outline-light btn-sm">
          <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
        </button>
      </form>
    </div>
  </div>
</nav>

<!-- CONTENIDO -->
<div class="container mt-5">

    <h2 class="text-center fw-bold text-primary mb-4">
        <i class="fa-solid fa-user-pen me-2"></i> Editar Usuario
    </h2>

    <div class="card shadow mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white text-center">
            <h4>Datos del Usuario</h4>
        </div>

        <div class="card-body">
            <form id="formEditar" action="admin_usuario_actualizar.jsp" method="post" onsubmit="return validarFormulario();">

                <input type="hidden" name="id" value="<%= usuarioEditar.getId() %>">

                <label class="form-label">Nombre Completo</label>
                <input type="text" name="nombre" class="form-control" value="<%= usuarioEditar.getNombre() %>" required>

                <label class="form-label mt-3">Cédula</label>
                <input type="text" id="cedula" name="cedula" class="form-control" value="<%= usuarioEditar.getCedula() %>" required>

                <label class="form-label mt-3">Correo</label>
                <input type="email" name="correo" class="form-control" value="<%= usuarioEditar.getCorreo() %>" required>

                <label class="form-label mt-3">Clave</label>
                <input type="text" name="clave" class="form-control" value="<%= usuarioEditar.getClave() %>" required>

                <label class="form-label mt-4">Perfil</label>
                <select name="perfil" class="form-select">
                    <option value="1" <%= usuarioEditar.getPerfil()==1 ? "selected":"" %>>Administrador</option>
                    <option value="2" <%= usuarioEditar.getPerfil()==2 ? "selected":"" %>>Estudiante</option>
                </select>

                <label class="form-label mt-3">Estado</label>
                <select name="estado" class="form-select">
                    <option value="1" <%= usuarioEditar.getEstado()==1 ? "selected":"" %>>Activo</option>
                    <option value="2" <%= usuarioEditar.getEstado()==2 ? "selected":"" %>>Bloqueado</option>
                </select>

                <button class="btn btn-warning mt-4 w-100 fw-bold">
                    <i class="fa-solid fa-save me-2"></i> Guardar Cambios
                </button>

            </form>
        </div>
    </div>

</div>

<!-- MODAL DE CONFIRMACION -->
<div class="modal fade" id="modalConfirmar" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-warning">
        <h5 class="modal-title fw-bold"><i class="fa-solid fa-circle-question me-2"></i>Confirmar Actualización</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        ¿Está seguro que desea actualizar este usuario?
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-warning fw-bold" onclick="enviarFormulario()">
            Sí, actualizar
        </button>
      </div>

    </div>
  </div>
</div>

<!-- FOOTER -->
<footer class="bg-dark text-light text-center py-3 mt-5">
    <p>&copy; 2025 Portal de Belén - UPS</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
