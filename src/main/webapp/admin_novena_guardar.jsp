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

    String msg = n.insertar();

    Bitacora b = new Bitacora();
    int admin = (Integer)session.getAttribute("id_us");
    b.registrarBitacora(admin, "Creó dia " + dia + " de la novena");

%>

<script>
alert("<%=msg%>");
window.location.href = "admin_novena.jsp";
</script>
