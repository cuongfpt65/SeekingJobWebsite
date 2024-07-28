/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBConnection;
import Model.Company;
import Model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author NganPT
 */
public class FeedbackDAO {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> list = new ArrayList<>();
//        String query = "select * from Feedback";
        String query = "select FeedbackId, CompanyName, concat(FirstName, ' ', LastName) as FullName, f.Description, feedbackTime\n"
                + "from Feedback f, Company c, Employee e\n"
                + "where f.CompanyId = c.CompanyId\n"
                + "and f.EmployeeId = e.EmployeeId";
        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Feedback getFeedbackById(String fId) {
        String query = "select * from Feedback\n"
                + "where FeedbackId = ?";
        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, fId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Feedback> getFeedbacksByEmployeeId(String eId) {
        List<Feedback> list = new ArrayList<>();
        String query = "select * from Feedback\n"
                + "where EmployeeId = ?\n"
                + "order by feedbackTime asc ";
        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, eId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Feedback> getFeedbacksByCompanyId(String cId) {
        List<Feedback> list = new ArrayList<>();
        String query = "select * from Feedback\n"
                + "where CompanyId = ?\n"
                + "order by feedbackTime asc";
        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, cId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getTimestamp(5)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void createFeedback(String fId, String eId, String cId, String description) {
       

        String query = "insert into Feedback\n"
                + "values (?, ?, ?, ?, ?)";
        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, fId);
            ps.setString(2, eId);
            ps.setString(3, cId);
            ps.setString(4, description);
            Timestamp fTime = new Timestamp(System.currentTimeMillis());
            ps.setTimestamp(5, fTime);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    /* Check if the feedback is valid (within 24 hours) */
    public boolean checkWithinTime(String fId) {
        Feedback feedback = getFeedbackById(fId);

        Timestamp fTime = (Timestamp) feedback.getFeedbackTime();
        Timestamp cTime = new Timestamp(System.currentTimeMillis());
        long diff = (cTime.getTime() - fTime.getTime()) / (1000 * 60 * 60);

        return (diff <= 24);
    }

    /* Update feedback within 24 hours since the time created the feedback */
    public void updateFeedback(String fId, String description) {
        Feedback feedback = getFeedbackById(fId);
        if (feedback == null) {
            System.out.println("Feedback is not found.");
        } else {

            if (checkWithinTime(fId)) {
                String query = "update Feedback\n"
                        + "set Description = ?\n"
                        + "where FeedbackId = ?";
                try {
                    conn = new DBConnection().connect();
                    ps = conn.prepareStatement(query);
                    ps.setString(1, description);
                    ps.setString(2, fId);
                    ps.executeUpdate();
                } catch (SQLException e) {
                }
            } else {
                System.out.println("Cannot update feedback.");
            }
        }
    }

    /* Delete feedback within 24 hours since the time created the feedback */
    public void deleteFeedback(String fId) {
        Feedback feedback = getFeedbackById(fId);

        if (feedback == null) {
            System.out.println("Feedback is not found.");
        } else {
            if (checkWithinTime(fId)) {
                String query = "delete from Feedback\n"
                        + "where FeedbackId = ?";
                try {
                    conn = new DBConnection().connect();
                    ps = conn.prepareStatement(query);
                    ps.setString(1, fId);
                    ps.executeUpdate();
                } catch (SQLException e) {
                }
            } else {
                System.out.println("Cannot delete feedback.");
            }
        }
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        Feedback feedback = new Feedback();

//        dao.createFeedback("FS17834", "FD245352", "LX260297", "Description");
//
//        List<Feedback> list = dao.getAllFeedbacks();
//        for (Feedback f : list) {
//            System.out.println(f);
//        }
//        System.out.println(dao.checkWithinTime("AD69241"));
//
//        dao.deleteFeedback("AD69241");
//
        List<Feedback> list = dao.getAllFeedbacks();
        for (Feedback f : list) {
            System.out.println(f);
        }
    }
}
