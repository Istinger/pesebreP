<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

<%
    HttpSession ses = request.getSession(false);
    if (ses == null || ses.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int perfil = (Integer) ses.getAttribute("perfil");
    Pagina pg = new Pagina();
    String menu = pg.obtenerMenu(perfil);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Día Novena</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-light" href="index.jsp">
            Portal de Belén
        </a>
        <ul class="navbar-nav">
            <%= menu %>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="text-center fw-bold">Nuevo Día Novena</h3>

<form action="admin_novena_guardar.jsp" method="post">

    <label>Día:</label>
    <input type="number" name="dia" class="form-control" required>

    <label class="mt-3">Título:</label>
    <input type="text" name="titulo" class="form-control" required>

    <label class="mt-3">Imagen (archivo nombre):</label>
    <input type="text" name="imagen" class="form-control">

    <label class="mt-3">Contenido:</label>
    <textarea name="contenido" class="form-control" rows="8" required></textarea>

    <button class="btn btn-success mt-4 w-100">Guardar</button>

</form>

</div>

<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>&copy; 2025 Portal de Belén</small>
</footer>

</body>
</html>
