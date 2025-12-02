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

    String usuario = (String) sesion.getAttribute("usuario");

    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfil);

    // Tabla usuarios
    Usuario u = new Usuario();
    String tablaUsuarios = u.consultarUsuarios();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administrar Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>
</head>

<body>

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

            <!-- Usuario -->
            <span class="navbar-text text-white me-3">
                <i class="fa-solid fa-user-circle me-1"></i> <%= usuario %>
            </span>

            <!-- Cerrar sesión -->
            <form class="d-inline" action="cerrarSesion.jsp" method="post">
                <button class="btn btn-outline-light btn-sm">
                    <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
                </button>
            </form>

        </div>
    </div>
</nav>

<!-- ====================== CONTENIDO PRINCIPAL ====================== -->
<div class="container mt-4">

    <h2 class="text-center mb-4 fw-bold text-primary">
        <i class="fa-solid fa-users-gear me-2"></i> Gestión de Usuarios
    </h2>

    <!-- BOTONES -->
    <div class="text-end mb-3">
        <a href="admin_usuario_nuevo.jsp?tipo=estudiante" class="btn btn-success me-2">
            <i class="fa-solid fa-user-plus"></i> Nuevo Estudiante
        </a>
        <a href="admin_usuario_nuevo.jsp?tipo=admin" class="btn btn-warning">
            <i class="fa-solid fa-user-tie"></i> Nuevo Administrador
        </a>
    </div>

    <!-- TABLA DINÁMICA -->
    <%= tablaUsuarios %>

</div>


<!-- ====================== FOOTER ====================== -->
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

<script>
function confirmarEliminacion(id){
    if(confirm("¿Seguro que desea eliminar el usuario?")){
        window.location.href = "admin_usuario_eliminar.jsp?id=" + id;
    }
}
</script>
<script>
function cambiarEstado(id, estadoActual){
    let accion = (estadoActual === "Activo") ? "bloquear" : "activar";

    if(confirm("¿Seguro que deseas " + accion + " este usuario?")) {
        window.location.href = "admin_usuario_estado.jsp?id=" + id + "&accion=" + accion;
    }
}
</script>

</body>
</html>
