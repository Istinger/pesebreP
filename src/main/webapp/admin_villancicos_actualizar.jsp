<%@ page language="java" import="com.productos.seguridad.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Villancico v = new Villancico();
    v.setTitulo(request.getParameter("titulo"));
    v.setImagen(request.getParameter("imagen"));
    v.setAudio(request.getParameter("audio"));
    v.setLetra(request.getParameter("letra"));

    String resultado = v.actualizar(id);

    int admin = (Integer) session.getAttribute("id_us");
    new Bitacora().registrarBitacora(admin, "Editó villancico ID "+id);
%>

<script>
    alert("<%=resultado%>");
    window.location.href = "admin_villancicos.jsp";
</script>
