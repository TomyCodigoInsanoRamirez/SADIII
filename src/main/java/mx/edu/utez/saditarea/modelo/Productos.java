package mx.edu.utez.saditarea.modelo;

public class Productos {
    private int id; // Añadido para identificar el producto en la base de datos
    private String nombreProducto;
    private String descripcionProducto;

    public Productos() {}

    public Productos(int id, String nombreProducto, String descripcionProducto) {
        this.id = id;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
