package mx.edu.utez.saditarea.modelo;

public class RegistroProductoSalida {
    private int id_salida_ent_prod;
    private String fk_producto_salida;
    private Double precio_unitario_prod_salida;
    private int cantidad;
    private String unidadMedidaS;
    private String fk_folio_salida;

    public RegistroProductoSalida() {}

    public int getId_salida_ent_prod() {
        return id_salida_ent_prod;
    }

    public void setId_salida_ent_prod(int id_salida_ent_prod) {
        this.id_salida_ent_prod = id_salida_ent_prod;
    }

    public String getFk_producto_salida() {
        return fk_producto_salida;
    }

    public void setFk_producto_salida(String fk_producto_salida) {
        this.fk_producto_salida = fk_producto_salida;
    }

    public Double getPrecio_unitario_prod_salida() {
        return precio_unitario_prod_salida;
    }

    public void setPrecio_unitario_prod_salida(Double precio_unitario_prod_salida) {
        this.precio_unitario_prod_salida = precio_unitario_prod_salida;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidadMedidaS() {
        return unidadMedidaS;
    }

    public void setUnidadMedidaS(String unidadMedidaS) {
        this.unidadMedidaS = unidadMedidaS;
    }

    public String getFk_folio_salida() {
        return fk_folio_salida;
    }

    public void setFk_folio_salida(String fk_folio_salida) {
        this.fk_folio_salida = fk_folio_salida;
    }

    public RegistroProductoSalida(int id_salida_ent_prod, String fk_producto_salida, Double precio_unitario_prod_salida, int cantidad, String unidadMedidaS, String fk_folio_salida) {
        this.id_salida_ent_prod = id_salida_ent_prod;
        this.fk_producto_salida = fk_producto_salida;
        this.precio_unitario_prod_salida = precio_unitario_prod_salida;
        this.cantidad = cantidad;
        this.unidadMedidaS = unidadMedidaS;
        this.fk_folio_salida = fk_folio_salida;
    }
}

