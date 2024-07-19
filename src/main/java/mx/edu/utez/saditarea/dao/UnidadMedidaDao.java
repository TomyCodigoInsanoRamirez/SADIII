package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.UnidadMedida;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
