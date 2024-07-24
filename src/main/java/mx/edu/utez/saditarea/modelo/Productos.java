package mx.edu.utez.saditarea.modelo;

public class Productos {
    private String claveProducto;
    private String nombreProducto;
    private String descripcionProducto;

    public Productos() {}

    public Productos(String claveProducto, String nombreProducto, String descripcionProducto) {
        this.claveProducto = claveProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
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
}
