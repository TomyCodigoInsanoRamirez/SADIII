package mx.edu.utez.saditarea.modelo;

public class DetallesProducto {
    private  String  claveProducto;
    private  boolean precioUnitario;
    private  int     cantidad;
    private  String  unidadMedida_P;


    public  DetallesProducto(){}
    public  DetallesProducto( String claveProducto,  boolean precioUnitario , int cantidad, String unidadMedida_P){
        this.cantidad= cantidad;
        this.claveProducto= claveProducto;
        this.precioUnitario= precioUnitario;
        this.unidadMedida_P= unidadMedida_P;


    }

    public String getClaveProducto() {
        return claveProducto;
    }

    public void setClaveProducto(String claveProducto) {
        this.claveProducto = claveProducto;
    }

    public boolean isPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(boolean precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidadMedida_P() {
        return unidadMedida_P;
    }

    public void setUnidadMedida_P(String unidadMedida_P) {
        this.unidadMedida_P = unidadMedida_P;
    }
}
