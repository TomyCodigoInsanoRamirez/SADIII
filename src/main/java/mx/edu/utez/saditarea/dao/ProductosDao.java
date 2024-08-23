package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.*;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductosDao {

    public boolean save(Productos producto) {
        boolean rowInserted = false;
        String query = "INSERT INTO Productos (claveProducto, nombreProducto, descripcionProducto, estado,fk_unidadMedidaProd) VALUES (?, ?, ?, ?,?)";
        System.out.println("Unidad medida desde dao: " + producto.getUnidadMedida());
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, producto.getClaveProducto());
            ps.setString(2, producto.getNombreProducto());
            ps.setString(3, producto.getDescripcionProducto());
            ps.setInt(4, producto.getEstadoProducto());
            ps.setString(5, producto.getUnidadMedida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Productos> getAll() {
        List<Productos> productosList = new ArrayList<>();
        String query = "SELECT * FROM Productos";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String claveProducto = rs.getString("claveProducto");
                String nombreProducto = rs.getString("nombreProducto");
                String descripcionProducto = rs.getString("descripcionProducto");
                int estado = rs.getInt("estado");
                String unidadMedida = rs.getString("fk_unidadMedidaProd");
                Productos producto = new Productos(claveProducto, nombreProducto, descripcionProducto, estado,unidadMedida); // Aquí el estado es 1 por defecto
                productosList.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }

    public List<Productos> getAllWithEstado() {
        List<Productos> productosList = new ArrayList<>();
        String query = "SELECT * FROM Productos";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String claveProducto = rs.getString("claveProducto");
                String nombreProducto = rs.getString("nombreProducto");
                String descripcionProducto = rs.getString("descripcionProducto");
                int estadoProducto = rs.getInt("estadoProducto");
                String unidadMedida = rs.getString("fk_unidadMedidaProd");
                Productos producto = new Productos(claveProducto, nombreProducto, descripcionProducto, estadoProducto,unidadMedida);
                productosList.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }

    public boolean update(Productos producto) {
        boolean rowUpdated = false;
        String query = "UPDATE Productos SET nombreProducto = ?, descripcionProducto = ?, estado = ?, fk_unidadMedidaProd = ? WHERE claveProducto = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcionProducto());
            ps.setInt(3, producto.getEstadoProducto());
            ps.setString(4, producto.getUnidadMedida());
            ps.setString(5, producto.getClaveProducto());


            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public boolean updateOn(String id) {
        boolean flag = false;
        String query = "UPDATE Productos SET estado = 1 WHERE claveProducto = ?";

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

    public boolean updateOf(String id) {
        boolean flag = false;
        String query = "UPDATE Productos SET estado = 0 WHERE claveProducto = ?";

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

    public List<inventario> inventario() {
        List<inventario> productosList = new ArrayList<>();
        String query = "SELECT * FROM inventario";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String claveProducto = rs.getString("claveProducto");
                String nombreProducto = rs.getString("nombreProducto");
                String descripcionProducto = rs.getString("descripcionProducto");
                Double precioUnitario = rs.getDouble("precioUnitario");
                int cantidad = rs.getInt("cantidad");
                String unidadMedida = rs.getString("fk_unidadMedidaP");
                inventario inventarioo = new inventario(claveProducto, nombreProducto, descripcionProducto, precioUnitario,cantidad,unidadMedida); // Aquí el estado es 1 por defecto
                productosList.add(inventarioo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }

    public double obtenerPrecio(String claveProducto) {
        double precio = 0.0;
        String query = "SELECT precioUnitario FROM detallesProductos WHERE fk_claveProducto = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, claveProducto);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    precio = rs.getDouble("precioUnitario");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return precio;
    }


    public List<RegistroProductoEntrada> producByFolio(String folio) {
        List<RegistroProductoEntrada> productosList = new ArrayList<>();
        String query = "SELECT fk_producto, precio_unitario_prod, precioTotalP, cantidad, unidadMedidaE " +
                "FROM registro_producto_entrada rp " +
                "JOIN Productos p ON rp.fk_producto = p.claveProducto " +
                "WHERE rp.fk_folio = ?";

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
                    RegistroProductoEntrada producto = new RegistroProductoEntrada();
                    producto.setFkProducto(rs.getString("fk_producto"));
                    producto.setPrecioUnitarioProd(rs.getDouble("precio_unitario_prod"));
                    producto.setPrecioTotalP(rs.getDouble("precioTotalP"));
                    producto.setCantidad(rs.getInt("cantidad"));
                    producto.setUnidadMedidaE(rs.getString("unidadMedidaE"));

                    productosList.add(producto);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }
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

    public String getNameProd(String id ) {
        Productos p = new Productos();
        String sql = "SELECT nombreProducto FROM Productos WHERE claveProducto = ?";
        try {
            // Conexión y consulta a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();// obtener conexión
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p.setNombreProducto(rs.getString("nombreProducto"));
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p.getNombreProducto();
    }

}
