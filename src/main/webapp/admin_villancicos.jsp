<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="com.productos.seguridad.*, java.util.*" %>

<%
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int perfil = (Integer) sesion.getAttribute("perfil");
    if (perfil != 1) { out.print("<h2>Acceso denegado</h2>"); return; }

    Villancico dao = new Villancico();
    List<Villancico> lista = dao.listarTodos();

    Pagina pag = new Pagina();
    String menu = pag.obtenerMenu(perfil);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Administrar Villancicos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
        <a class="navbar-brand fw-bold text-light" href="menu.jsp">
            <i class="fa-solid fa-star me-2"></i>Portal de Belén
        </a>

        <div class="collapse navbar-collapse" id="menuNav">
            <ul class="navbar-nav me-auto"><%= menu %></ul>

            <span class="navbar-text text-white me-3">
                <i class="fa-solid fa-user"></i> <%= sesion.getAttribute("usuario") %>
            </span>
        </div>
  </div>
</nav>

<div class="container mt-4">

    <div class="text-end mb-3">
        <a href="admin_villancicos_nuevo.jsp" class="btn btn-success">
            Nuevo Villancico
        </a>
    </div>

    <table class="table table-striped shadow">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Imagen</th>
                <th>Audio</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
        <% for (Villancico v : lista) { %>
            <tr>
                <td><%= v.getId() %></td>
                <td><%= v.getTitulo() %></td>
                <td><%= v.getImagen() %></td>
                <td><%= v.getAudio() %></td>
                <td><%= v.getEstado()==1 ? "Activo" : "Inactivo" %></td>

                <td>
                    <a href="admin_villancicos_editar.jsp?id=<%=v.getId()%>" class="btn btn-warning btn-sm">
                        Editar
                    </a>

                    <% if (v.getEstado()==1) { %>
                        <a href="admin_villancicos_estado.jsp?id=<%=v.getId()%>&estado=0"
                           class="btn btn-danger btn-sm">Desactivar</a>
                    <% } else { %>
                        <a href="admin_villancicos_estado.jsp?id=<%=v.getId()%>&estado=1"
                           class="btn btn-success btn-sm">Activar</a>
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>

</div>

<footer class="bg-dark text-light text-center py-3 mt-5">
    &copy; 2025 Portal de Belén
</footer>

</body>
</html>
