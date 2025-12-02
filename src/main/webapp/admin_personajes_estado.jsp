<%@ page language="java" %>
<%@ page import="com.productos.seguridad.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int estado = Integer.parseInt(request.getParameter("estado"));

    Personaje p = new Personaje();
    String resultado = p.cambiarEstado(id, estado);

    int idAdmin = (Integer) session.getAttribute("id_us");
    new Bitacora().registrarBitacora(
        idAdmin,
        (estado == 1 ? "Activo" : "Desactivo") + " personaje ID " + id
    );
%>

<script>
    alert("<%= resultado %>");
    window.location.href="admin_personajes.jsp";
</script>
