package com.productos.seguridad;

import java.sql.*;
import com.productos.datos.Conexion;

public class Pagina {

    private int id;
    private String nombre;
    private String path;

    public String obtenerMenu(int perfil) {
        StringBuilder menu = new StringBuilder();

        try {
            Conexion con = new Conexion();

            String sql = "SELECT descripcion_pag, path_pag " +
                         "FROM tb_pagina p " +
                         "JOIN tb_perfilpagina pp ON p.id_pag = pp.id_pag " +
                         "WHERE pp.id_per = ? ORDER BY p.id_pag";

            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, perfil);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                menu.append("<li class='nav-item'>")
                    .append("<a class='nav-link' href='")
                    .append(rs.getString("path_pag"))
                    .append("'>")
                    .append(rs.getString("descripcion_pag"))
                    .append("</a></li>");
            }

        } catch (Exception e) {
            System.out.println("❌ Error obtenerMenu: " + e.getMessage());
        }
        return menu.toString();
    }
}
