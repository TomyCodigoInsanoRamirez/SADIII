package mx.edu.utez.saditarea.modelo;

import java.util.Date;

// Clase para la tabla registro_entrada
public class RegistroEntradas {
    private String folioEntrada;
    private String numeroFacturaE;
    private Date fechasEntrada;
    private String fkRFCProveedor;
    private Double precioTotal;
    private String fkEmpleado;

    // Constructor parametrizado
    public RegistroEntradas(String folioEntrada, String numeroFacturaE ,Date fechasEntrada, String fkRFCProveedor, Double precioTotal, String fkEmpleado) {
        this.folioEntrada = folioEntrada;
        this.numeroFacturaE = numeroFacturaE;
        this.fechasEntrada = fechasEntrada;
        this.fkRFCProveedor = fkRFCProveedor;
        this.precioTotal = precioTotal;
        this.fkEmpleado = fkEmpleado;
    }

    // Constructor desparametrizado
    public RegistroEntradas() {}

    public String getFolioEntrada() {
        return folioEntrada;
    }

    public void setFolioEntrada(String folioEntrada) {
        this.folioEntrada = folioEntrada;
    }

    public String getNumeroFacturaE() {
        return numeroFacturaE;
    }

    public void setNumeroFacturaE(String numeroFacturaE) {
        this.numeroFacturaE = numeroFacturaE;
    }

    public Date getFechasEntrada() {
        return fechasEntrada;
    }

    public void setFechasEntrada(Date fechasEntrada) {
        this.fechasEntrada = fechasEntrada;
    }

    public String getFkRFCProveedor() {
        return fkRFCProveedor;
    }

    public void setFkRFCProveedor(String fkRFCProveedor) {
        this.fkRFCProveedor = fkRFCProveedor;
    }

    public Double getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(Double precioTotal) {
        this.precioTotal = precioTotal;
    }

    public String getFkEmpleado() {
        return fkEmpleado;
    }

    public void setFkEmpleado(String fkEmpleado) {
        this.fkEmpleado = fkEmpleado;
    }
}
