/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author marta
 */
public class DetallesReceta {
    private String idReceta;
    private String nombreIngrediente;
    private String cantidad;
    private boolean opcionalidad;

    public void setIdReceta(String idReceta) {
        this.idReceta = idReceta;
    }

    public String getIdReceta() {
        return idReceta;
    }

    public void setNombreIngrediente(String nombreIngrediente) {
        this.nombreIngrediente = nombreIngrediente;
    }

    public String getNombreIngrediente() {
        return nombreIngrediente;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setOpcionalidad(boolean opcionalidad) {
        this.opcionalidad = opcionalidad;
    }

    public boolean isOpcionalidad() {
        return opcionalidad;
    }
}

