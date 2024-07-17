package mx.edu.utez.saditarea.modelo;

public class ProductoProveedores {
    private  String claveProducto;
    private  String RFC;

    public  ProductoProveedores(){}
    public  ProductoProveedores(String claveProducto, String RFC){
        this.claveProducto= claveProducto;
        this.RFC= RFC;


    }

    public String getClaveProducto() {
        return claveProducto;
    }

    public void setClaveProducto(String claveProducto) {
        this.claveProducto = claveProducto;
    }

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }
}
