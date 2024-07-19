package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Areas;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AreasDao {

    public boolean save(Areas area) {
        boolean rowInserted = false;
        String query = "INSERT INTO Areas (nombreArea, descripcionArea) VALUES (?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, area.getNombreArea());
            ps.setString(2, area.getDescripcionArea());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }
}
