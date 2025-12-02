<%@ page language="java" import="com.productos.seguridad.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int estado = Integer.parseInt(request.getParameter("estado"));

    Villancico v = new Villancico();
    String resultado = v.cambiarEstado(id, estado);

    int admin = (Integer) session.getAttribute("id_us");

    new Bitacora().registrarBitacora(
        admin, 
        (estado==1 ? "Activo" : "Desactivo") + " villancico ID " + id
    );
%>

<script>
    alert("<%=resultado%>");
    window.location.href = "admin_villancicos.jsp";
</script>
