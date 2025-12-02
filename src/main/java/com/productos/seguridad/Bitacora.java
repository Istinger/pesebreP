package com.productos.seguridad;

import java.sql.*;
import com.productos.datos.Conexion;

public class Bitacora {

    public String registrarBitacora(int id_us, String accion) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "INSERT INTO tb_bitacora(id_us, accion) VALUES(?, ?)"
            );

            ps.setInt(1, id_us);
            ps.setString(2, accion);
            ps.executeUpdate();

            return "OK";

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    public String consultarBitacora() {
        StringBuilder tabla = new StringBuilder();

        tabla.append("<table class='table table-striped table-hover'>")
             .append("<thead class='table-dark'><tr>")
             .append("<th>ID</th><th>Usuario</th><th>Acción</th><th>Fecha</th>")
             .append("</tr></thead><tbody>");

        try {
            Conexion cx = new Conexion();

            String sql = """
                SELECT b.id_bit, u.nombre_us, b.accion, b.fecha
                FROM tb_bitacora b
                JOIN tb_usuario u ON b.id_us = u.id_us
                ORDER BY b.fecha DESC;
            """;

            ResultSet rs = cx.Consulta(sql);

            while (rs.next()) {
                tabla.append("<tr>")
                     .append("<td>").append(rs.getInt("id_bit")).append("</td>")
                     .append("<td>").append(rs.getString("nombre_us")).append("</td>")
                     .append("<td>").append(rs.getString("accion")).append("</td>")
                     .append("<td>").append(rs.getString("fecha")).append("</td>")
                     .append("</tr>");
            }

            tabla.append("</tbody></table>");

        } catch (Exception e) {
            tabla.append("<tr><td colspan='4'>Error: ").append(e.getMessage()).append("</td></tr>");
        }

        return tabla.toString();
    }
}
