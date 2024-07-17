package mx.edu.utez.saditarea.modelo;

public class Productos {
 private String nombreProducto;
 private String descripcionProducto;

 public Productos(){}
 public Productos(String nombreProducto,String descripcionProducto ){
     this.nombreProducto= nombreProducto;
     this.descripcionProducto= descripcionProducto;
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
