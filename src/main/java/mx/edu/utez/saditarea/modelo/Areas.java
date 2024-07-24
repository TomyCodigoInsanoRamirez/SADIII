package mx.edu.utez.saditarea.modelo;

public class Areas {
    private String claveArea;
    private String nombreArea;
    private String descripcionArea;

    // Constructor sin argumentos
    public Areas() {
    }

    // Constructor con argumentos
    public Areas(String claveArea, String nombreArea, String descripcionArea) {
        this.claveArea = claveArea;
        this.nombreArea = nombreArea;
        this.descripcionArea = descripcionArea;
    }

    // Getters y Setters
    public String getClaveArea() {
        return claveArea;
    }

    public void setClaveArea(String claveArea) {
        this.claveArea = claveArea;
    }

    public String getNombreArea() {
        return nombreArea;
    }

    public void setNombreArea(String nombreArea) {
        this.nombreArea = nombreArea;
    }

    public String getDescripcionArea() {
        return descripcionArea;
    }

    public void setDescripcionArea(String descripcionArea) {
        this.descripcionArea = descripcionArea;
    }
}
