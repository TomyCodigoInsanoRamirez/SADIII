package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Proveedores;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProveedoresDao {

    public boolean save(Proveedores proveedor) {
        boolean rowInserted = false;
        String query = "INSERT INTO Proveedores (RFC, razon_social, codigo_postal_P, direccion, nombre1_P, nombre2_P, apellido1_P, apellido2_P, telefono_P, nombre1_adicional, nombre2_adicional, apellido1_adicional, apellido2_adicional, telefono_adicional) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, proveedor.getRFC());
            ps.setString(2, proveedor.getRazon_social());
            ps.setString(3, proveedor.getCodigo_postal());
            ps.setString(4, proveedor.getDirrecion());
            ps.setString(5, proveedor.getNombre1_P());
            ps.setString(6, proveedor.getNombre2_P());
            ps.setString(7, proveedor.getApellido1_P());
            ps.setString(8, proveedor.getApellido2_P());
            ps.setString(9, proveedor.getTelefono_P());
            ps.setString(10, proveedor.getNombre1_Adicional());
            ps.setString(11, proveedor.getNombre2_Adicional());
            ps.setString(12, proveedor.getApellido1_Adicional());
            ps.setString(13, proveedor.getApellido2_Adicional());
            ps.setString(14, proveedor.getTelefono_Adicional());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }
}
