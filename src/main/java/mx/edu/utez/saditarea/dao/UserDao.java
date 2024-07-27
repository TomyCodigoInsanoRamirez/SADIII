package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {

    // Obtener un usuario por correo y contraseña para el inicio de sesión
    public Usuario getOne(String correo, String contrasena) {
        Usuario u = new Usuario();
        String query = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasena"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    // Obtener todos los usuarios
    public ArrayList<Usuario> getAll() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = "SELECT * FROM usuarios";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getString("id_empleado"));
                u.setNombre1_U(rs.getString("nombre1_U"));
                u.setNombre2_U(rs.getString("nombre2_U"));
                u.setApellido1_U(rs.getString("apellido1_U"));
                u.setApellido2_U(rs.getString("apellido2_U"));
                u.setTelefono(rs.getString("telefono_U"));
                u.setRol(rs.getString("rol"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasena"));
                u.setCodigo(rs.getString("codigo"));
                u.setEstado(rs.getBoolean("estado"));

                lista.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Obtener un usuario por ID
    public Usuario getById(String id) {
        Usuario u = null;
        String query = "SELECT * FROM usuarios WHERE id_empleado = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getString("id_empleado"));
                u.setNombre1_U(rs.getString("nombre1_U"));
                u.setNombre2_U(rs.getString("nombre2_U"));
                u.setApellido1_U(rs.getString("apellido1_U"));
                u.setApellido2_U(rs.getString("apellido2_U"));
                u.setTelefono(rs.getString("telefono_U"));
                u.setRol(rs.getString("rol"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasena"));
                u.setCodigo(rs.getString("codigo"));
                u.setEstado(rs.getBoolean("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    // Actualizar un usuario (incluyendo nombre y apellido)
    public void update(Usuario usuario) {
        String query = "UPDATE usuarios SET nombre1_U = ?, nombre2_U = ?, apellido1_U = ?, apellido2_U = ?, telefono_U = ?, correo = ? WHERE id_empleado = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, usuario.getNombre1_U());
            ps.setString(2, usuario.getNombre2_U());
            ps.setString(3, usuario.getApellido1_U());
            ps.setString(4, usuario.getApellido2_U());
            ps.setString(5, usuario.getTelefono());
            ps.setString(6, usuario.getCorreo());
            ps.setString(7, usuario.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Actualizar la contraseña del usuario
    public void updatePassword(String id, String nuevaContrasena) {
        String query = "UPDATE usuarios SET contrasena = ? WHERE id_empleado = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nuevaContrasena);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
