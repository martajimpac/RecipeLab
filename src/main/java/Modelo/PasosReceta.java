/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author marta
 */
public class PasosReceta {
    private String idReceta;
    private int numeroPaso;
    private String descripcion;

    public void setIdReceta(String idReceta) {
        this.idReceta = idReceta;
    }

    public String getIdReceta() {
        return idReceta;
    }

    public void setNumeroPaso(int numeroPaso) {
        this.numeroPaso = numeroPaso;
    }

    public int getNumeroPaso() {
        return numeroPaso;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
