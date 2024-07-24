package mx.edu.utez.saditarea.modelo;

public class Proveedores {
    private String RFC;
    private String razon_social;
    private String codigo_postal;
    private String direccion;
    private String nombre1_P;
    private String nombre2_P;
    private String apellido1_P;
    private String apellido2_P;
    private String telefono_P;
    private String nombre1_Adicional;
    private String nombre2_Adicional;
    private String apellido1_Adicional;
    private String apellido2_Adicional;
    private String telefono_Adicional;

    public Proveedores(String RFC, String razon_social, String codigo_postal, String direccion,
                       String nombre1_P, String nombre2_P, String apellido1_P, String apellido2_P,
                       String telefono_P, String nombre1_Adicional, String nombre2_Adicional,
                       String apellido1_Adicional, String apellido2_Adicional, String telefono_Adicional) {
        this.RFC = RFC;
        this.razon_social = razon_social;
        this.codigo_postal = codigo_postal;
        this.direccion = direccion;
        this.nombre1_P = nombre1_P;
        this.nombre2_P = nombre2_P;
        this.apellido1_P = apellido1_P;
        this.apellido2_P = apellido2_P;
        this.telefono_P = telefono_P;
        this.nombre1_Adicional = nombre1_Adicional;
        this.nombre2_Adicional = nombre2_Adicional;
        this.apellido1_Adicional = apellido1_Adicional;
        this.apellido2_Adicional = apellido2_Adicional;
        this.telefono_Adicional = telefono_Adicional;
    }

    // Getters and setters for all fields

    public String getRFC() { return RFC; }
    public void setRFC(String RFC) { this.RFC = RFC; }

    public String getRazon_social() { return razon_social; }
    public void setRazon_social(String razon_social) { this.razon_social = razon_social; }

    public String getCodigo_postal() { return codigo_postal; }
    public void setCodigo_postal(String codigo_postal) { this.codigo_postal = codigo_postal; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getNombre1_P() { return nombre1_P; }
    public void setNombre1_P(String nombre1_P) { this.nombre1_P = nombre1_P; }

    public String getNombre2_P() { return nombre2_P; }
    public void setNombre2_P(String nombre2_P) { this.nombre2_P = nombre2_P; }

    public String getApellido1_P() { return apellido1_P; }
    public void setApellido1_P(String apellido1_P) { this.apellido1_P = apellido1_P; }

    public String getApellido2_P() { return apellido2_P; }
    public void setApellido2_P(String apellido2_P) { this.apellido2_P = apellido2_P; }

    public String getTelefono_P() { return telefono_P; }
    public void setTelefono_P(String telefono_P) { this.telefono_P = telefono_P; }

    public String getNombre1_Adicional() { return nombre1_Adicional; }
    public void setNombre1_Adicional(String nombre1_Adicional) { this.nombre1_Adicional = nombre1_Adicional; }

    public String getNombre2_Adicional() { return nombre2_Adicional; }
    public void setNombre2_Adicional(String nombre2_Adicional) { this.nombre2_Adicional = nombre2_Adicional; }

    public String getApellido1_Adicional() { return apellido1_Adicional; }
    public void setApellido1_Adicional(String apellido1_Adicional) { this.apellido1_Adicional = apellido1_Adicional; }

    public String getApellido2_Adicional() { return apellido2_Adicional; }
    public void setApellido2_Adicional(String apellido2_Adicional) { this.apellido2_Adicional = apellido2_Adicional; }

    public String getTelefono_Adicional() { return telefono_Adicional; }
    public void setTelefono_Adicional(String telefono_Adicional) { this.telefono_Adicional = telefono_Adicional; }
}
