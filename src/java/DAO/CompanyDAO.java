/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import AutoID.AutoID;
import DBConnect.DBConnection;

import Model.Company;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
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
public class CompanyDAO {

    Connection conn;

    public CompanyDAO() throws Exception {
        try {
            conn = new DBConnect.DBConnection().connect();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Company> getAllCompany() {
        List<Company> list = new ArrayList<>();
        String query = "select * from Company order by IDCompany DESC";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Company(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getString(7), // Start
                        rs.getString(8), // End
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)// Major
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Company> searchCompany(String search) {
        List<Company> list = new ArrayList<>();
        String query = "select * from Company \n"
                + "where NameCompany like ? or NameCEO like ? \n"
                + "order by NameCompany DESC";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Company(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getString(7), // Start
                        rs.getString(8), // End
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)// Major
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public Company getUser(String id) {
        Company us = null;
        String query = "SELECT * FROM Company WHERE IDCompany =?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Company(rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getString(7), // Start
                        rs.getString(8), // End
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)// Major
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return us;

    }

    public String getUserFirst() {

        String query = "select Max(idcompany) as id from Company ";
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

    public Company update(String idCompany, Company newInfo) {
        int count = 0;
        try {
            String sql = "UPDATE Company SET Email = ?, Password = ?, NameCompany = ?, NameCEO = ?, VAT = ?, Location = ?, Address = ?, Phone = ?, Logo = ?, Description = ? WHERE IDCompany = ?";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newInfo.getEmail());
            ps.setString(2, newInfo.getPassword());
            ps.setString(3, newInfo.getNameCompany());
            ps.setString(4, newInfo.getNameCEO());
            ps.setString(5, newInfo.getVat());
            ps.setString(6, newInfo.getLocation());
            ps.setString(7, newInfo.getAddress());
            ps.setString(8, newInfo.getPhone());
            ps.setString(9, newInfo.getLogo());
            ps.setString(10, newInfo.getDescription());
            ps.setString(11, newInfo.getIdCompany());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : newInfo;
    }

    public void deleteCompany(String idCompany) throws Exception {

        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement("DELETE FROM Company WHERE IDCompany=?");
            ps.setString(1, idCompany);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, "Error deleting company with ID: " + idCompany, ex);
        }

    }

    public List<Company> getNameCompany(String name) {
        List<Company> list = new ArrayList<>();
        String query = "SELECT * FROM Company WHERE NameCompany LIKE ?";

        try {
            conn = new DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%"); // Add wildcards to the parameter value
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Company(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getString(7), // Start
                        rs.getString(8), // End
                        rs.getString(9), // Additional field 1
                        rs.getString(10), // Additional field 2
                        rs.getString(11) // Major
                ));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace for debugging
        }

        return list;
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

    public void insertCompany(Company company) {
        String oldIdCompany = getUserFirst();
        AutoID id = new AutoID();
        String newidCompany = id.setAutoId(oldIdCompany);

        try {
            String sql = "Insert into Company Values (?,  ?,  ?,  ?, ?,  ?,  ?,  ?,  ?, ?, ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidCompany);
            ps.setString(2, company.getEmail());
            ps.setString(3, getMd5(company.getPassword()));
            ps.setString(4, company.getNameCompany());
            ps.setString(5, company.getNameCEO());
            ps.setString(6, company.getVat());
            ps.setString(7, company.getLocation());
            ps.setString(8, company.getAddress());
            ps.setString(9, company.getPhone());
            ps.setString(10, company.getLogo());
            ps.setString(11, company.getDescription());

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

}
