
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class staticEmployee {
    private String EmployeeID;
    private int view;
    private int countFeedback;

    public staticEmployee() {
    }

    public staticEmployee(String EmployeeID, int view, int countFeedback) {
        this.EmployeeID = EmployeeID;
        this.view = view;
        this.countFeedback = countFeedback;
    }

    public String getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(String EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getCountFeedback() {
        return countFeedback;
    }

    public void setCountFeedback(int countFeedback) {
        this.countFeedback = countFeedback;
    }
    
    
}
