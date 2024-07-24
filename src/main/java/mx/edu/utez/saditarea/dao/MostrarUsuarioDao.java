package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MostrarUsuarioDao {

    public Usuario getOne(String correo, String contrasena){
        Usuario u = null;
        String query = "SELECT idUsuario, correo, nombre1_U, apellido1_U, nombre2_U, apellido2_U, telefono, contrasena, estado, codigo FROM usuarios WHERE correo = ? AND contrasena = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario(
                        rs.getString("idUsuario"),
                        rs.getString("correo"),
                        rs.getString("nombre1_U"),
                        rs.getString("apellido1_U"),
                        rs.getString("nombre2_U"),
                        rs.getString("apellido2_U"),
                        rs.getString("telefono"),
                        rs.getString("contrasena"),
                        rs.getBoolean("estado"),
                        rs.getString("codigo")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
}
