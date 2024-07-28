/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.CV;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author Phan Thanh Dat
 */
public class CVDAO {

    private Connection conn;

    public CVDAO() {
        try {
            conn = DBConnect.DBConnection.connect();
        } catch (Exception e) {
            System.out.println("Connection: " + e);
        }
    }

    public List<CV> getCVsByEmployeeId(String empId) {
        List<CV> cvList = new ArrayList<>();
        String sql = "SELECT * FROM Cv WHERE EmployeeId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, empId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CV cv = new CV();
                    cv.setId(rs.getString("CvId"));
                    cv.setFileName(rs.getString("File"));
                    cv.setEmployeeId(rs.getString("EmployeeId"));
                    cvList.add(cv);
                }
            }
        } catch (Exception e) {
            System.out.println("Get all cv by emp id: " + e);
        }
        return cvList;
    }
    
     public CV getCVByEmployeeId(String empId) {
        CV cv = new CV();
        String sql = "SELECT * FROM Cv WHERE EmployeeId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, empId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                   
                    cv.setId(rs.getString("CvId"));
                    cv.setFileName(rs.getString("File"));
                    cv.setEmployeeId(rs.getString("IdEmployee"));
                   
                }
            }
        } catch (Exception e) {
            System.out.println("Get all cv by emp id: " + e);
        }
        return cv;
    }
     public CV getCVByCVId(String CVId) {
        CV cv = new CV();
        String sql = "SELECT * FROM Cv WHERE CvId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, CVId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                   
                    cv.setId(rs.getString("CvId"));
                    cv.setFileName(rs.getString("File"));
                    cv.setEmployeeId(rs.getString("IdEmployee"));
                   
                }
            }
        } catch (Exception e) {
            System.out.println("Get all cv by emp id: " + e);
        }
        return cv;
    }
     
      public String getCV() {
       
        String sql = "SELECT Max(CvId) as CvId FROM Cv ";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                   
                    return rs.getString("CvId");
                    
                   
                }
            }
        } catch (Exception e) {
            System.out.println("Get all cv by emp id: " + e);
        }
        return null;
    }

    public void addCV(CV cv) {
        String sql = "INSERT INTO [Cv]  VALUES (?,?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cv.getId());
            ps.setString(2, cv.getFileName());
            ps.setString(3, cv.getEmployeeId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Add cv: " + e);
        }
    }

    public void deleteCV(String cvId) {
        String sql = "DELETE FROM Cv WHERE CvId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cvId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Delete cv: " + e);
        }
    }

    public CV getCVById(String cvId) {
        CV cv = null;
        String sql = "SELECT * FROM Cv WHERE CvId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cvId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cv = new CV();
                    cv.setId(rs.getString("CvId"));
                    cv.setFileName(rs.getString("File"));
                    cv.setEmployeeId(rs.getString("IdEmployee"));
                }
            }
        } catch (Exception e) {
            System.out.println("Get cv by id: " + e);
        }
        return cv;
    }
    
    public void updateCV(CV cv) {
        String sql = "UPDATE [Cv] SET [File] = ?, IdEmployee = ? WHERE CvId = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cv.getFileName());
            ps.setString(2, cv.getEmployeeId());
            ps.setString(3, cv.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update: " + e);
        }
    }

    public String generateCvId() {
        return UUID.randomUUID().toString().substring(0, 8); 
    }
}
