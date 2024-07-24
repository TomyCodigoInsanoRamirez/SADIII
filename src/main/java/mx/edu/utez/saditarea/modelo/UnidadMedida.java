package mx.edu.utez.saditarea.modelo;

public class UnidadMedida {
    private String abreviacionUndidadMedida;
    private String nombreUnidadMedida;

    public UnidadMedida() {}

    public UnidadMedida(String abreviacionUndidadMedida, String nombreUnidadMedida) {
        this.abreviacionUndidadMedida = abreviacionUndidadMedida;
        this.nombreUnidadMedida = nombreUnidadMedida;
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
}
