package mx.edu.utez.saditarea.modelo;

import java.util.Date;

public class Salidas {
    private String folio_S;
    private int empleado_S;
    private int empleado_E;
    private String area;
    private Date fecha;
    private int cantidad_S;
    private String claveProducto;
    private String unidadMedida;

    public Salidas() {}

    public Salidas(String folio_S, int empleado_S, int empleado_E, String area, Date fecha, int cantidad_S, String claveProducto, String unidadMedida) {
        this.folio_S = folio_S;
        this.empleado_S = empleado_S;
        this.empleado_E = empleado_E;
        this.area = area;
        this.fecha = fecha;
        this.cantidad_S = cantidad_S;
        this.claveProducto = claveProducto;
        this.unidadMedida = unidadMedida;
    }

    public String getFolio() {
        return folio_S;
    }

    public void setFolio(String folio) {
        this.folio_S = folio;
    }

    public int getEmpleado_S() {
        return empleado_S;
    }

    public void setEmpleado_S(int empleado_S) {
        this.empleado_S = empleado_S;
    }

    public int getEmpleado_E() {
        return empleado_E;
    }

    public void setEmpleado_E(int empleado_E) {
        this.empleado_E = empleado_E;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getCantidad_S() {
        return cantidad_S;
    }

    public void setCantidad_S(int cantidad_S) {
        this.cantidad_S = cantidad_S;
    }

    public String getClaveProducto() {
        return claveProducto;
    }

    public void setClaveProducto(String claveProducto) {
        this.claveProducto = claveProducto;
    }

    public String getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(String unidadMedida) {
        this.unidadMedida = unidadMedida;
    }
}
