<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*"%>

<%
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

    String resultado = p.insertar();

    Integer idAdmin = (session.getAttribute("id_us") != null)
                        ? (Integer)session.getAttribute("id_us")
                        : 0;

    new Bitacora().registrarBitacora(idAdmin, "Registro personaje: " + nombre);
%>

<script>
    alert("<%= resultado %>");
    window.location.href="admin_personajes.jsp";
</script>
