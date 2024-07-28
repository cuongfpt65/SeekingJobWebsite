/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBConnection;
import Model.Apply;
import Model.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class ApplyDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void CreateApply(Apply apply) {
        String query = "INSERT INTO Apply VALUES(?,?,?,?,?,?)";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            String em = apply.getEmpoyeeId();
            String po = apply.getPostId();
            ps.setString(1, apply.getApplyId());
            ps.setString(2, apply.getCvId());
            ps.setString(3, apply.getEmpoyeeId());

            ps.setString(4, apply.getCompanyId());
            ps.setString(5, apply.getPostId());
            ps.setString(6, apply.getStatus());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Insert successful");
            } else {
                System.out.println("Insert failed");
            }

            conn.commit(); // Nếu cần, hãy commit transaction
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông tin lỗi
        } finally {
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

    public List<Apply> getAllPostByIdApply(String IdCompany) {
        List<Apply> list = new ArrayList<>();

        String query = "SELECT * FROM Apply WHERE IdCompany = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Apply(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6) // TimePosted

                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Apply> searchApply(String IdCompany, String title) {
        List<Apply> list = new ArrayList<>();

        String query = "SELECT apply.*\n"
                + "FROM apply\n"
                + "WHERE apply.idCompany = ?\n"
                + "  AND apply.PostId IN (\n"
                + "    SELECT post.Id\n"
                + "    FROM post\n"
                + "    WHERE post.idCompany = ?\n"
                + "      AND post.title LIKE ?\n"
                + "  )";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            ps.setString(2, IdCompany);
            ps.setString(3, "%" + title + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Apply(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6) // TimePosted

                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Apply> searchApplyForStatus(String IdCompany, String status) {
        List<Apply> list = new ArrayList<>();

        String query = "SELECT apply.*\n"
                + "FROM apply\n"
                + "WHERE apply.idCompany = ?\n"
                + "  AND apply.PostId IN (\n"
                + "    SELECT post.Id\n"
                + "    FROM post\n"
                + "    WHERE post.idCompany = ?\n"
                + "      AND Apply.Status LIKE ?\n"
                + "  )";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            ps.setString(2, IdCompany);
            ps.setString(3, "%" + status + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Apply(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6) // TimePosted

                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public String getApply() {

        String query = "SELECT MAX(ApplyId) as id FROM Apply";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }

        return null;

    }

    public String getApplyEmail(String applyId) {

        String query = "SELECT e.Email\n"
                + "FROM Apply a\n"
                + "JOIN Employee e ON a.idEmployee = e.idEmployee\n"
                + "WHERE a.applyId = ?;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, applyId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }

        return null;

    }

    public String getApplyNameEmployee(String applyId) {

        String query = "SELECT e.FirstName\n"
                + "FROM Apply a\n"
                + "JOIN Employee e ON a.idEmployee = e.idEmployee\n"
                + "WHERE a.applyId = ?;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, applyId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }

        return null;

    }

    public String getApplyNameCompany(String applyId) {

        String query = "SELECT c.NameCompany\n"
                + "FROM Apply a\n"
                + "JOIN Company c ON a.IdCompany = c.IDCompany\n"
                + "WHERE a.applyId = ?;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, applyId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }

        return null;

    }

    public int countApplyOfCompany(String IdCompany) {

        String query = "select Count(*) as c\n"
                + "from Apply \n"
                + "where IdCompany =?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countApply() {

        String query = "select Count(*) as c\n"
                + "from Apply ";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countApplyAcceptOfCompany(String IdCompany) {

        String query = "select Count(*) as c\n"
                + "from Apply \n"
                + "where IdCompany =? and status ='Accept'";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countApplyAccept() {

        String query = "select Count(*) as c\n"
                + "from Apply \n"
                + "where status ='Accept'";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countApplyReject() {

        String query = "select Count(*) as c\n"
                + "from Apply \n"
                + "where status ='Reject'";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public int countApplyRejectOfCompany(String IdCompany) {

        String query = "select Count(*) as c\n"
                + "from Apply \n"
                + "where IdCompany =? and status ='Reject'";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public List<Apply> getAllPostByIdEmployee(String IdEmployee) {
        List<Apply> list = new ArrayList<>();

        String query = "SELECT * FROM Apply WHERE IdEmployee = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdEmployee);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Apply(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6) // TimePosted

                ));
            }
        } catch (Exception e) {
        }

        return list;

    }
     public List<Apply> getAllPostByIdEmployee(String IdEmployee, String status) {
        List<Apply> list = new ArrayList<>();

        String query = "SELECT * FROM Apply WHERE IdEmployee = ? and [status] like ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdEmployee);
         ps.setString(2, "%"+status+"%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Apply(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6) // TimePosted

                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }
     

    public boolean check(String IdEmployee, String postId) {

        String query = "SELECT * FROM Apply WHERE IdEmployee = ? and postId= ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdEmployee);
            ps.setString(2, postId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }

        return false;

    }

    public void updateApply(String ApplyId, String status) {
        String query = "UPDATE Apply Set Status = ? where ApplyId = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, status);
            ps.setString(2, ApplyId);

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);; // Log the exception to find out the root cause
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteApply(String ApplyId) {
        String query = "DELETE FROM Apply WHERE ApplyId = ?;";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, ApplyId);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);; // Log the exception to find out the root cause
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
