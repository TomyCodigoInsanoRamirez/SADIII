package mx.edu.utez.saditarea.modelo;

public class UnidadMedida {
    private String abreviacionUndidadMedida;
    private String nombreUnidadMedida;
    private int estadoUm;

    public UnidadMedida() {}

    public UnidadMedida(String abreviacionUndidadMedida, String nombreUnidadMedida, int estadoUm) {
        this.abreviacionUndidadMedida = abreviacionUndidadMedida;
        this.nombreUnidadMedida = nombreUnidadMedida;
        this.estadoUm = estadoUm;
    }

    public String getAbreviacionUndidadMedida() {
        return abreviacionUndidadMedida;
    }

    public void setAbreviacionUndidadMedida(String abreviacionUndidadMedida) {
        this.abreviacionUndidadMedida = abreviacionUndidadMedida;
    }

    public String getNombreUnidadMedida() {
        return nombreUnidadMedida;
    }

    public void setNombreUnidadMedida(String nombreUnidadMedida) {
        this.nombreUnidadMedida = nombreUnidadMedida;
    }

    public int getEstadoUm() {
        return estadoUm;
    }

    public void setEstadoUm(int estadoUm) {
        this.estadoUm = estadoUm;
    }
}
