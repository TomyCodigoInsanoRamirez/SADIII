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

    // Método para guardar una nueva unidad de medida
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

    // Método para actualizar una unidad de medida
    public boolean update(UnidadMedida unidadMedida) {
        boolean rowUpdated = false;
        String query = "UPDATE Unidad_Medida SET nombreUnidadMedida = ? WHERE abreviacionUnidadMedida = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, unidadMedida.getNombreUnidadMedida());
            ps.setString(2, unidadMedida.getAbreviacionUndidadMedida());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    // Método para obtener todas las unidades de medida
    public List<UnidadMedida> getAll() {
        List<UnidadMedida> unidadesMedida = new ArrayList<>();
        String query = "SELECT * FROM Unidad_Medida";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String abreviacion = rs.getString("abreviacionUnidadMedida");
                String nombre = rs.getString("nombreUnidadMeidida");
                int estado = rs.getInt("estado_um"); // Preservado de la primera versión
                UnidadMedida unidad = new UnidadMedida(abreviacion, nombre, estado);
                unidadesMedida.add(unidad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unidadesMedida;
    }

    // Método para activar una unidad de medida (cambiar estado a 1)
    public boolean updateOn(String id) {
        boolean flag = false;
        String query = "UPDATE Unidad_Medida SET estado_um = 1 WHERE abreviacionUnidadMedida = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Método para desactivar una unidad de medida (cambiar estado a 0)
    public boolean updateOf(String id) {
        boolean flag = false;
        String query = "UPDATE Unidad_Medida SET estado_um = 0 WHERE abreviacionUnidadMedida = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, id);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
