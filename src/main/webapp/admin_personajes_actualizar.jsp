<%@ page language="java" import="com.productos.seguridad.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String imagen = request.getParameter("imagen");

    nombre = (nombre != null) ? nombre.trim() : "";
    descripcion = (descripcion != null) ? descripcion.trim() : "";
    imagen = (imagen != null) ? imagen.trim() : "";

    Personaje p = new Personaje();
    p.setNombre(nombre);
    p.setDescripcion(descripcion);
    p.setImagen(imagen);

    String resultado = p.actualizar(id);

    Integer idAdmin = (session.getAttribute("id_us") != null)
                        ? (Integer)session.getAttribute("id_us")
                        : 0;

    new Bitacora().registrarBitacora(idAdmin, "Editó personaje: " + nombre);
%>

<script>
    alert("<%= resultado %>");
    window.location.href="admin_personajes.jsp";
</script>
