<%@ page import="com.productos.seguridad.*" %>

<%
    int dia = Integer.parseInt(request.getParameter("dia"));
    String titulo = request.getParameter("titulo");
    String imagen = request.getParameter("imagen");
    String contenido = request.getParameter("contenido");

    Novena n = new Novena();
    n.setDia(dia);
    n.setTitulo(titulo);
    n.setImagen(imagen);
    n.setContenido(contenido);

    String msg = n.actualizar();

    Bitacora b = new Bitacora();
    b.registrarBitacora((Integer)session.getAttribute("id_us"),
                        "Editó día " + dia + " de la novena");
%>

<script>
alert("<%=msg%>");
window.location.href = "admin_novena.jsp";
</script>
