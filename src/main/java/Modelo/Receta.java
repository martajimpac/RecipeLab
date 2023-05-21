/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author marta
 */
public class Receta {

    
    private int id;
    private String emailUsuario;
    private String nombre;
    private int numPersonas;
    private DificultadReceta dificultad;
    private int duracionEnSec;
    private double valoracionMedia;
    private boolean comentariosActivados;
    private double precio;
    private byte[] imagenReceta;
    private Categoria categoria;
    private List<PasosReceta> pasos;
    
    public Receta(){}

    public Receta(int id, String emailUsuario, String nombre, int numPersonas, String dificultad, int duracionEnSec, int valoracionMedia, boolean comentariosActivados, double precio, byte[] imagenReceta, String categoria) {
        this.id = id;
        this.emailUsuario = emailUsuario;
        this.nombre = nombre;
        this.numPersonas = numPersonas;
        this.dificultad = DificultadReceta.valueOf(dificultad);
        this.duracionEnSec = duracionEnSec;
        this.valoracionMedia = valoracionMedia;
        this.comentariosActivados = comentariosActivados;
        this.precio = precio;
        this.imagenReceta = imagenReceta;
        this.categoria = Categoria.valueOf(categoria);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public double getValoracionMedia() {
        return valoracionMedia;
    }

    public void setValoracionMedia(double valoracionMedia) {
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

    public void setPasos(ArrayList<String> pasos) {
        
        this.pasos = new ArrayList<>(); 
        for(int i = 0; i < pasos.size(); i++) this.pasos.add(new PasosReceta(this.id,i+1,pasos.get(i)));
        
    }
    
    public List<PasosReceta> getPasos() {
        return pasos;
    }
    
    public String getUrlImagen(){
        
        return Encoder.fromByteArrayToUrl(imagenReceta);
    }
}