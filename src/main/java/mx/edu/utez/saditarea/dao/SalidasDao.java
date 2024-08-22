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

    public List<registro_salida> getAll() {
        List<registro_salida> productosList = new ArrayList<>();
        String query = "SELECT * FROM registro_salida";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_S = rs.getString("folio_salida");
                Date fecha_entrada = rs.getDate("fecha_entrada");
                String area = rs.getString("area");
                String fk_almacenistaR = rs.getString("fk_almacenistaR");
                String fk_almacenistaE = rs.getString("fk_almacenistaE");

                registro_salida salida = new registro_salida(folio_S,fecha_entrada,area,fk_almacenistaR,fk_almacenistaE);
                productosList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }

/*
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
*/

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

    public List<registro_salida> reporteFechasS(String fecha1, String fecha2) {
        List<registro_salida> productosList = new ArrayList<>();
        String sql = "SELECT * FROM registro_salida WHERE fecha_entrada BETWEEN ? AND ?";

        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection(); // obtener conexión
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fecha1);
            ps.setString(2, fecha2);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                registro_salida u = new registro_salida();
                u.setFolio_salida(rs.getString("folio_salida"));
                u.setFecha_entrada(rs.getDate("fecha_entrada"));
                u.setArea(rs.getString("area"));
                u.setFk_almacenistaR(rs.getString("fk_almacenistaR"));
                u.setFk_almacenistaE(rs.getString("fk_almacenistaE"));
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

    //consulta para salidas
    public List<RegistroEntradas> producByFolio0(String folio) {
        List<RegistroEntradas> entradasList = new ArrayList<>();
        String query = "SELECT re.folio_Entrada, re.numero_factura_e, re.fechas_entrada, re.fk_RFC_Proveedor, re.precioTotal, re.fk_empleado " +
                "FROM registro_entrada re " +
                "JOIN registro_producto_entrada pe ON re.folio_Entrada = pe.fk_folio " +
                "WHERE re.folio_Entrada = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            System.out.println("Ejecutando consulta con folio: " + folio);

            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.isBeforeFirst()) {  // Verificar si el ResultSet está vacío
                    System.out.println("No se encontraron resultados para el folio: " + folio);
                } else {
                    System.out.println("Se encontraron resultados para el folio.");
                }
                while (rs.next()) {
                    RegistroEntradas entrada = new RegistroEntradas();
                    entrada.setFolioEntrada(rs.getString("folio_Entrada"));
                    entrada.setNumeroFacturaE(rs.getString("numero_factura_e"));
                    entrada.setFechasEntrada(rs.getDate("fechas_entrada"));
                    entrada.setFkRFCProveedor(rs.getString("fk_RFC_Proveedor"));
                    entrada.setPrecioTotal(rs.getDouble("precioTotal"));
                    entrada.setFkEmpleado(rs.getString("fk_empleado"));

                    entradasList.add(entrada);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entradasList;
    }


    public List<RegistroProductoSalida> producByFolio2(String folio) {
        List<RegistroProductoSalida> salidaList = new ArrayList<>();
        String query = "select fk_producto,precio_unitario_prod,precioTotalP,cantidad,unidadMedidaE,fk_folio  from registro_entrada re join registro_producto_entrada pe on re.folio_Entrada = pe.fk_folio where re.folio_Entrada = ? ";
        RegistroProductoSalida salida = new RegistroProductoSalida();
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            System.out.println("Ejecutando consulta con folio: " + folio);
            //ResultSet rs = ps.executeQuery();
            ResultSet rs = ps.executeQuery();
            {
                while (rs.next()) {

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salidaList;
    }

    /*
    public ArrayList<RegistroProductoSalida> producByFolio(String folio) {
        ArrayList<RegistroProductoSalida> dataSalida = new ArrayList<>();
        String query = "select fk_producto,precio_unitario_prod,precioTotalP,cantidad,unidadMedidaE,fk_folio  from registro_entrada re join registro_producto_entrada pe on re.folio_Entrada = pe.fk_folio where re.folio_Entrada = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ps.setString(1,folio);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                RegistroProductoSalida salida = new RegistroProductoSalida();
                salida.setFk_producto_salida(rs.getString("fk_producto"));
                salida.setPrecio_unitario_prod_salida(rs.getDouble("precio_unitario_prod"));
                salida.setPrecioTotalS(rs.getDouble("precioTotalP"));
                salida.setCantidad(rs.getInt("cantidad"));
                salida.setUnidadMedidaS(rs.getString("unidadMedidaE"));
                salida.setFk_folio_salida(rs.getString("fk_folio"));

                dataSalida.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dataSalida;
    } */
    public ArrayList<RegistroProductoSalida> producByFolio(String folio) {
        ArrayList<RegistroProductoSalida> dataSalida = new ArrayList<>();
        String query = "SELECT fk_producto_salida, precio_unitario_prod_salida, cantidad, unidadMedidaS, fk_folio_salida FROM registro_salida re JOIN registro_producto_salida pe ON re.folio_salida = pe.fk_folio_salida WHERE re.folio_salida = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    System.out.println("YA SE ESTA LLENANDO EL ARRAY LIST");
                    RegistroProductoSalida salida = new RegistroProductoSalida();
                    salida.setFk_producto_salida(rs.getString("fk_producto_salida"));
                    salida.setPrecio_unitario_prod_salida(rs.getDouble("precio_unitario_prod_salida"));
                    //salida.setPrecioTotalS(rs.getDouble("precioTotalP"));
                    salida.setCantidad(rs.getInt("cantidad"));
                    salida.setUnidadMedidaS(rs.getString("unidadMedidaS"));
                    salida.setFk_folio_salida(rs.getString("fk_folio_salida"));

                    dataSalida.add(salida);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dataSalida;
    }


    public registro_salida datosSalida(String folio) {
        registro_salida salidaList = new registro_salida();
        String query = "select * from registro_salida where folio_salida = ?";
        registro_salida salida = new registro_salida();
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            System.out.println("Ejecutando consulta con folio: " + folio);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {

                    salida.setFolio_salida(rs.getString("folio_salida"));
                    salida.setFecha_entrada(rs.getDate("fecha_entrada"));
                    salida.setArea(rs.getString("area"));
                    salida.setFk_almacenistaR(rs.getString("fk_almacenistaR"));
                    salida.setFk_almacenistaE(rs.getString("fk_almacenistaE"));
                    //salidaList.add(salida);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salida;
    }
}
