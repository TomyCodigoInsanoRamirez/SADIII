package mx.edu.utez.saditarea.modelo;

// Clase para la tabla registro_producto_entrada
public class RegistroProductoEntrada {
    private int idRegEntProd;
    private String fkProducto;
    private Double precioUnitarioProd;
    private Double precioTotalP;
    private int cantidad;
    private String unidadMedidaE;
    private String fkFolio;

    // Constructor parametrizado
    public RegistroProductoEntrada(int idRegEntProd, String fkProducto, Double precioUnitarioProd, Double precioTotalP, int cantidad, String unidadMedidaE, String fkFolio) {
        this.idRegEntProd = idRegEntProd;
        this.fkProducto = fkProducto;
        this.precioUnitarioProd = precioUnitarioProd;
        this.precioTotalP = precioTotalP;
        this.cantidad = cantidad;
        this.unidadMedidaE = unidadMedidaE;
        this.fkFolio = fkFolio;
    }

    // Constructor desparametrizado
    public RegistroProductoEntrada() {}

    public int getIdRegEntProd() {
        return idRegEntProd;
    }

    public void setIdRegEntProd(int idRegEntProd) {
        this.idRegEntProd = idRegEntProd;
    }

    public String getFkProducto() {
        return fkProducto;
    }

    public void setFkProducto(String fkProducto) {
        this.fkProducto = fkProducto;
    }

    public Double getPrecioUnitarioProd() {
        return precioUnitarioProd;
    }

    public void setPrecioUnitarioProd(Double precioUnitarioProd) {
        this.precioUnitarioProd = precioUnitarioProd;
    }

    public Double getPrecioTotalP() {
        return precioTotalP;
    }

    public void setPrecioTotalP(Double precioTotalP) {
        this.precioTotalP = precioTotalP;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidadMedidaE() {
        return unidadMedidaE;
    }

    public void setUnidadMedidaE(String unidadMedidaE) {
        this.unidadMedidaE = unidadMedidaE;
    }

    public String getFkFolio() {
        return fkFolio;
    }

    public void setFkFolio(String fkFolio) {
        this.fkFolio = fkFolio;
    }
}

