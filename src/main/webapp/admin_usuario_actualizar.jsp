<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    // Recibir parámetros
    int id       = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String clave  = request.getParameter("clave");
    int perfil    = Integer.parseInt(request.getParameter("perfil"));
    int estado    = Integer.parseInt(request.getParameter("estado"));

    // Llenar objeto Usuario
    Usuario u = new Usuario();
    u.setId(id);
    u.setNombre(nombre);
    u.setCedula(cedula);
    u.setCorreo(correo);
    u.setClave(clave);
    u.setPerfil(perfil);
    u.setEstado(estado);

    // Ejecutar actualización
    String resultado = u.actualizarUsuario(u);
    Bitacora b = new Bitacora();
    b.registrarBitacora(
        (Integer)session.getAttribute("id_us"),
        "Actualizó usuario ID " + id
    );

%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Actualizando...</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

<%
    if (resultado.toLowerCase().contains("actualizado")) {
%>

<div class="alert alert-success text-center">
    <strong><%= resultado %></strong><br>
    Redirigiendo a la administración de usuarios...
</div>

<script>
    setTimeout(() => { window.location.href = "admin_usuarios.jsp"; }, 2000);
</script>

<%
    } else {
%>

<div class="alert alert-danger text-center">
    <strong>Error:</strong> <%= resultado %><br>
    Redirigiendo nuevamente...
</div>

<script>
    setTimeout(() => { window.history.back(); }, 2500);
</script>

<%
    }
%>

</div>

</body>
</html>
