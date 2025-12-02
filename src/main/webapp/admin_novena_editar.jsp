<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    // Validar sesión
    HttpSession ses = request.getSession(false);
    if (ses == null || ses.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int dia = Integer.parseInt(request.getParameter("dia"));
    Novena n = new Novena().obtenerPorDia(dia);

    if (n == null) {
%>
        <h2 class="text-center text-danger mt-5">❌ No existe este día en la Novena</h2>
<%
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Día de Novena</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

<script>
// Mostrar modal en vez de enviar directamente
function abrirConfirmacion() {
    let modal = new bootstrap.Modal(document.getElementById("modalConfirmar"));
    modal.show();
    return false; // evita submit inmediato
}

// Enviar formulario después de confirmar
function enviarFormulario() {
    document.getElementById("formNovena").submit();
}
</script>

</head>

<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="menu.jsp">
            <i class="fa-solid fa-star me-2"></i>Portal de Belén
        </a>
    </div>
</nav>

<div class="container mt-5">

    <div class="card shadow mx-auto" style="max-width: 700px;">
        <div class="card-header bg-primary text-white text-center">
            <h4><i class="fa-solid fa-pen-to-square me-2"></i>Editar Día <%= n.getDia() %></h4>
        </div>

        <div class="card-body">

            <form id="formNovena" action="admin_novena_actualizar.jsp" method="post"
                  onsubmit="return abrirConfirmacion();">

                <input type="hidden" name="dia" value="<%= n.getDia() %>">

                <!-- TITULO -->
                <label class="form-label fw-bold">Título</label>
                <input type="text" class="form-control"
                       name="titulo" value="<%= n.getTitulo() %>" required>

                <!-- IMAGEN -->
                <label class="form-label mt-3 fw-bold">Imagen</label>
                <input type="text" class="form-control"
                       name="imagen" value="<%= n.getImagen() %>" required>

                <p class="text-muted mt-1">Ejemplo: <b>novena/dia3.png</b></p>

                <!-- CONTENIDO -->
                <label class="form-label mt-3 fw-bold">Contenido</label>
                <textarea name="contenido" class="form-control" rows="10" required>
<%= n.getContenido() %>
                </textarea>

                <!-- BOTÓN -->
                <button class="btn btn-primary w-100 mt-4 fw-bold">
                    <i class="fa-solid fa-save"></i> Guardar Cambios
                </button>

            </form>

        </div>
    </div>

</div>

<!-- ============ MODAL DE CONFIRMACIÓN ============ -->
<div class="modal fade" id="modalConfirmar" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-warning">
        <h5 class="modal-title fw-bold">
            <i class="fa-solid fa-circle-question me-2"></i>
            Confirmar actualización
        </h5>
        <button class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        ¿Estás seguro que deseas actualizar este día de la Novena?
      </div>

      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button class="btn btn-warning fw-bold" onclick="enviarFormulario()">
            Sí, actualizar
        </button>
      </div>

    </div>
  </div>
</div>
<!-- ================================================ -->

<footer class="bg-dark text-white text-center py-3 mt-5">
    <small>&copy; 2025 Portal de Belén</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
