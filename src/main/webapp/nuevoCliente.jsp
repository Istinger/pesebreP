<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro Finalizado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

<%
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    int estadoCivil = Integer.parseInt(request.getParameter("cmbEstado"));
    String residencia = request.getParameter("rdResidencia");
    String fecha = request.getParameter("mFecha");
    String color = request.getParameter("cColor");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");

    Usuario user = new Usuario();
    user.setNombre(nombre);
    user.setCedula(cedula);
    user.setEstado(estadoCivil);
    user.setCorreo(correo);
    user.setClave(clave);
	
    String resultado = user.ingresarCliente();
    
    int idNuevo = user.obtenerIdPorCorreo(correo);

    Bitacora b = new Bitacora();
    b.registrarBitacora(idNuevo, "Registro de nuevo estudiante");
%>

<div class="card shadow-lg mx-auto" style="max-width: 600px;">
    <div class="card-header bg-primary text-white text-center">
        <h4>Resultado del Registro</h4>
    </div>
    <div class="card-body">

    <% if (resultado.contains("correcta")) { %>
        <div class="alert alert-success text-center">
            <i class="fa-solid fa-check-circle me-2"></i>
            ¡Registro completado con éxito! Redirigiendo al Login...
        </div>

        <script>
            setTimeout(() => {
                window.location.href = "login.jsp";
            }, 1);
        </script>

    <% } else { %>

        <div class="alert alert-danger text-center">
            <i class="fa-solid fa-triangle-exclamation me-2"></i>
            Error al registrar: <%= resultado %>
        </div>

        <div class="text-center">
            <a href="registro.jsp" class="btn btn-secondary">Volver</a>
        </div>

    <% } %>

    </div>
</div>

</div>
</body>
</html>
