package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Proveedores;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProveedoresDao {

    public List<Proveedores> findAll() {
        List<Proveedores> proveedores = new ArrayList<>();
        String query = "SELECT * FROM Proveedores";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Proveedores proveedor = new Proveedores(
                        rs.getString("RFC"),
                        rs.getString("razon_social"),
                        rs.getString("codigo_postal_P"),
                        rs.getString("direccion"),
                        rs.getString("nombre1_P"),
                        rs.getString("nombre2_P"),
                        rs.getString("apellido1_P"),
                        rs.getString("apellido2_P"),
                        rs.getString("telefono_P"),
                        rs.getString("nombre1_adicional"),
                        rs.getString("nombre2_adicional"),
                        rs.getString("apellido1_adicional"),
                        rs.getString("apellido2_adicional"),
                        rs.getString("telefono_adicional"),
                        rs.getInt("estado_usu")
                );
                proveedores.add(proveedor);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return proveedores;
    }

    public Proveedores findByRFC(String rfc) {
        String query = "SELECT * FROM Proveedores WHERE RFC = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, rfc);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Proveedores(
                        rs.getString("RFC"),
                        rs.getString("razon_social"),
                        rs.getString("codigo_postal"),
                        rs.getString("direccion"),
                        rs.getString("nombre1_P"),
                        rs.getString("nombre2_P"),
                        rs.getString("apellido1_P"),
                        rs.getString("apellido2_P"),
                        rs.getString("telefono_P"),
                        rs.getString("nombre1_adicional"),
                        rs.getString("nombre2_adicional"),
                        rs.getString("apellido1_adicional"),
                        rs.getString("apellido2_adicional"),
                        rs.getString("telefono_adicional"),
                        rs.getInt("estado_usu")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean save(Proveedores proveedor) {
        String query = "INSERT INTO Proveedores (RFC, razon_social, codigo_postal_P, direccion, nombre1_P, nombre2_P, apellido1_P, apellido2_P, telefono_P, nombre1_adicional, nombre2_adicional, apellido1_adicional, apellido2_adicional, telefono_adicional, estado_usu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, proveedor.getRFC());
            ps.setString(2, proveedor.getRazon_social());
            ps.setString(3, proveedor.getCodigo_postal());
            ps.setString(4, proveedor.getDireccion());
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
            ps.setInt(15, proveedor.getEstado_usu());

            int filasAfectadas = ps.executeUpdate();
            System.out.println("El save de proveedor regresa: "+filasAfectadas);
            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Proveedores proveedor) {
        String query = "UPDATE Proveedores SET RFC = ?, razon_social = ? ,codigo_postal_P = ?,direccion =?, nombre1_P = ?, nombre2_P =?,apellido1_P=?,apellido2_P=?, telefono_P = ?,nombre1_adicional =?,nombre2_adicional=?,apellido1_adicional=?,apellido2_adicional =?,telefono_adicional=?, estado_usu = ? WHERE RFC = ?";

        System.out.println("RFC:+" + proveedor.getRFC());
        System.out.println("Razon_social:+" + proveedor.getRazon_social());
        System.out.println("Codigo_postal:+" + proveedor.getCodigo_postal());
        System.out.println("Direccion:+" + proveedor.getDireccion());
        System.out.println("Nombre1_P:+" + proveedor.getNombre1_P());
        System.out.println("Nombre2_P:+" + proveedor.getNombre2_P());
        System.out.println("Apellido1_P:+" + proveedor.getApellido1_P());
        System.out.println("Apellido2_P:+" + proveedor.getApellido2_P());
        System.out.println("Telefono_P:+" + proveedor.getTelefono_P());
        System.out.println("Nombre1_Adicional:+" + proveedor.getNombre1_Adicional());
        System.out.println("Nombre2_Adicional:+" + proveedor.getNombre2_Adicional());

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, proveedor.getRFC());
            ps.setString(2, proveedor.getRazon_social());
            ps.setString(3, proveedor.getCodigo_postal());
            ps.setString(4, proveedor.getDireccion());
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
            ps.setInt(15, proveedor.getEstado_usu());
            ps.setString(16, proveedor.getRFC());
            int filasAfectadas = ps.executeUpdate();




            return filasAfectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateOn(String id){
        boolean flag = false;
        String query = "UPDATE Proveedores SET estado_usu = 1 WHERE RFC=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean updateOf(String id){
        boolean flag = false;
        String query = "UPDATE Proveedores SET estado_usu = 0 WHERE RFC=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
