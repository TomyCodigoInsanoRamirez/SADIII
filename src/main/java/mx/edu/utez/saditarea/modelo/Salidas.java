package mx.edu.utez.saditarea.modelo;

import java.util.Date;

public class Salidas {
    private String folio_S;
    private  int empleado_S;
    private  int empleado_E;
    private  String Area;
    private Date Fecha;
    private int Cantdad_S;
    private String ClaveProducto ;
    private String UnidadMedida;

    public Salidas(){}
    public Salidas( String folio_S, int empleado_S, int empleado_E, String Area, Date Fecha, int Cantidad_S, String ClaveProducto, String UnidadMedida  ){
        this.folio_S= folio_S;
        this.empleado_S= empleado_S;
        this.empleado_E= empleado_E;
        this.Area = Area;
        this.Fecha = Fecha;
        this.Cantdad_S = Cantdad_S;
        this.ClaveProducto= ClaveProducto;
        this.UnidadMedida= UnidadMedida;



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
        return Area;
    }

    public void setArea(String area) {
        Area = area;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date fecha) {
        Fecha = fecha;
    }

    public int getCantdad_S() {
        return Cantdad_S;
    }

    public void setCantdad_S(int cantdad_S) {
        Cantdad_S = cantdad_S;
    }

    public String getClaveProducto() {
        return ClaveProducto;
    }

    public void setClaveProducto(String claveProducto) {
        ClaveProducto = claveProducto;
    }

    public String getUnidadMedida() {
        return UnidadMedida;
    }

    public void setUnidadMedida(String unidadMedida) {
        UnidadMedida = unidadMedida;
    }
}
