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
                area.setNombreArea(rs.getString("nombreArea"));
                area.setDescripcionArea(rs.getString("descripcionArea"));
                areasList.add(area);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return areasList;
    }
}
