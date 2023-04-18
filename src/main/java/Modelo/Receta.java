/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author marta
 */
public class Receta {
    private String id;
    private String emailUsuario;
    private String nombre;
    private int numPersonas;
    private DificultadReceta dificultad;
    private int duracionEnSec;
    private int valoracionMedia;
    private boolean comentariosActivados;
    private double precio;
    private byte[] imagenReceta;
    private Categoria categoria;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumPersonas() {
        return numPersonas;
    }

    public void setNumPersonas(int numPersonas) {
        this.numPersonas = numPersonas;
    }

    public DificultadReceta getDificultad() {
        return dificultad;
    }

    public void setDificultad(DificultadReceta dificultad) {
        this.dificultad = dificultad;
    }

    public int getDuracionEnSec() {
        return duracionEnSec;
    }

    public void setDuracionEnSec(int duracionEnSec) {
        this.duracionEnSec = duracionEnSec;
    }

    public int getValoracionMedia() {
        return valoracionMedia;
    }

    public void setValoracionMedia(int valoracionMedia) {
        this.valoracionMedia = valoracionMedia;
    }

    public boolean isComentariosActivados() {
        return comentariosActivados;
    }

    public void setComentariosActivados(boolean comentariosActivados) {
        this.comentariosActivados = comentariosActivados;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public byte[] getImagenReceta() {
        return imagenReceta;
    }

    public void setImagenReceta(byte[] imagenReceta) {
        this.imagenReceta = imagenReceta;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
}

