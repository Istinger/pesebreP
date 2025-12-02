<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Personaje</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="card-header bg-primary text-white text-center">
            <h4>Registrar Nuevo Personaje</h4>
        </div>

        <div class="card-body">

            <form action="admin_personajes_guardar.jsp" method="post">

                <label class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" required>

                <label class="form-label mt-3">Descripción</label>
                <textarea name="descripcion" class="form-control" rows="3" required></textarea>

                <label class="form-label mt-3">Imagen (nombre del archivo)</label>
                <input type="text" name="imagen" class="form-control" placeholder="melchor.png" required>

                <button class="btn btn-success w-100 mt-4">
                    <i class="fa-solid fa-check"></i> Guardar
                </button>

            </form>

        </div>
    </div>

</div>

</body>
</html>
