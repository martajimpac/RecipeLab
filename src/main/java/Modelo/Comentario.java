/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import java.util.Date;
/**
 *
 * @author marta
 */
public class Comentario {

    private String emailUsuario;
    private int idReceta;
    private int valoracion;
    private String texto;
    private boolean leido;
    private Date fechaComentario;
    private String respuesta;
    
    public Comentario(String emailUsuario, int idReceta, int valoracion, String texto, boolean leido, Date fechaComentario, String respuesta) {
        this.emailUsuario = emailUsuario;
        this.idReceta = idReceta;
        this.valoracion = valoracion;
        this.texto = texto;
        this.leido = leido;
        this.fechaComentario = fechaComentario;
        this.respuesta = respuesta;
    }

    // setters
    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public void setIdReceta(int idReceta) {
        this.idReceta = idReceta;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }

    public void setFechaComentario(Date fechaComentario) {
        this.fechaComentario = fechaComentario;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    // getters
    public String getEmailUsuario() {
        return emailUsuario;
    }

    public int getIdReceta() {
        return idReceta;
    }

    public int getValoracion() {
        return valoracion;
    }

    public String getTexto() {
        return texto;
    }

    public boolean isLeido() {
        return leido;
    }

    public Date getFechaComentario() {
        return fechaComentario;
    }

    public String getRespuesta() {
        return respuesta;
    }
}
