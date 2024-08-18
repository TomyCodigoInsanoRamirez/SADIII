package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.*;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalidasDao {

    public boolean save(Salidas salida) {
        boolean rowInserted = false;
        String query = "INSERT INTO Salidas (folio_S, fk_empleado_S, fk_empleado_E, fk_area, fecha, cantidad_S, fk_claveProducto, fk_unidadMedida) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, salida.getFolio());
            ps.setString(2, salida.getEmpleado_S());
            ps.setString(3, salida.getEmpleado_E());
            ps.setString(4, salida.getArea());
            ps.setDate(5, new java.sql.Date(salida.getFecha().getTime()));
            ps.setInt(6, salida.getCantidad_S());
            ps.setString(7, salida.getClaveProducto());
            ps.setString(8, salida.getUnidadMedida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Salidas> getAll() {
        List<Salidas> productosList = new ArrayList<>();
        String query = "SELECT * FROM Salidas";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_S = rs.getString("folio_S");
                String fk_empleado_S = rs.getString("fk_empleado_S");
                String fk_empleado_E = rs.getString("fk_empleado_E");
                String fk_area = rs.getString("fk_area");
                Date fecha = rs.getDate("fecha");
                int cantidad_S = rs.getInt("cantidad_S");
                String claveProducto = rs.getString("fk_claveProducto");
                String unidadMedida = rs.getString("fk_unidadMedida");
                Salidas salida = new Salidas(folio_S,fk_empleado_S,fk_empleado_E,fk_area,fecha,cantidad_S,claveProducto,unidadMedida);
                productosList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }


    public List<Salidas> reporteFechasS(String fecha1, String fecha2) {
        List<Salidas> productosList = new ArrayList<>();
        String sql = "{CALL fechasSalidas(?, ?)}";

        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection(); // obtener conexión
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, fecha1);
            cs.setString(2, fecha2);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                Salidas u = new Salidas();
                u.setFolio("folio_S");
                u.setEmpleado_S("fk_empleado_S");
                u.setEmpleado_E("fk_empleado_E");
                u.setArea("fk_area_S");
                java.util.Date fechaaa = rs.getDate("Fecha");
                u.setFecha(fechaaa);
                u.setClaveProducto("fk_claveProducto");
                u.setUnidadMedida("fk_unidadMedida");
                //u.setCantidad_S(Integer.parseInt("cantidad_S"));
                u.setCantidad_S(rs.getInt("cantidad_S"));
                productosList.add(u);
            }

            rs.close();
            cs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productosList;
    }


    public boolean save2(registro_salida regS) {
        boolean rowInserted = false;
        String query = "INSERT INTO registro_salida (folio_salida, fecha_entrada, area, fk_almacenistaR, fk_almacenistaE) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, regS.getFolio_salida());
            ps.setDate(2, new java.sql.Date(regS.getFecha_entrada().getTime()));
            ps.setString(3,regS.getArea());
            //ps.setDouble(4,regS.getFk_almacenistaR());
            ps.setString(4, regS.getFk_almacenistaR());
            ps.setString(5,regS.getFk_almacenistaE());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public boolean save3(RegistroProductoSalida regSP) {
        boolean rowInserted = false;
        String query = "INSERT INTO registro_producto_salida (fk_producto_salida, precio_unitario_prod_salida,cantidad,unidadMedidaS,fk_folio_salida) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, regSP.getFk_producto_salida());
            ps.setDouble(2,regSP.getPrecio_unitario_prod_salida());
            ps.setInt(3,regSP.getCantidad());
            ps.setString(4,regSP.getUnidadMedidaS());
            ps.setString(5,regSP.getFk_folio_salida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }
    public List<RegistroEntradas> getAllEntradas() {
        List<RegistroEntradas> productosList = new ArrayList<>();
        String query = "SELECT * FROM registro_entrada";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_E = rs.getString("folio_Entrada");
                String numero_Factura = rs.getString("numero_factura_e");

                java.util.Date fechaaa = rs.getDate("Fechas_entrada");
                /*
                String fecha = fechaaa.toString();
                float precioUnitario = rs.getFloat("precio_unitario");
                int cantidad = rs.getInt("cantidad_E");
                String clave_Producto = rs.getString("fk_claveProducto");
                */
                String rfc = rs.getString("fk_RFC_Proveedor");
                Double precioTotal = rs.getDouble("precioTotal");
                String id_Empleado = rs.getString("fk_empleado");
                RegistroEntradas entradaa = new RegistroEntradas(folio_E,numero_Factura,fechaaa,rfc,precioTotal,id_Empleado);
                productosList.add(entradaa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }
}
