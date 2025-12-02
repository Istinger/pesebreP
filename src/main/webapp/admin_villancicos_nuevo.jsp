<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Villancico</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONOS -->
    <script src="https://kit.fontawesome.com/9fccc9a50e.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: #f2f2f2;
        }
        .card {
            border-radius: 15px;
        }
        .card-header {
            border-radius: 15px 15px 0 0;
        }
    </style>
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow-lg mx-auto" style="max-width: 700px;">
        <div class="card-header bg-primary text-white text-center">
            <h3 class="fw-bold">Registrar Villancico</h3>
        </div>

        <div class="card-body">

            <form action="admin_villancicos_guardar.jsp" method="post">

                <label class="form-label mt-2">Título</label>
                <input type="text" name="titulo" class="form-control" required>

                <label class="form-label mt-3">Imagen (ruta)</label>
                <input type="text" name="imagen" class="form-control" placeholder="villancicos/pecesrio.png" required>

                <label class="form-label mt-3">Audio (ruta)</label>
                <input type="text" name="audio" class="form-control" placeholder="audios/pecesrio.mp3" required>

                <label class="form-label mt-3">Letra</label>
                <textarea name="letra" class="form-control" rows="8" required></textarea>

                <button class="btn btn-success w-100 mt-4">
                    <i class="fa-solid fa-check me-2"></i>Guardar
                </button>

            </form>

        </div>
    </div>

</div>

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
