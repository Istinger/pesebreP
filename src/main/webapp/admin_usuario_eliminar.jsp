<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    // 1. Tomamos ID a eliminar
    String id = request.getParameter("id");

    Usuario u = new Usuario();
    String resultado = u.actualizarEstado(Integer.parseInt(id), 2);

    // 2. Registrar bitácora del admin
    int idAdmin = (Integer) session.getAttribute("id_us");

    Bitacora b = new Bitacora();
    b.registrarBitacora(idAdmin, "Bloqueó al usuario ID " + id);
%>

<script>
    alert("<%= resultado %>");
    window.location.href = "admin_usuarios.jsp";
</script>
