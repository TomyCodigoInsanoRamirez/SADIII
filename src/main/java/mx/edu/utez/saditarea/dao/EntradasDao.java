package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Entradas;
import mx.edu.utez.saditarea.modelo.Productos;
import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EntradasDao {

    public boolean save(Entradas entrada) {
        boolean rowInserted = false;
        String query = "INSERT INTO entradas (folio_E, numero_Factura, Fecha, fk_RFC, precio_Unitario, precio_Total, cantidad_E, fk_claveProducto, fk_id_Empleado, fk_unidadMedida) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entrada.getFolio_E());
            ps.setString(2, entrada.getNumero_Factura());
            ps.setDate(3, new java.sql.Date(entrada.getFecha().getTime()));
            ps.setString(4, entrada.getRFC());
            ps.setFloat(5, entrada.isPrecio_Unitario());
            ps.setFloat(6, entrada.isPrecio_Total());
            ps.setInt(7, entrada.getCantidad());
            ps.setString(8, entrada.getClave_Producto());
            ps.setString(9, entrada.getId_Empleado());
            ps.setString(10, entrada.getUnidad_Medida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Entradas> getAll() {
        List<Entradas> productosList = new ArrayList<>();
        String query = "SELECT * FROM Entradas";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_E = rs.getString("folio_E");
                String numero_Factura = rs.getString("numero_Factura");
                Date fechaaa = rs.getDate("Fecha");
                String fecha = fechaaa.toString();
                String rfc = rs.getString("fk_RFC");
                float precioUnitario = rs.getFloat("precio_unitario");
                float precioTotal = rs.getFloat("precio_total");
                int cantidad = rs.getInt("cantidad_E");
                String clave_Producto = rs.getString("fk_claveProducto");
                String id_Empleado = rs.getString("fk_id_empleado");
                String clave_Medida = rs.getString("fk_unidadMedida");
                Entradas entrada = new Entradas(folio_E,numero_Factura,fechaaa,rfc,precioUnitario,precioTotal,cantidad,clave_Producto,id_Empleado,clave_Medida);
                productosList.add(entrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }
    public List<Entradas> getAll2() {
        List<Entradas> productosList2 = new ArrayList<>();
        String query = "SELECT * FROM Entradas";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_E = rs.getString("folio_E");
                String numero_Factura = rs.getString("numero_Factura");
                Date fechaaa = rs.getDate("Fecha");
                String fecha = fechaaa.toString();
                String rfc = rs.getString("fk_RFC");
                float precioUnitario = rs.getFloat("precio_unitario");
                float precioTotal = rs.getFloat("precio_total");
                int cantidad = rs.getInt("cantidad_E");
                String clave_Producto = rs.getString("fk_claveProducto");
                String id_Empleado = rs.getString("fk_id_empleado");
                String clave_Medida = rs.getString("fk_unidadMedida");
                Entradas entrada = new Entradas(folio_E,numero_Factura,fechaaa,rfc,precioUnitario,precioTotal,cantidad,clave_Producto,id_Empleado,clave_Medida);
                productosList2.add(entrada);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList2;
    }


    public List<Entradas> reporteFechas(String fecha1, String fecha2) {
        List<Entradas> productosList = new ArrayList<>();
        String query = "SELECT * FROM Entradas WHERE fecha BETWEEN ? AND ? ";
        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();// obtener conexión
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fecha1);
            ps.setString(2, fecha2);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entradas u = new Entradas();
                u.setFolio_E("folio_E");
                u.setNumero_Factura("numero_Factura");
                Date fechaaa = rs.getDate("Fecha");
                u.setFecha(fechaaa);
                u.setRFC("fk_RFC");
                u.setPrecio_Unitario(rs.getFloat("precio_unitario"));
                u.setPrecio_Total(rs.getFloat("precio_total"));
                u.setCantidad(rs.getInt("cantidad_E"));
                u.setClave_Producto(rs.getString("fk_claveProducto"));
                u.setId_Empleado(rs.getString("fk_id_empleado"));
                u.setUnidad_Medida("fk_unidadMedida");

                productosList.add(u);
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productosList;

    }
}

