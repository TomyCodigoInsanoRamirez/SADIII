package mx.edu.utez.saditarea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public class UserDao {

        public User getOne(String user, String contrasena){
            User u = new User();
            String query = "select * from Usuarios where user = ? and contrasena = sha2(?,256)";
            try{
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, user);
                ps.setString(2, contrasena);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    u.setNombre(rs.getString("user"));
                    u.setContra(rs.getString("contrasena"));
                }
            } catch (SQLException e){
                e.printStackTrace();
            }
            return u;
        }

        public boolean insert(User u){
            boolean respuesta = false;
            String query = "insert into Usuarios(nombre,correo,contra) values(?,?,sha2(?,256))";
            try{
                //1)Conectarme a la BD
                Connection con = DatabaseConnectionManager.getConnection();
                //2)Preparar la query
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1,u.getNombre());
                ps.setString(2,u.getCorreo());
                ps.setString(3,u.getContra());
                //3)Ejecutar el query
                if(ps.executeUpdate()>0){
                    respuesta = true;
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
            return respuesta;
        }

    }
}
