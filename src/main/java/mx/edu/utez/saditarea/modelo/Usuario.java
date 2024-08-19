package mx.edu.utez.saditarea.modelo;

public class Usuario {

    private String idUsuario; // Añadir campo idUsuario

    private int id;

    private String correo;
    private String nombre1_U;
    private String apellido1_U;
    private String nombre2_U;
    private String apellido2_U;
    private String telefono;
    private String contrasena;
    private int estado;
    private String codigo;
    private String rol;


    public Usuario() {}

    public Usuario( String correo, String nombre1_U, String apellido1_U, String nombre2_U, String apellido2_U, String telefono, String contrasena, int estado, String codigo) {
        /*this.idUsuario = idUsuario;*/
        this.correo = correo;
        this.nombre1_U = nombre1_U;
        this.apellido1_U = apellido1_U;
        this.nombre2_U = nombre2_U;
        this.apellido2_U = apellido2_U;
        this.telefono = telefono;
        this.contrasena = contrasena;
        this.estado = estado;
        this.codigo = codigo;
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre1_U() {
        return nombre1_U;
    }

    public void setNombre1_U(String nombre1_U) {
        this.nombre1_U = nombre1_U;
    }

    public String getApellido1_U() {
        return apellido1_U;
    }

    public void setApellido1_U(String apellido1_U) {
        this.apellido1_U = apellido1_U;
    }

    public String getNombre2_U() {
        return nombre2_U;
    }

    public void setNombre2_U(String nombre2_U) {
        this.nombre2_U = nombre2_U;
    }

    public String getApellido2_U() {
        return apellido2_U;
    }

    public void setApellido2_U(String apellido2_U) {
        this.apellido2_U = apellido2_U;
    }


    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int isEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getCodigo() {
        return codigo;
    }

    public int getEstado() {
        return estado;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
