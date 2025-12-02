<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("login.jsp?msg=Cerraste sesión correctamente");
%>
