<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    // Obtener personaje
    int id = Integer.parseInt(request.getParameter("id"));
    Personaje p = new Personaje().obtenerPorId(id);

    if (p == null) {
%>
        <h2 class="text-danger text-center mt-5">❌ Personaje no encontrado</h2>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Personaje</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

<script>
// Mostrar modal antes de enviar
function abrirConfirmacion() {
    let modal = new bootstrap.Modal(document.getElementById("modalConfirmar"));
    modal.show();
    return false;
}

// Enviar formulario después de confirmar
function enviarFormulario() {
    document.getElementById("formPersonaje").submit();
}
</script>
</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-light" href="admin_personajes.jsp">
            <i class="fa-solid fa-arrow-left"></i> Volver
        </a>
    </div>
</nav>

<div class="container mt-4">

    <div class="card shadow mx-auto" style="max-width: 600px;">
        <div class="card-header bg-warning text-dark text-center">
            <h4><i class="fa-solid fa-user-pen me-2"></i>Editar Personaje</h4>
        </div>

        <div class="card-body">

            <form id="formPersonaje" 
                  action="admin_personajes_actualizar.jsp" 
                  method="post"
                  onsubmit="return abrirConfirmacion();">

                <input type="hidden" name="id" value="<%= p.getId() %>">

                <label class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" 
                       value="<%= p.getNombre() %>" required>

                <label class="form-label mt-3">Descripción</label>
                <textarea name="descripcion" class="form-control" rows="3" required><%= p.getDescripcion() %></textarea>

                <label class="form-label mt-3">Imagen</label>
                <input type="text" name="imagen" class="form-control"
                       value="<%= p.getImagen() %>" required>

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
        ¿Estás seguro que deseas actualizar este personaje?
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
    