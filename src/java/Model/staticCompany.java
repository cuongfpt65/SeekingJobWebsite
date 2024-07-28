/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class staticCompany {
    private String CompanyID;
    private int view;
    private int countPost;
    private int countCV;

    public staticCompany() {
    }

    public staticCompany(String CompanyID, int view, int countPost, int countCV) {
        this.CompanyID = CompanyID;
        this.view = view;
        this.countPost = countPost;
        this.countCV = countCV;
    }

    

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getCountPost() {
        return countPost;
    }

    public void setCountPost(int countPost) {
        this.countPost = countPost;
    }

    public int getCountCV() {
        return countCV;
    }

    public void setCountCV(int countCV) {
        this.countCV = countCV;
    }

    public String getCompanyID() {
        return CompanyID;
    }

    public void setCompanyID(String CompanyID) {
        this.CompanyID = CompanyID;
    }
    
    
}
