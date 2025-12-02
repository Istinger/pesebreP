<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

<%
    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String clave  = request.getParameter("clave");
    int perfil    = Integer.parseInt(request.getParameter("perfil"));

    Usuario u = new Usuario();
    u.setNombre(nombre);
    u.setCedula(cedula);
    u.setCorreo(correo);
    u.setClave(clave);
    u.setPerfil(perfil);

    String resultado = u.ingresarEmpleado();
    
    Bitacora b = new Bitacora();
    b.registrarBitacora(
        (Integer)session.getAttribute("id_us"),
        "Creó un nuevo usuario: " + nombre
    );
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guardando Usuario...</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <div class="alert alert-info text-center shadow">
        <h5 class="fw-bold"><%= resultado %></h5>
        <p>Serás redirigido en un momento...</p>
    </div>

</div>

<script>
    setTimeout(() => {
        window.location.href = "admin_usuarios.jsp";
    }, 2000);
</script>

</body>
</html>
