package mx.edu.utez.saditarea.modelo;

public class inventario {
    private String claveProducto;
    private String nombreProducto;
    private String descripcionProducto;
    private double precioUnitario;
    private int cantidad;
    private String fk_unidadMedidaP;

    // Constructor desparametrizado
    public inventario() {
    }

    // Constructor parametrizado
    public inventario(String claveProducto, String nombreProducto, String descripcionProducto, double precioUnitario, int cantidad, String fk_unidadMedidaP) {
        this.claveProducto = claveProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.fk_unidadMedidaP = fk_unidadMedidaP;
    }

    public String getClaveProducto() {
        return claveProducto;
    }

    public void setClaveProducto(String claveProducto) {
        this.claveProducto = claveProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFk_unidadMedidaP() {
        return fk_unidadMedidaP;
    }

    public void setFk_unidadMedidaP(String fk_unidadMedidaP) {
        this.fk_unidadMedidaP = fk_unidadMedidaP;
    }
}
