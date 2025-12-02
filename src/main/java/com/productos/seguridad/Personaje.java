package com.productos.seguridad;

import java.sql.*;
import java.util.*;

import com.productos.datos.Conexion;

public class Personaje {

    private int id;
    private String nombre;
    private String descripcion;
    private String imagen;
    private int estado;
    private String detalle;

    
    public Personaje() {}

    // ==================== GETTERS ====================
    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public String getDescripcion() { return descripcion; }
    public String getImagen() { return imagen; }
    public int getEstado() { return estado; }
    public String getDetalle() { return detalle; }

    // ==================== SETTERS ====================
    public void setNombre(String n) { this.nombre = n; }
    public void setDescripcion(String d) { this.descripcion = d; }
    public void setImagen(String i) { this.imagen = i; }
    public void setId(int id) { this.id = id; }
    public void setEstado(int estado) { this.estado = estado; }
    public void setDetalle(String d) { this.detalle = d; }

    // ============================================================
    // OBTENER PERSONAJE POR ID
    // ============================================================
    public Personaje obtenerPorId(int id) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "SELECT * FROM personaje WHERE id_perse=?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Personaje p = new Personaje();
                p.id = rs.getInt("id_perse");
                p.nombre = rs.getString("nombre");
                p.descripcion = rs.getString("descripcion");
                p.imagen = rs.getString("imagen");
                p.estado = rs.getInt("estado");
                return p;
            }
        } catch (Exception e) {
            System.out.println("Error obtener personaje: " + e.getMessage());
        }
        return null;
    }

    // ============================================================
    // CONSULTAR TODOS (ADMIN)
    // ============================================================
    public ResultSet consultarTodos() {
        try {
            Conexion cx = new Conexion();
            return cx.Consulta(
                "SELECT * FROM personaje ORDER BY id_perse ASC"
            );
        } catch (Exception e) {
            return null;
        }
    }

    // ============================================================
    // INSERTAR PERSONAJE
    // ============================================================
    public String insertar() {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "INSERT INTO personaje (nombre, descripcion, imagen, estado) VALUES (?, ?, ?, 1)"
            );
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setString(3, imagen);

            return ps.executeUpdate() > 0 ? "Personaje registrado" : "Error en inserción";
        } catch (Exception e) {
            return "Error insertar: " + e.getMessage();
        }
    }

    // ============================================================
    // ACTUALIZAR PERSONAJE
    // ============================================================
    public String actualizar(int id) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "UPDATE personaje SET nombre=?, descripcion=?, imagen=? WHERE id_perse=?"
            );
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setString(3, imagen);
            ps.setInt(4, id);

            return ps.executeUpdate() > 0 ? "Actualizado correctamente" :
                                            "No se pudo actualizar";
        } catch (Exception e) {
            return "Error actualizar: " + e.getMessage();
        }
    }

    // ============================================================
    // CAMBIAR ESTADO (activar/desactivar)
    // ============================================================
    public String cambiarEstado(int id, int nuevoEstado) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "UPDATE personaje SET estado=? WHERE id_perse=?"
            );
            ps.setInt(1, nuevoEstado);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0 
                ? "Estado actualizado" 
                : "Error al actualizar estado";

        } catch (Exception e) {
            return "Error cambiar estado: " + e.getMessage();
        }
    }
    public ResultSet consultarActivos() {
        try {
            Conexion cx = new Conexion();
            return cx.Consulta(
                "SELECT * FROM personaje WHERE estado = 1 ORDER BY id_perse ASC"
            );
        } catch (Exception e) {
            System.out.println("Error consultarActivos: " + e.getMessage());
            return null;
        }
    }
    
    public List<Personaje> listarActivos() {
        List<Personaje> lista = new ArrayList<>();

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "SELECT * FROM personaje WHERE estado = 1 ORDER BY id_perse ASC"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Personaje p = new Personaje();
                p.id = rs.getInt("id_perse");
                p.nombre = rs.getString("nombre");
                p.descripcion = rs.getString("descripcion");
                p.imagen = rs.getString("imagen");
                p.estado = rs.getInt("estado");
                lista.add(p);
            }

            rs.close();
            ps.close();
            cx.getConexion().close();

        } catch (Exception e) {
            System.out.println("Error listarActivos: " + e.getMessage());
        }

        return lista;
    }



}
