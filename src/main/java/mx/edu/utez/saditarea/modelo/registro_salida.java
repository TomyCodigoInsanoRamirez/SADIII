package mx.edu.utez.saditarea.modelo;
import java.util.Date;

public class registro_salida {
    private String folio_salida;
    private Date fecha_entrada;
    private String area;
    private String fk_almacenistaR;
    private String fk_almacenistaE;

    public registro_salida() {}

    public String getFolio_salida() {
        return folio_salida;
    }

    public void setFolio_salida(String folio_salida) {
        this.folio_salida = folio_salida;
    }

    public Date getFecha_entrada() {
        return fecha_entrada;
    }

    public void setFecha_entrada(Date fecha_entrada) {
        this.fecha_entrada = fecha_entrada;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getFk_almacenistaR() {
        return fk_almacenistaR;
    }

    public void setFk_almacenistaR(String fk_almacenistaR) {
        this.fk_almacenistaR = fk_almacenistaR;
    }

    public String getFk_almacenistaE() {
        return fk_almacenistaE;
    }

    public void setFk_almacenistaE(String fk_almacenistaE) {
        this.fk_almacenistaE = fk_almacenistaE;
    }

    public registro_salida(String folio_salida, Date fecha_entrada, String area, String fk_almacenistaR, String fk_almacenistaE) {
        this.folio_salida = folio_salida;
        this.fecha_entrada = fecha_entrada;
        this.area = area;
        this.fk_almacenistaR = fk_almacenistaR;
        this.fk_almacenistaE = fk_almacenistaE;
    }
}

