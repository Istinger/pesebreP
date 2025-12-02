package com.productos.seguridad;

import java.sql.*;
import java.util.*;
import com.productos.datos.Conexion;

public class Villancico {

    private int id;
    private String titulo;
    private String imagen;
    private String audio;
    private String letra;
    private int estado;

    // ====== GETTERS ======
    public int getId() { return id; }
    public String getTitulo() { return titulo; }
    public String getImagen() { return imagen; }
    public String getAudio() { return audio; }
    public String getLetra() { return letra; }
    public int getEstado() { return estado; }

    // ====== SETTERS ======
    public void setTitulo(String t) { this.titulo = t; }
    public void setImagen(String i) { this.imagen = i; }
    public void setAudio(String a) { this.audio = a; }
    public void setLetra(String l) { this.letra = l; }
    public void setEstado(int e) { this.estado = e; }

    // ============================================================
    // OBTENER POR ID
    // ============================================================
    public Villancico obtenerPorId(int id) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "SELECT * FROM villancico WHERE id_vill=?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Villancico v = new Villancico();
                v.id = rs.getInt("id_vill");
                v.titulo = rs.getString("titulo");
                v.imagen = rs.getString("imagen");
                v.audio = rs.getString("audio");
                v.letra = rs.getString("letra");
                v.estado = rs.getInt("estado");
                return v;
            }
        } catch (Exception e) {
            System.out.println("Error obtener villancico: " + e.getMessage());
        }
        return null;
    }

    // ============================================================
    // LISTAR TODOS (ADMIN)
    // ============================================================
    public List<Villancico> listarTodos() {
        List<Villancico> lista = new ArrayList<>();

        try {
            Conexion cx = new Conexion();
            ResultSet rs = cx.Consulta("SELECT * FROM villancico ORDER BY id_vill ASC");

            while (rs.next()) {
                Villancico v = new Villancico();
                v.id = rs.getInt("id_vill");
                v.titulo = rs.getString("titulo");
                v.imagen = rs.getString("imagen");
                v.audio = rs.getString("audio");
                v.letra = rs.getString("letra");
                v.estado = rs.getInt("estado");

                lista.add(v);
            }
        } catch (Exception e) {
            System.out.println("Error listarTodos: " + e.getMessage());
        }

        return lista;
    }

    // ============================================================
    // LISTAR ACTIVOS PARA EL USUARIO INVITADO
    // ============================================================
    public List<Villancico> listarActivos() {
        List<Villancico> lista = new ArrayList<>();

        try {
            Conexion cx = new Conexion();
            ResultSet rs = cx.Consulta("SELECT * FROM villancico WHERE estado=1 ORDER BY id_vill");

            while (rs.next()) {
                Villancico v = new Villancico();
                v.id = rs.getInt("id_vill");
                v.titulo = rs.getString("titulo");
                v.imagen = rs.getString("imagen");
                v.audio = rs.getString("audio");
                v.letra = rs.getString("letra");
                v.estado = rs.getInt("estado");

                lista.add(v);
            }
        } catch (Exception e) {
            System.out.println("Error listarActivos: " + e.getMessage());
        }

        return lista;
    }

    // ============================================================
    // INSERTAR
    // ============================================================
    public String insertar() {
        try {
            Conexion cx = new Conexion();

            PreparedStatement ps = cx.getConexion().prepareStatement(
                "INSERT INTO villancico (titulo, imagen, audio, letra, estado) " +
                "VALUES (?, ?, ?, ?, 1)"
            );

            ps.setString(1, titulo);
            ps.setString(2, imagen);
            ps.setString(3, audio);
            ps.setString(4, letra);

            return ps.executeUpdate() > 0
                ? "Villancico registrado"
                : "No se pudo registrar villancico";

        } catch (Exception e) {
            return "Error insertar: " + e.getMessage();
        }
    }

    // ============================================================
    // ACTUALIZAR
    // ============================================================
    public String actualizar(int id) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "UPDATE villancico SET titulo=?, imagen=?, audio=?, letra=? WHERE id_vill=?"
            );

            ps.setString(1, titulo);
            ps.setString(2, imagen);
            ps.setString(3, audio);
            ps.setString(4, letra);
            ps.setInt(5, id);

            return ps.executeUpdate() > 0
                ? "Villancico actualizado"
                : "Error al actualizar";

        } catch (Exception e) {
            return "Error actualizar: " + e.getMessage();
        }
    }

    // ============================================================
    // CAMBIAR ESTADO
    // ============================================================
    public String cambiarEstado(int id, int nuevoEstado) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "UPDATE villancico SET estado=? WHERE id_vill=?"
            );

            ps.setInt(1, nuevoEstado);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0
                ? "Estado actualizado"
                : "Error al cambiar estado";

        } catch (Exception e) {
            return "Error cambiar estado: " + e.getMessage();
        }
    }
}
