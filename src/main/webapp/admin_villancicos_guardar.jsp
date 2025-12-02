<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String titulo = request.getParameter("titulo");
    String imagen = request.getParameter("imagen");
    String audio  = request.getParameter("audio");
    String letra  = request.getParameter("letra");

    Villancico v = new Villancico();
    v.setTitulo(titulo);
    v.setImagen(imagen);
    v.setAudio(audio);
    v.setLetra(letra);

    String resultado = v.insertar();

    int idAdmin = (Integer) session.getAttribute("id_us");
    new Bitacora().registrarBitacora(idAdmin, "Registró villancico: " + titulo);
%>

<script>
    alert("<%= resultado %>");
    window.location.href = "admin_villancicos.jsp";
</script>
