/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Base64;

/**
 *
 * @author juani
 */
public class Encoder {
    
    public static String fromByteArrayToUrl(byte [] file){
        String encoded = Base64.getEncoder().encodeToString(file);
        
        String[] strings = encoded.split(",");
        String extension;
        switch (strings[0]) {//check image's extension
            case "data:image/jpeg;base64":
                extension = "jpeg";
                break;
            case "data:image/png;base64":
                extension = "png";
                break;
            default://should write cases for more images types
                extension = "jpg";
                break;
        }
        
        return "data:image/" + extension + ";base64," + encoded;
    }
}
