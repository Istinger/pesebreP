package com.productos.seguridad;

import java.sql.*;
import com.productos.datos.Conexion;

public class Usuario {

    private int id;
    private int perfil;       // 1=ADMIN, 2=ESTUDIANTE
    private int estado;       // 1=ACTIVO, 2=BLOQUEADO
    private String cedula;
    private String nombre;
    private String correo;
    private String clave;

    // ================== CONSTRUCTOR ==================
    public Usuario() {}

    // ================== GETTERS / SETTERS ==================
    public int getId() { return id; }
    public int getPerfil() { return perfil; }
    public int getEstado() { return estado; }
    public String getCedula() { return cedula; }
    public String getNombre() { return nombre; }
    public String getCorreo() { return correo; }
    public String getClave() { return clave; }

    public void setId(int id) { this.id = id; }
    public void setPerfil(int perfil) { this.perfil = perfil; }
    public void setEstado(int estado) { this.estado = estado; }
    public void setCedula(String cedula) { this.cedula = cedula; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setCorreo(String correo) { this.correo = correo; }
    public void setClave(String clave) { this.clave = clave; }

    // ================== LOGIN ==================
    public boolean verificarUsuario(String email, String pass) {

        String sql = "SELECT * FROM tb_usuario WHERE correo_us=? AND clave_us=?";

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Si está bloqueado no ingresa
                if (rs.getInt("id_est") == 2) {
                    return false;
                }

                this.id = rs.getInt("id_us");
                this.perfil = rs.getInt("id_per");
                this.estado = rs.getInt("id_est");
                this.nombre = rs.getString("nombre_us");
                this.cedula = rs.getString("cedula_us");
                this.correo = rs.getString("correo_us");
                this.clave = rs.getString("clave_us");

                return true;
            }

        } catch (Exception e) {
            System.out.println("Error en verificarUsuario: " + e.getMessage());
        }

        return false;
    }

    // ================== REGISTRAR ESTUDIANTE ==================
    public String ingresarCliente() {

        String sql = 
            "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) " +
            "VALUES (2, 1, ?, ?, ?, ?)";   // Perfil 2 = estudiante

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setString(1, this.nombre);
            ps.setString(2, this.cedula);
            ps.setString(3, this.correo);
            ps.setString(4, this.clave);

            int filas = ps.executeUpdate();

            return (filas > 0) ? "Inserción correcta" : "Error en inserción";

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    // ================== REGISTRAR EMPLEADO / ADMIN ==================
    public String ingresarEmpleado() {

        String sql = 
            "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) " +
            "VALUES (?, 1, ?, ?, ?, ?)";

        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(sql);

            ps.setInt(1, this.perfil);   // perfil enviado: admin o empleado
            ps.setString(2, this.nombre);
            ps.setString(3, this.cedula);
            ps.setString(4, this.correo);
            ps.setString(5, this.clave);

            int filas = ps.executeUpdate();
            return (filas > 0) ? "Empleado registrado" : "Error al registrar empleado";

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    // ================== CONSULTA LISTA USUARIOS (ADMIN) ==================
    public String consultarUsuarios() {

        Conexion con = new Conexion();
        ResultSet rs = null;
        StringBuilder tabla = new StringBuilder();

        tabla.append("<div class='table-responsive'>")
             .append("<table class='table table-striped table-hover'>")
             .append("<thead class='table-dark'><tr>")
             .append("<th>ID</th><th>Nombre</th><th>Cédula</th><th>Correo</th>")
             .append("<th>Perfil</th><th>Estado</th><th>Acciones</th>")
             .append("</tr></thead><tbody>");

        try {
            String sql = """
                SELECT u.id_us, u.nombre_us, u.cedula_us, u.correo_us,
                       p.descripcion_per, e.descripcion_est
                FROM tb_usuario u
                JOIN tb_perfil p ON u.id_per = p.id_per
                JOIN tb_estado_usuario e ON u.id_est = e.id_est
                ORDER BY u.id_us;
            """;

            rs = con.Consulta(sql);

            if (rs == null) {
                tabla.append("<tr><td colspan='7' class='text-danger text-center'>")
                     .append("Error: la consulta SQL retornó NULL (verifique nombres de tablas)")
                     .append("</td></tr>");
            } else {
                while (rs.next()) {
                    tabla.append("<tr>")
                         .append("<td>").append(rs.getInt("id_us")).append("</td>")
                         .append("<td>").append(rs.getString("nombre_us")).append("</td>")
                         .append("<td>").append(rs.getString("cedula_us")).append("</td>")
                         .append("<td>").append(rs.getString("correo_us")).append("</td>")
                         .append("<td>").append(rs.getString("descripcion_per")).append("</td>")
                         .append("<td>").append(rs.getString("descripcion_est")).append("</td>")
                         .append("<td>")
                         .append("<a href='editarUsuario.jsp?id=" + rs.getInt("id_us") + "' class='btn btn-warning btn-sm'>Editar</a> ")
                         .append("<button class='btn btn-sm btn-outline-danger' onclick=\"cambiarEstado(" 
                                 + rs.getInt("id_us") + ", '" + rs.getString("descripcion_est") + "')\">"
                                 + "<i class='fa-solid fa-ban'></i> "
                                 + (rs.getString("descripcion_est").equals("Activo") ? "Bloquear" : "Activar")
                                 + "</button>")
                         .append("</td></tr>");
                }
            }

        } catch (Exception ex) {
            tabla.append("<tr><td colspan='7'>Error: ").append(ex.getMessage()).append("</td></tr>");
        }

        tabla.append("</tbody></table></div>");
        return tabla.toString();
    }
    
    public int obtenerIdPorCorreo(String correo){
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "SELECT id_us FROM tb_usuario WHERE correo_us=?"
            );
            ps.setString(1, correo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) return rs.getInt("id_us");

        } catch (Exception e) {
            System.out.println("Error obtenerIdPorCorreo: " + e.getMessage());
        }
        return 0;
    }



    public String actualizarEstado(int id, int nuevoEstado) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps = cx.getConexion().prepareStatement(
                "UPDATE tb_usuario SET id_est=? WHERE id_us=?"
            );

            ps.setInt(1, nuevoEstado);
            ps.setInt(2, id);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                return nuevoEstado == 1 ? "Usuario activado correctamente"
                                        : "Usuario bloqueado correctamente";
            } else {
                return "No se encontró el usuario.";
            }

        } catch (Exception e) {
            return "Error al cambiar estado: " + e.getMessage();
        }
    }


    // ================== BUSCAR POR ID ==================
    public Usuario buscarUsuarioPorId(String id) {

        Usuario user = null;
        Conexion con = new Conexion();
        ResultSet rs = null;

        try {
            String sql =
                "SELECT * FROM tb_usuario WHERE id_us = ?";

            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new Usuario();
                user.id = rs.getInt("id_us");
                user.perfil = rs.getInt("id_per");
                user.estado = rs.getInt("id_est");
                user.nombre = rs.getString("nombre_us");
                user.cedula = rs.getString("cedula_us");
                user.correo = rs.getString("correo_us");
                user.clave = rs.getString("clave_us");
            }

        } catch (Exception e) {
            System.out.println("Error buscarUsuarioPorId: " + e.getMessage());
        }

        return user;
    }

    // ================== ACTUALIZAR ==================
    public String actualizarUsuario(Usuario user) {
        try {
            Conexion con = new Conexion();
            PreparedStatement ps = con.getConexion().prepareStatement(
                "UPDATE tb_usuario SET id_per=?, id_est=?, nombre_us=?, cedula_us=?, correo_us=?, clave_us=? WHERE id_us=?"
            );

            ps.setInt(1, user.getPerfil());
            ps.setInt(2, user.getEstado());
            ps.setString(3, user.getNombre());
            ps.setString(4, user.getCedula());
            ps.setString(5, user.getCorreo());
            ps.setString(6, user.getClave());
            ps.setInt(7, user.getId());

            int filas = ps.executeUpdate();
            return (filas > 0) ? "Usuario actualizado" : "No se pudo actualizar";

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    // ================== ELIMINAR ==================
    public String eliminarUsuario(String id) {
        try {
            Conexion cx = new Conexion();
            PreparedStatement ps =
                cx.getConexion().prepareStatement("DELETE FROM tb_usuario WHERE id_us=?");

            ps.setInt(1, Integer.parseInt(id));

            int filas = ps.executeUpdate();
            return (filas > 0) ? "Usuario eliminado" : "No se encontró el usuario";

        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

}
