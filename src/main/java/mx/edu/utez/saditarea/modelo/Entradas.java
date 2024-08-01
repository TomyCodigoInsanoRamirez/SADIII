package mx.edu.utez.saditarea.modelo;

import java.util.Date;

public class Entradas {
    private String folio_E;
    private String numero_Factura;
    private Date Fecha;
    private String RFC;
    private float precio_Unitario;
    private float precio_Total;
    private int cantidad;
    private String clave_Producto;
    private String id_Empleado;
    private String unidad_Medida;

    public Entradas(){}
    public Entradas( String folio_E, String numero_Factura, Date Fecha, String RFC, float precio_Unitario, float precio_Total, String clave_Producto, String id_Empleado, String unidad_Medida  ) {

        this.folio_E = folio_E;
        this.numero_Factura = numero_Factura;
        this.Fecha= Fecha;
        this.RFC= RFC;
        this.precio_Unitario = precio_Unitario;
        this.precio_Total = precio_Total;
        this.cantidad= cantidad;
        this.clave_Producto= clave_Producto;
        this.id_Empleado= id_Empleado;
        this.unidad_Medida= unidad_Medida;


    }

    public String getFolio_E() {
        return folio_E;
    }

    public void setFolio_E(String folio_E) {
        this.folio_E = folio_E;
    }

    public String getNumero_Factura() {
        return numero_Factura;
    }

    public void setNumero_Factura(String numero_Factura) {
        this.numero_Factura = numero_Factura;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date fecha) {
        Fecha = fecha;
    }

    public String getRFC() {
        return RFC;
    }

    public void setRFC(String RFC) {
        this.RFC = RFC;
    }

    public float isPrecio_Unitario() {
        return precio_Unitario;
    }

    public void setPrecio_Unitario(float precio_Unitario) {
        this.precio_Unitario = precio_Unitario;
    }

    public float isPrecio_Total() {
        return precio_Total;
    }

    public void setPrecio_Total(float precio_Total) {
        this.precio_Total = precio_Total;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getClave_Producto() {
        return clave_Producto;
    }

    public void setClave_Producto(String clave_Producto) {
        this.clave_Producto = clave_Producto;
    }

    public String getId_Empleado() {
        return id_Empleado;
    }

    public void setId_Empleado(String id_Empleado) {
        this.id_Empleado = id_Empleado;
    }

    public String getUnidad_Medida() {
        return unidad_Medida;
    }

    public void setUnidad_Medida(String unidad_Medida) {
        this.unidad_Medida = unidad_Medida;
    }
}




