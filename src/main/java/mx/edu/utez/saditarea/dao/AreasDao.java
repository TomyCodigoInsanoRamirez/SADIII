package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Areas;
import mx.edu.utez.saditarea.modelo.Usuario;
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
        String query = "INSERT INTO Areas (claveArea, nombreArea, descripcionArea, estado_ar) VALUES (?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, area.getClaveArea());
            ps.setString(2, area.getNombreArea());
            ps.setString(3, area.getDescripcionArea());
            ps.setInt(4, area.getEstadoAr());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Areas> getAll() {
        List<Areas> areasList = new ArrayList<>();
        String query = "SELECT * FROM Areas";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Areas area = new Areas();
                area.setClaveArea(rs.getString("claveArea"));
                area.setNombreArea(rs.getString("nombreArea"));
                area.setDescripcionArea(rs.getString("descripcionArea"));
                area.setEstadoAr(rs.getInt("estado_ar"));
                areasList.add(area);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return areasList;
    }

    public boolean updateOn(String id) {
        boolean flag = false;
        String query = "UPDATE Areas SET estado_ar = 1 WHERE claveArea = ?";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updateOf(String id) {
        boolean flag = false;
        String query = "UPDATE Areas SET estado_ar = 0 WHERE claveArea = ?";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean update(Areas area) {
        boolean rowUpdated = false;
        String query = "UPDATE Areas SET nombreArea = ?, descripcionArea = ? WHERE claveArea = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, area.getNombreArea());
            ps.setString(2, area.getDescripcionArea());
            ps.setString(3, area.getClaveArea());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public String getNameArea(String id){
        Areas area = new Areas();
        String sql = "SELECT * FROM Areas WHERE claveArea = ?";
        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();// obtener conexión
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                area.setNombreArea(rs.getString("nombreArea"));
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return area.getNombreArea();
    }
}
