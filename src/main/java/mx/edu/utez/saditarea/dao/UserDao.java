package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

        public Usuario getOne(String correo, String contrasena){
            Usuario u = new Usuario();

            System.out.println("HOLA DESDE EL DAO");
            System.out.println(correo);
            System.out.println(contrasena);

            String query = "select * from usuarios where correo = ? and contrasena = ?";
            try{
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, correo);
                ps.setString(2, contrasena);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    u.setCorreo(rs.getString("correo"));
                    System.out.println("INFO DEL CORREO:");
                    System.out.println(u.getCorreo());
                    u.setContrasena(rs.getString("contrasena"));
                    System.out.println("INFO DE LA CONTRA:");
                    System.out.println(u.getContrasena());
                }
            } catch (SQLException e){
                e.printStackTrace();
            }
            return u;
        }

}
