/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBConnection;
import Model.Company;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class staticDAO {

    Connection conn;

    public staticDAO() throws Exception {
        try {
            conn = new DBConnect.DBConnection().connect();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    PreparedStatement ps = null;
    ResultSet rs = null;

    public int countAccount() {
        int count = 0;
        String query = "SELECT COUNT(accountID) as count FROM Account";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace to help with debugging
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the stack trace if there are issues closing the resources
            }
        }
        return count;
    }

    public List<String> countPost() {
        List<String> count = new ArrayList<>();

        LocalDate currentDate = LocalDate.now();

        LocalDate startDate = currentDate;
        LocalDate endDate = currentDate.plusDays(7);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startDateStr = startDate.format(formatter);
        String endDateStr = endDate.format(formatter);

        String query = "SELECT CONVERT(DATE, timePosted) AS PostingDate,\n"
                + "       COUNT(*) AS NumPosts\n"
                + "FROM Post\n"
                + "GROUP BY CONVERT(DATE, timePosted)\n"
                + "ORDER BY PostingDate DESC;";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                count.add(rs.getString("NumPosts"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace to help with debugging
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the stack trace if there are issues closing the resources
            }
        }
        return count;
    }

    public List<String> getTop5Major(int index) {
        List<String> list = new ArrayList<>();
        String query = "WITH RankedMajors AS (\n"
                + "    SELECT major, COUNT(*) as major_count,\n"
                + "           ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) as rank\n"
                + "    FROM post\n"
                + "    GROUP BY major\n"
                + ")\n"
                + "SELECT major, major_count\n"
                + "FROM RankedMajors\n"
                + "WHERE rank <= 5;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString(index));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<String> getPost5Day() {
        List<String> list = new ArrayList<>();
        String query = "SELECT\n"
                + "    CAST(timePosted AS DATE) AS post_date,\n"
                + "    COUNT(*) AS post_count\n"
                + "FROM\n"
                + "    post\n"
                + "WHERE\n"
                + "    timePosted >= DATEADD(DAY, -5, CAST(GETDATE() AS DATE))\n"
                + "GROUP BY\n"
                + "    CAST(timePosted AS DATE)\n"
                + "ORDER BY\n"
                + "    CAST(timePosted AS DATE) DESC;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(2));
            }
        } catch (Exception e) {
        }

        return list;
    }

}
