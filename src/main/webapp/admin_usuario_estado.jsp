<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String accion = request.getParameter("accion"); // "activar" o "bloquear"

    Usuario u = new Usuario();
    String mensaje = "";

    if ("bloquear".equals(accion)) {
        mensaje = u.actualizarEstado(id, 2);  // 2 = Bloqueado
    } else if ("activar".equals(accion)) {
        mensaje = u.actualizarEstado(id, 1);  // 1 = Activo
    }
    int idAdmin = (Integer) session.getAttribute("id_us");
    Bitacora b = new Bitacora();
    b.registrarBitacora(idAdmin, "Cambió estado del usuario ID " + id);
%>

<script>
    alert("<%= mensaje %>");
    window.location.href = "admin_usuarios.jsp";
</script>
