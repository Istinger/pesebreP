<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Confirmar Registro | Portal de Belén</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg mx-auto" style="max-width: 600px;">
        <div class="card-header bg-warning text-dark text-center">
            <h4><i class="fa-solid fa-circle-info me-2"></i>Confirmación de Datos</h4>
        </div>

        <div class="card-body">

            <p class="text-muted">Por favor revisa que todos tus datos sean correctos:</p>

            <ul class="list-group mb-4">
                <li class="list-group-item"><strong>Nombre:</strong> <%= request.getParameter("txtNombre") %></li>
                <li class="list-group-item"><strong>Cédula:</strong> <%= request.getParameter("txtCedula") %></li>
                <li class="list-group-item"><strong>Estado Civil:</strong> <%= request.getParameter("cmbEstado") %></li>
                <li class="list-group-item"><strong>Residencia:</strong> <%= request.getParameter("rdResidencia") %></li>
                <li class="list-group-item"><strong>Fecha Nacimiento:</strong> <%= request.getParameter("mFecha") %></li>
                <li class="list-group-item"><strong>Correo:</strong> <%= request.getParameter("txtCorreo") %></li>
                <li class="list-group-item"><strong>Color Favorito:</strong> 
                    <span style="color:<%= request.getParameter("cColor") %>;">
                        <%= request.getParameter("cColor") %>
                    </span>
                </li>
            </ul>

            <!-- FORMULARIO PARA CONFIRMAR -->
            <form action="nuevoCliente.jsp" method="post">

                <!-- Reenvío de valores ocultos -->
                <input type="hidden" name="txtNombre" value="<%= request.getParameter("txtNombre") %>">
                <input type="hidden" name="txtCedula" value="<%= request.getParameter("txtCedula") %>">
                <input type="hidden" name="cmbEstado" value="<%= request.getParameter("cmbEstado") %>">
                <input type="hidden" name="rdResidencia" value="<%= request.getParameter("rdResidencia") %>">
                <input type="hidden" name="mFecha" value="<%= request.getParameter("mFecha") %>">
                <input type="hidden" name="cColor" value="<%= request.getParameter("cColor") %>">
                <input type="hidden" name="txtCorreo" value="<%= request.getParameter("txtCorreo") %>">
                <input type="hidden" name="txtClave" value="<%= request.getParameter("txtClave") %>">

                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">
                        <i class="fa-solid fa-check"></i> Confirmar Registro
                    </button>

                    <a href="registro.jsp" class="btn btn-secondary px-4">
                        <i class="fa-solid fa-arrow-left"></i> Cancelar
                    </a>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html>
