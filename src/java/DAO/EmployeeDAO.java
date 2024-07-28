/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import AutoID.AutoID;
import DBConnect.DBConnection;
import Model.Company;
import Model.Employee;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NganPT
 */
public class EmployeeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Employee> getAllEmployee() {
        List<Employee> list = new ArrayList<>();

        String query = "select * from Employee order by idEmployee DESC";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Date date = rs.getDate("DoB");
                list.add(new Employee(rs.getString("IdEmployee"),
                        rs.getString("LastName"),
                        rs.getString("FirstName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Phone"),
                        date,
                        rs.getString("Address"),
                        rs.getString("Major"),
                        rs.getString("Gender"),
                        rs.getString("Academic")));
            }

        } catch (Exception e) {

        }

        return list;
    }

    public Employee getAllEmployeeById(String id) {

        String query = "select * from Employee where IdEmployee =?";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Date date = rs.getDate("DoB");
                return new Employee(rs.getString("IdEmployee"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        date,
                        rs.getString("address"),
                        rs.getString("major"),
                        rs.getString("gender"),
                        rs.getString("academic"));
            }

        } catch (Exception e) {
            System.out.println("Ex: " + e);
        }

        return null;
    }

    public void updateEmployee(Employee employee) throws SQLException, Exception {

        try {
            conn = DBConnection.connect();
            String query = "UPDATE Employee SET lastName=?, firstName=?, email=?, password=?, phone=?, DoB=?, address=?, major=?, gender=?, academic=? WHERE IdEmployee=?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, employee.getLastName());
            ps.setString(2, employee.getFirstName());
            ps.setString(3, employee.getEmail());
            ps.setString(4, employee.getPassword());
            ps.setString(5, employee.getPhone());
            Date date = (Date) employee.getDob();
            ps.setDate(6, date);
            ps.setString(7, employee.getAddress());
            ps.setString(8, employee.getMajor());
            ps.setString(9, employee.getGender());
            ps.setString(10, employee.getAcademic());
            ps.setString(11, employee.getIdEmployee());

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Employee updated successfully.");
            } else {
                System.out.println("No employee updated. ID " + employee.getIdEmployee() + " not found or no changes made.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Re-throw the exception to be handled by the caller
        } finally {
            // Close resources in finally block
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void delete(String id) {
        String query = " DELETE FROM [dbo].[Employee]\n"
                + "      WHERE IdEmployee = ?";
        try {
            conn = DBConnection.connect();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertEmployee(Employee employee) {
        String oldIdEmployee = getEmployeeFirst();
        AutoID id = new AutoID();
        String newidEmployee = id.setAutoId(oldIdEmployee);

        try {
            String sql = "Insert into Employee Values (?,  ?,  ?,  ?, ?,  ?,  ?,  ?,  ?, ?, ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidEmployee);
            ps.setString(2, employee.getEmail());
            ps.setString(3, getMd5(employee.getPassword()));
            ps.setString(4, employee.getLastName());
            ps.setString(5, employee.getFirstName());
            ps.setString(6, employee.getPhone());
            ps.setDate(7,  employee.getDob());
            ps.setString(8, employee.getAddress());
            ps.setString(9, employee.getGender());
            ps.setString(10, employee.getMajor());
            ps.setString(11, employee.getAcademic());

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
     public String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public String getEmployeeFirst() {

        String query = "select Max(idemployee) as id from Employee ";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

}
