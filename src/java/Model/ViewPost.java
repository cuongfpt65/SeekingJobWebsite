/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class ViewPost {
    private String Id;
    private int viewPost;

    public ViewPost() {
    }

    public ViewPost(String Id, int viewPostl) {
        this.Id = Id;
        this.viewPost= viewPostl;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public int getViewPost() {
        return viewPost;
    }

    public void setViewPost(int viewPostl) {
        this.viewPost = viewPostl;
    }
    
    
}
