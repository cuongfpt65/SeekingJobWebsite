/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import AutoID.AutoID;
import DBConnect.DBConnection;
import Model.Account;
import Model.Company;
import Model.Employee;
import Model.statusAccount;
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
 * @author Trần Tấn Lợi-CE171879
 */
public class AccountDAO {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public AccountDAO() throws Exception {
        try {
            conn = new DBConnect.DBConnection().connect();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public Account oldPass(String idCompany) {
        Account us = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Account WHERE AccountId =?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString("AccountID"),
                        rs.getString("Email"), rs.getString("Password"));
            };

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return us;
    }

    public String changePassword(String id, String confirm) {
        int count = 0;
        try {
            // Update Account table
            ps = conn.prepareStatement("UPDATE Account SET Password = ? where AccountId = ?");
            ps.setString(1, getMd5(confirm));
            ps.setString(2, id);
            count += ps.executeUpdate();

            // Update Company table
            ps = conn.prepareStatement("UPDATE Company SET Password = ? where IDCompany= ?");
            ps.setString(1, getMd5(confirm));
            ps.setString(2, id);
            count += ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : confirm;
    }

    public void insertAccount(Company company) {
        String oldIdCompany = getUserFirst();
        AutoID id = new AutoID();
        String newidCompany = id.setAutoId(oldIdCompany);

        try {
            String sql = "Insert into Account Values (?,  ?,  ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidCompany);
            ps.setString(2, company.getEmail());
            ps.setString(3, getMd5(company.getPassword()));

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
      public void insertStatusAccount(Company company) {
        String oldIdCompany = getUserFirst();
        AutoID id = new AutoID();
        String newidCompany = id.setAutoId(oldIdCompany);

        try {
            String sql = "Insert into statusAccount Values (?,  ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidCompany);
            ps.setInt(2,1);
            

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void insertAccount(Employee employee) {
        String oldIdEmployee = getEmployeeFirst();
        AutoID id = new AutoID();
        String newidEmployee = id.setAutoId(oldIdEmployee);

        try {
            String sql = "Insert into Account Values (?,  ?,  ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidEmployee);
            ps.setString(2, employee.getEmail());
            ps.setString(3, getMd5(employee.getPassword()));

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }
     public void insertStatusAccount(Employee employee) {
        String oldIdEmployee = getEmployeeFirst();
        AutoID id = new AutoID();
        String newidEmployee = id.setAutoId(oldIdEmployee);

        try {
            String sql = "Insert into statusAccount Values (?,  ?)";

            // Prepare the statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, newidEmployee);
            ps.setInt(2, 1);
            

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public Account checkLogin(String email, String password) {
        Account staff = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Email = ? and Password = ? ");
            ps.setString(1, email);
            ps.setString(2, getMd5(password));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                staff = new Account(rs.getString("AccountID"),
                        rs.getString("Email"), rs.getString("Password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return staff;
    }

    public Company loginCompany(String email, String password) {
        Company cus = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Company where Email = ? and Password = ? ");
            ps.setString(1, email);
            ps.setString(2, getMd5(password));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return cus = new Company(rs.getString(1), // IdPost
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
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    public Account checkMail(String email) {
        Account staff = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from Account where Email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                staff = new Account(rs.getString("AccountID"),
                        rs.getString("Email"), rs.getString("Password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return staff;
    }

    public String forgotPassword(String confirm, String email) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Account SET Password = ? where Email = ? ");
            ps.setString(1, getMd5(confirm));
            ps.setString(2, email);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : confirm;
    }

    public void deleteAccount(String id) {

        String query = " DELETE FROM [dbo].[Account]\n"
                + "      WHERE AccountID = ?";
        try {
            conn = DBConnection.connect();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countAccount(String key) {
        String query = "select COUNT(AccountID) as number from Account where AccountID like ?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    public int checkAccount(String Id) {
        String query = "select statusAccount from statusAccount where AccountID =  ?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    public List<statusAccount> showListAccountCompany() {
        List<statusAccount> list = new ArrayList<>();
        String query = "select * from statusAccount where AccountID like '%C%' order by AccountID DESC";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new statusAccount(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<statusAccount> showListAccountEmployee() {
        List<statusAccount> list = new ArrayList<>();
        String query = "select * from statusAccount where AccountID like '%E%' order by AccountID DESC";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new statusAccount(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public void setAccount(String Id) {
        String query = "update statusAccount \n"
                + "set statusAccount = 0\n"
                + "where AccountId=?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            System.out.println();
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unlockAccount(String Id) {
        String query = "update statusAccount \n"
                + "set statusAccount = 1\n"
                + "where AccountId=?";
        try {
            conn = new DBConnect.DBConnection().connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, Id);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
