package mx.edu.utez.saditarea.modelo;

public class Areas {
    private   String nombreArea;
    private   String descripcionArea;

    public Areas(){}
    public Areas(String nombreArea,  String descripcionArea){
        this.nombreArea= nombreArea;
        this.descripcionArea= descripcionArea;

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
