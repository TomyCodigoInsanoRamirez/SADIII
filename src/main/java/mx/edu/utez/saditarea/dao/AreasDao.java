package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Areas;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AreasDao {

    public boolean save(Areas area) {
        boolean rowInserted = false;
        String query = "INSERT INTO areas (nombreArea, descripcionArea) VALUES (?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, area.getNombreArea());
            ps.setString(2, area.getDescripcionArea());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Areas> getAll() {
        List<Areas> areasList = new ArrayList<>();
        String query = "SELECT * FROM areas";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Areas area = new Areas();
                area.setClaveArea(rs.getString("claveArea"));
                area.setNombreArea(rs.getString("nombreArea"));
                area.setDescripcionArea(rs.getString("descripcionArea"));
                area.setEstadoA(rs.getInt("estado_ar"));
                areasList.add(area);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return areasList;
    }
    public boolean updateOn(String id){
        boolean flag = false;
        String query = "update areas set estado_ar = 1 where claveArea=?";
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
        String query = "update areas set estado_ar = 0 where claveArea=?";
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
