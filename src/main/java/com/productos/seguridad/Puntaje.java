package com.productos.seguridad;

import java.sql.*;
import java.util.*;
import com.productos.datos.Conexion;

public class Puntaje {

    private int id;
    private int idUsuario;
    private int puntaje;
    private String fecha;
    private String nombreUsuario;

    // ==========================
    // GETTERS
    // ==========================
    public int getId() { return id; }
    public int getIdUsuario() { return idUsuario; }
    public int getPuntaje() { return puntaje; }
    public String getFecha() { return fecha; }
    public String getNombreUsuario() { return nombreUsuario; }

    // ==========================
    // SETTERS
    // ==========================
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }
    public void setPuntaje(int puntaje) { this.puntaje = puntaje; }

    // ============================================================
    // INSERTAR PUNTAJE (DESPUÉS DE JUGAR)
    // ============================================================
    public String registrarPuntaje(int idUsuario, int puntaje) {

        String sql = """
            INSERT INTO puntaje (id_us, puntaje)
            VALUES (?, ?)
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, idUsuario);
            ps.setInt(2, puntaje);

            int filas = ps.executeUpdate();

            ps.close();
            cx.getConexion().close();

            return (filas > 0) ? "Puntaje guardado" : "Error al guardar puntaje";

        } catch (Exception e) {
            return "Error registrar puntaje: " + e.getMessage();
        }
    }

    // ============================================================
    // TOP 10 GLOBAL
    // ============================================================
    public List<Puntaje> top10() {
        List<Puntaje> lista = new ArrayList<>();

        String sql = """
            SELECT p.id_score, p.id_us, p.puntaje, p.fecha_juego,
                   u.nombre_us
            FROM puntaje p
            JOIN tb_usuario u ON p.id_us = u.id_us
            ORDER BY p.puntaje DESC, p.fecha_juego ASC
            LIMIT 10;
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Puntaje p = new Puntaje();

                p.id = rs.getInt("id_score");
                p.idUsuario = rs.getInt("id_us");
                p.puntaje = rs.getInt("puntaje");
                p.fecha = rs.getString("fecha_juego");
                p.nombreUsuario = rs.getString("nombre_us");

                lista.add(p);
            }

            rs.close();
            ps.close();
            cx.getConexion().close();

        } catch (Exception e) {
            System.out.println("Error top10: " + e.getMessage());
        }

        return lista;
    }

    // ============================================================
    // PUNTAJES DE UN USUARIO
    // ============================================================
    public List<Puntaje> puntajesDeUsuario(int idUsuario) {
        List<Puntaje> lista = new ArrayList<>();

        String sql = """
            SELECT id_score, puntaje, fecha_juego
            FROM puntaje
            WHERE id_us = ?
            ORDER BY fecha_juego DESC;
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, idUsuario);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Puntaje p = new Puntaje();
                p.id = rs.getInt("id_score");
                p.puntaje = rs.getInt("puntaje");
                p.fecha = rs.getString("fecha_juego");
                p.idUsuario = idUsuario;

                lista.add(p);
            }

            rs.close();
            ps.close();
            cx.getConexion().close();

        } catch (Exception e) {
            System.out.println("Error puntajes usuario: " + e.getMessage());
        }

        return lista;
    }

    // ============================================================
    // ULTIMOS PUNTAJES DEL SISTEMA (OPCIONAL PARA ADMIN)
    // ============================================================
    public List<Puntaje> ultimosPuntajes() {
        List<Puntaje> lista = new ArrayList<>();

        String sql = """
            SELECT p.id_score, p.id_us, p.puntaje, p.fecha_juego,
                   u.nombre_us
            FROM puntaje p
            JOIN tb_usuario u ON p.id_us = u.id_us
            ORDER BY p.fecha_juego DESC
            LIMIT 20;
        """;

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Puntaje p = new Puntaje();

                p.id = rs.getInt("id_score");
                p.idUsuario = rs.getInt("id_us");
                p.puntaje = rs.getInt("puntaje");
                p.fecha = rs.getString("fecha_juego");
                p.nombreUsuario = rs.getString("nombre_us");

                lista.add(p);
            }

            rs.close();
            ps.close();
            cx.getConexion().close();

        } catch (Exception e) {
            System.out.println("Error ultimos puntajes: " + e.getMessage());
        }

        return lista;
    }

}
