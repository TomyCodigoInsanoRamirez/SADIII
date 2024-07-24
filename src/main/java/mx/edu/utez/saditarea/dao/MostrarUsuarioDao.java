package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MostrarUsuarioDao {

    public List<Usuario> getAll() {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "SELECT idUsuario, correo, nombre1_U FROM usuarios";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getString("idUsuario"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setNombre1_U(rs.getString("nombre1_U"));

                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }
}
