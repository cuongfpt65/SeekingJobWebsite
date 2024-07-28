/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AutoID;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class AutoID {
     public String setAutoId(String id){
        String autoId = id.substring(0, id.indexOf("0"));
       String newID = String.valueOf(Integer.parseInt(id.substring(id.indexOf("0")))+1) ;
        int lenght= 8-newID.length()-autoId.length();
        for (int i = 0; i < lenght; i++) {
            autoId+="0";
        }
        autoId+=newID;
        System.out.println(autoId);
        return autoId;
    }  
}
