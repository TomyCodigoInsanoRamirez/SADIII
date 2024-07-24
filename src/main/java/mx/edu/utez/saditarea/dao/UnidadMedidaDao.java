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
        String query = "SELECT abreviacionUnidadMedida, nombreUnidadMedida FROM Unidad_Medida";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String abreviacion = rs.getString("abreviacionUnidadMedida");
                String nombre = rs.getString("nombreUnidadMedida");
                UnidadMedida unidad = new UnidadMedida(abreviacion, nombre);
                unidadesMedida.add(unidad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unidadesMedida;
    }
}
