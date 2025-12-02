<%@ page language="java" import="com.productos.seguridad.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Villancico v = new Villancico().obtenerPorId(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Villancico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <div class="card shadow mx-auto" style="max-width: 700px;">
        <div class="card-header bg-warning text-dark">
            <h4 class="text-center">Editar Villancico</h4>
        </div>

        <div class="card-body">

            <form method="post" action="admin_villancicos_actualizar.jsp">

                <input type="hidden" name="id" value="<%=v.getId()%>">

                <label class="form-label">Título</label>
                <input type="text" name="titulo" class="form-control" value="<%=v.getTitulo()%>" required>

                <label class="form-label mt-3">Imagen</label>
                <input type="text" name="imagen" class="form-control" value="<%=v.getImagen()%>">

                <label class="form-label mt-3">Audio</label>
                <input type="text" name="audio" class="form-control" value="<%=v.getAudio()%>">

                <label class="form-label mt-3">Letra</label>
                <textarea name="letra" class="form-control" rows="6"><%=v.getLetra()%></textarea>

                <button class="btn btn-primary w-100 mt-4">Actualizar</button>

            </form>

        </div>
    </div>

</div>

</body>
</html>
