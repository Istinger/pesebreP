<%@ page import="com.productos.seguridad.*" %>

<%
    int dia = Integer.parseInt(request.getParameter("dia"));
    int estado = Integer.parseInt(request.getParameter("estado"));

    Novena n = new Novena();
    String msg = n.cambiarEstado(dia, estado);

    Bitacora b = new Bitacora();
    int admin = (Integer)session.getAttribute("id_us");
    b.registrarBitacora(admin,
        (estado==1 ? "Activó" : "Desactivó") + " día " + dia + " de la novena"
    );
%>

<script>
alert("<%=msg%>");
window.location.href = "admin_novena.jsp";
</script>
