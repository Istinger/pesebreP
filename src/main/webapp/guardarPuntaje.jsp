<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    // Validar sesión
    HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("id_us") == null) {
        out.println("<script>alert('Debe iniciar sesión para guardar el puntaje'); window.location.href='login.jsp';</script>");
        return;
    }

    int idUsuario = (Integer) sesion.getAttribute("id_us");

    // Capturar puntaje
    String puntosStr = request.getParameter("puntaje");
    int puntos = 0;

    try {
        puntos = Integer.parseInt(puntosStr);
    } catch (Exception e) {
        out.println("<script>alert('Puntaje inválido'); window.location.href='juego.jsp';</script>");
        return;
    }

    // Guardar en la BD
    Puntaje p = new Puntaje();
    String resultado = p.registrarPuntaje(idUsuario, puntos);

    // Registrar en Bitácora
    Bitacora b = new Bitacora();
    b.registrarBitacora(idUsuario, "Guardó puntaje de " + puntos);
%>

<script>
    alert("<%= resultado %>");
    window.location.href = "scoreboard.jsp";  // Puedes cambiarlo si quieres
</script>
