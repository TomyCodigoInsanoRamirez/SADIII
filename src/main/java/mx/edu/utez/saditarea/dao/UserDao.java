package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    //obtener todos
    public ArrayList<Usuario> getAll(){
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = "select * from usuarios";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
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
                System.out.println("Nombre: "+u.getNombre1_U());
                System.out.println("Correo: "+u.getCorreo());
                System.out.println("Contrasena: "+u.getContrasena());
                System.out.println("Codigo: "+u.getCodigo());

                lista.add(u);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        return lista;
    }

}
