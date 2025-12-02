package com.productos.seguridad;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.productos.datos.Conexion;

public class Novena {

    // ================== ATRIBUTOS ==================
    private int id_nov;
    private int dia;
    private String titulo;
    private String imagen;
    private String contenido;
    private int estado; // 1=Activo, 2=Inactivo

    // ================== CONSTRUCTOR ==================
    public Novena() {}

    // ================== GETTERS / SETTERS ==================
    public int getId_nov() { return id_nov; }
    public void setId_nov(int id_nov) { this.id_nov = id_nov; }

    public int getDia() { return dia; }
    public void setDia(int dia) { this.dia = dia; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }

    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }

    public int getEstado() { return estado; }
    public void setEstado(int estado) { this.estado = estado; }


    // ======================================================
    // 🔵 LISTAR TODOS (PARA ADMIN)
    // ======================================================
    public List<Novena> listar() {

        List<Novena> lista = new ArrayList<>();

        String sql = "SELECT * FROM novena ORDER BY dia ASC";

        try {
            Conexion cx = new Conexion();
            ResultSet rs = cx.Consulta(sql);

            while (rs.next()) {
                Novena n = new Novena();
                n.id_nov = rs.getInt("id_nov");
                n.dia = rs.getInt("dia");
                n.titulo = rs.getString("titulo");
                n.imagen = rs.getString("imagen");
                n.contenido = rs.getString("contenido");
                n.estado = rs.getInt("estado");

                lista.add(n);
            }

        } catch (Exception e) {
            System.out.println("❌ Error listar novena: " + e.getMessage());
        }

        return lista;
    }


    // ======================================================
    // 🔵 OBTENER UN DÍA (PÚBLICO / ADMIN)
    // ======================================================
    public Novena obtenerPorDia(int dia) {

        Novena n = null;

        String sql = "SELECT * FROM novena WHERE dia = ? AND estado = 1";

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, dia);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                n = new Novena();
                n.id_nov = rs.getInt("id_nov");
                n.dia = rs.getInt("dia");
                n.titulo = rs.getString("titulo");
                n.imagen = rs.getString("imagen");
                n.contenido = rs.getString("contenido");
                n.estado = rs.getInt("estado");
            }

            ps.close();
            cx.getConexion().close();

        } catch (Exception e) {
            System.out.println("❌ Error obtener novena día: " + e.getMessage());
        }

        return n;
    }


    // ======================================================
    // 🔵 INSERTAR NUEVO DÍA
    // ======================================================
    public String insertar() {

        String sql = """
            INSERT INTO novena (dia, titulo, imagen, contenido, estado)
            VALUES (?, ?, ?, ?, 1)
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, dia);
            ps.setString(2, titulo);
            ps.setString(3, imagen);
            ps.setString(4, contenido);

            int filas = ps.executeUpdate();
            ps.close();
            cx.getConexion().close();

            return (filas > 0) ? "Día registrado correctamente"
                               : "No se pudo registrar";

        } catch (Exception e) {
            return "❌ Error al insertar: " + e.getMessage();
        }
    }


    // ======================================================
    // 🔵 ACTUALIZAR UN DÍA
    // ======================================================
    public String actualizar() {

        String sql = """
            UPDATE novena
            SET titulo=?, imagen=?, contenido=?
            WHERE dia=?
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setString(1, titulo);
            ps.setString(2, imagen);
            ps.setString(3, contenido);
            ps.setInt(4, dia);

            int filas = ps.executeUpdate();
            ps.close();
            cx.getConexion().close();

            return (filas > 0) ? "Día actualizado correctamente"
                               : "No se encontró el día";

        } catch (Exception e) {
            return "❌ Error al actualizar: " + e.getMessage();
        }
    }


    // ======================================================
    // 🔵 CAMBIAR ESTADO (ACTIVAR / DESACTIVAR)
    // ======================================================
    public String cambiarEstado(int dia, int nuevoEstado) {

        String sql = "UPDATE novena SET estado=? WHERE dia=?";

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, nuevoEstado);
            ps.setInt(2, dia);

            int filas = ps.executeUpdate();
            ps.close();
            cx.getConexion().close();

            if (filas > 0) {
                return (nuevoEstado == 1)
                        ? "Día activado correctamente"
                        : "Día desactivado correctamente";
            }

            return "No se encontró el día";

        } catch (Exception e) {
            return "❌ Error al cambiar estado: " + e.getMessage();
        }
    }

}
