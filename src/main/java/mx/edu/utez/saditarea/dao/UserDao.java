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
    /*
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
*/
    public Usuario getOne(String correo, String contrasena) {
        Usuario usuario = new Usuario();
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();// obtener conexión
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setRol(rs.getString("rol")); // Obtenemos el tipo de usuario
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
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
                u.setEstado(rs.getInt("estado"));

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
                u.setEstado(rs.getInt("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    // Actualizar un usuario (incluyendo nombre y apellido)
    public boolean update(Usuario usuario) {
        boolean isUpdated = false;
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement pst = con.prepareStatement("UPDATE Usuarios SET correo=?, nombre1_U=?, apellido1_U=?, nombre2_U=?, apellido2_U=?, telefono=?, contrasena=?, estado=?, codigo=?, rol=? WHERE id=?")) {
            pst.setString(1, usuario.getCorreo());
            pst.setString(2, usuario.getNombre1_U());
            pst.setString(3, usuario.getApellido1_U());
            pst.setString(4, usuario.getNombre2_U());
            pst.setString(5, usuario.getApellido2_U());
            pst.setString(6, usuario.getTelefono());
            pst.setString(7, usuario.getContrasena());
            pst.setString(9, usuario.getCodigo());
            pst.setString(10, usuario.getRol());
            pst.setString(11, usuario.getId());
            isUpdated = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
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
    public boolean updateOn(String id){
        boolean flag = false;
        String query = "update usuarios set estado = 1 where id_empleado=?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,id);
            if (ps.executeUpdate()>0){
                //Que si se hizo la modificacion o modificaciones
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
    public boolean updateOf(String id){
        boolean flag = false;
        String query = "update usuarios set estado = 0 where id_empleado=?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,id);
            if (ps.executeUpdate()>0){
                //Que si se hizo la modificacion o modificaciones
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
}
