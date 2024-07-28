package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.UnidadMedida;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UnidadMedidaDao {

    public boolean save(UnidadMedida unidadMedida) {
        boolean rowInserted = false;
        String query = "INSERT INTO Unidad_Medida (abreviacionUnidadMedida, nombreUnidadMedida) VALUES (?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, unidadMedida.getAbreviacionUndidadMedida());
            ps.setString(2, unidadMedida.getNombreUnidadMedida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<UnidadMedida> getAll() {
        List<UnidadMedida> unidadesMedida = new ArrayList<>();
        String query = "SELECT * FROM Unidad_Medida";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String abreviacion = rs.getString("abreviacionUnidadMedida");
                String nombre = rs.getString("nombreUnidadMeidida");
                int estado = rs.getInt("estado_um");
                UnidadMedida unidad = new UnidadMedida(abreviacion, nombre,estado);
                unidadesMedida.add(unidad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unidadesMedida;
    }
    public boolean updateOn(String id){
        boolean flag = false;
        String query = "update unidad_medida set estado_um = 1 where abreviacionUnidadMedida=?";
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
        String query = "update unidad_medida set estado_um = 0 where abreviacionUnidadMedida=?";
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
