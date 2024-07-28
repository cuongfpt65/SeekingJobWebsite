/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import AutoID.AutoID;
import DBConnect.DBConnection;
import Model.Post;
import Model.ViewPost;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Van Chien Ce170237
 */
public class PostDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();

        String query = "SELECT p.*\n" +
"                               FROM Post p\n" +
"                                  JOIN statusPost s ON p.Id = s.Id\n" +
"                                  WHERE s.statusPost = 1 AND s.HidenPost = 0  ";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));

            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<String> getAllNameCompanyOfPost() {
        List<String> nameCompany = new ArrayList<>();
        String query = "SELECT  c.NameCompany\n"
                + "                FROM Post p\n"
                + "               JOIN statusPost s ON p.Id = s.Id\n"
                + "			   join Company c On c.IDCompany = p.IdCompany\n"
                + "               WHERE s.statusPost = 1 AND s.HidenPost = 0";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                nameCompany.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return nameCompany;
    }

    public List<Post> getAllPostFilter() {
        List<Post> list = new ArrayList<>();

        String query = "WITH RankedRows AS (\n"
                + "    SELECT *,\n"
                + "           ROW_NUMBER() OVER (PARTITION BY major ORDER BY id) AS rn\n"
                + "    FROM Post\n"
                + ")\n"
                + "SELECT *\n"
                + "FROM RankedRows\n"
                + "WHERE rn = 1 and major!=''\n"
                + "ORDER BY id;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Post> getAllPostByIdCompany(String IdCompany) {
        List<Post> list = new ArrayList<>();

        String query = "SELECT * FROM post WHERE Id NOT IN (SELECT id FROM Draft) And IdCompany = ? order by id desc";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Post> getFillterSearch(String Fillter) {
        List<Post> list = new ArrayList<>();
        String query = "";
        if (Fillter.isEmpty()) {
            query = " SELECT p.*\n"
                    + "                   FROM Post p\n"
                    + "                  JOIN statusPost s ON p.Id = s.Id\n"
                    + "                  WHERE s.statusPost = 1 AND s.HidenPost = 0 ";

        } else {
            query = "SELECT p.*\n"
                    + "FROM Post p\n"
                    + "JOIN statusPost s ON p.Id = s.Id\n"
                    + "WHERE (s.statusPost = 1 AND s.HidenPost = 0) and ("
                    +  Fillter +")";
        }
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)
                // Major
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Post> getAllDraftPost() {
        List<Post> list = new ArrayList<>();

        String query = "SELECT p.* FROM Post p INNER JOIN Draft d ON p.Id = d.id order by id desc";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Post> getAllDraftPostByIdCompany(String IdCompany) {
        List<Post> list = new ArrayList<>();

        String query = "SELECT p.* FROM Post p INNER JOIN Draft d ON p.Id = d.id And IdCompany = ? order by id desc";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public int[] getPostDay(String idCompany) {
        LocalDate currentDate = LocalDate.now();
        LocalDate dateBefore7Days = currentDate.minusDays(7);

        List<Date> listDate = new ArrayList<>();
        for (int i = 1; i < 8; i++) {
            Date day = Date.valueOf(dateBefore7Days.plusDays(i));
            listDate.add(day);
        }

        int[] list = {0, 0, 0, 0, 0, 0, 0};

        String query = "SELECT CAST(timePosted AS DATE) AS PostDate, COUNT(*) AS PostCount\n"
                + "FROM Post\n"
                + "WHERE timePosted >= DATEADD(DAY, -7, GETDATE()) and timePosted <=DATEADD(DAY, 0, GETDATE()) and IdCompany = ?\n"
                + "GROUP BY CAST(timePosted AS DATE)\n"
                + "ORDER BY PostDate ASC;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                if (listDate.indexOf(rs.getDate(1)) != -1) {
                    list[listDate.indexOf(rs.getDate(1))] = rs.getInt(2);
                }
            }
        } catch (Exception e) {
        }

        return list;
    }

    public ViewPost getTopViewPost(String idCompany) {
        String query = "SELECT TOP 1 p.Id, p.timePosted, vp.[View]\n"
                + "FROM Post p\n"
                + "INNER JOIN viewPost vp ON p.Id = vp.Id\n"
                + "WHERE p.IdCompany =? \n"
                + "  AND p.timePosted >= DATEADD(DAY, -7, GETDATE())\n"
                + "  AND p.timePosted <= GETDATE()\n"
                + "ORDER BY vp.[View] DESC";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new ViewPost(rs.getString(1), rs.getInt(3));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public List<String> getMajor() throws SQLException {
        List<String> list = new ArrayList<>();

        String query = "SELECT DISTINCT major\n"
                + "FROM Post where major!=''\n"
                + "ORDER BY major;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("major"));
            }
        } catch (Exception e) {
        }
        conn.close();
        return list;

    }

    public List<String> getLocation() throws SQLException {
        List<String> list = new ArrayList<>();

        String query = "SELECT DISTINCT location\n"
                + "FROM Post where location!=''\n"
                + "ORDER BY location;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("location"));
            }
        } catch (Exception e) {
        }
        conn.close();
        return list;

    }

//Detele 
    public void deletePost(String id) {
        String query = "delete from post where id = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteDraftPost(String id) {
        String queryD = "delete from draft where id = ?";
        String queryP = "delete from Post where id = ?";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(queryD);
            ps.setString(1, id);
            ps.executeUpdate();

            ps = conn.prepareStatement(queryP);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    //------------------------------------------
    public Post getPostByID(String id) {
        String query = "select * from Post where Id = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10), //Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Post getDraftPostByID(String id) {
        String query = "select * from DraftPost where id = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getNString(12)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
//-------inserPost to update

    public void updatePost(String image, String id, String title, String description,
            String idCompany, String salary, String timePosted,
            String start, String end, String major, String jobTypes, String location) {
        String query = "UPDATE Post\n"
                + "SET [image] = ?,\n"
                + "    title = ?,\n"
                + "    description = ?,\n"
                + "    IdCompany = ?,\n"
                + "    salary = ?,\n"
                + "    timePosted = ?,\n"
                + "    start = ?,\n"
                + "    [end] = ?,\n"
                + "    major = ?,\n"
                + "    jobTypes = ?,\n"
                + "    location = ?\n"
                + "WHERE Id = ?;";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, image);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setString(4, idCompany);
            ps.setString(5, salary);
            ps.setString(6, timePosted);
            ps.setString(7, start);
            ps.setString(8, end);
            ps.setString(9, major);
            ps.setString(10, jobTypes);
            ps.setString(11, location);
            ps.setString(12, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // Log the exception to find out the root cause
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

    public void inserPost(String Id, String Title, String Description,
            String IDcompany, String Salary,
            String timePosted, String Start, String End, String Major, String jobTypes, String location, String image) {

        String query = "INSERT INTO Post VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
        String queryD = "INSERT INTO statusPost VALUES (?,?,?);";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, Id);
            ps.setString(2, Title);
            ps.setString(3, Description);
            ps.setString(4, IDcompany);
            ps.setString(5, Salary);
            ps.setString(6, timePosted);
            ps.setString(7, Start);
            ps.setString(8, End);
            ps.setString(9, Major);
            ps.setString(10, jobTypes);
            ps.setString(11, location);
            ps.setString(12, image);
            ps.executeUpdate();

            ps = conn.prepareStatement(queryD);
            ps.setString(1, Id);
            ps.setInt(2, 0);
            ps.setInt(3, 0);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void inserDraftPost(String Id, String Title, String Description,
            String Idcompany, String Salary,
            String timePosted, String Start, String End, String Major, String jobTypes, String location, String image) {

        String queryP = "INSERT INTO Post VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
        String queryD = "INSERT INTO Draft (Id) VALUES (?);";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(queryP);

            ps.setString(1, Id);
            ps.setString(2, Title);
            ps.setString(3, Description);
            ps.setString(4, Idcompany);
            ps.setString(5, Salary);
            ps.setString(6, timePosted);
            ps.setString(7, Start);
            ps.setString(8, End);
            ps.setString(9, Major);
            ps.setString(10, jobTypes);
            ps.setString(11, location);
            ps.setString(12, image);
            ps.executeUpdate();

            ps = conn.prepareStatement(queryD);
            ps.setString(1, Id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Post AutoID(String id) {
        String queryId = "select top 1 * from Post order by id desc";

        AutoID aid = new AutoID();

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(queryId);
            rs = ps.executeQuery();

            while (rs.next()) {
                String lastId = rs.getString("id");
                String newId = aid.setAutoId(lastId);

                Post post = new Post();
                post.setId(newId);
                return post;
            }

        } catch (Exception e) {

        }

        return null;
    }

    public void transferDraftToPost(String id) {

        String query = "DELETE FROM Draft WHERE id = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);

            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public ViewPost getViewPost(String postId) {
        String query = "select * from ViewPost where id = ?";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, postId);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new ViewPost(
                        rs.getString(1), // IdPost
                        rs.getInt(2) // Title                     
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void setViewPost(String postId) {
        ViewPost post = getViewPost(postId);
        if (post != null) {
            int newViewPost = post.getViewPost() + 1;
            String query = "UPDATE ViewPost\n"
                    + "SET [View] = ?\n"
                    + "WHERE Id = ?;";
            try {
                conn = DBConnection.connect();
                ps = conn.prepareStatement(query);

                ps.setInt(1, newViewPost);
                ps.setString(2, postId);

                ps.executeUpdate();

            } catch (Exception e) {
                System.out.println(e);
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
        } else {
            createViewPost(postId);
        }

    }

    public int getTotalPost(String IdCompany) {
        String query = "SELECT count(*) FROM [dbo].[Post] WHERE [IdCompany]= ?;";
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


    public List<Post> pagingPost(int index) {
        List<Post> list = new ArrayList<>();

        String query = "SELECT p.*\n" +
"                               FROM Post p\n" +
"                                  JOIN statusPost s ON p.Id = s.Id\n" +
"                                  WHERE s.statusPost = 1 AND s.HidenPost = 0 ORDER BY Id OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public void createViewPost(String postId) {
        String queryP = "INSERT INTO ViewPost VALUES(?,?)";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(queryP);
            ps.setString(1, postId);
            ps.setInt(2, 1);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Post> getAllPostChecking() {
        List<Post> list = new ArrayList<>();

        String query = "SELECT p.*\n"
                + "FROM post p\n"
                + "JOIN statusPost s ON p.id = s.id\n"
                + "LEFT JOIN Draft d ON p.id = d.id\n"
                + "WHERE d.id IS NULL\n"
                + "  AND s.statusPost = 0;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<String> getAllnameCompanyPostChecking() {
        List<String> list = new ArrayList<>();

        String query = "SELECT c.NameCompany\n"
                + "FROM post p\n"
                + "JOIN statusPost s ON p.id = s.id \n"
                + "JOIN Company c ON p.IdCompany = c.IdCompany\n"
                + "LEFT JOIN Draft d ON p.id = d.id\n"
                + "WHERE d.id IS NULL\n"
                + "  AND s.statusPost = 0;";
        try {

            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public void setHidenPost(String idPost) {
        String query = "UPDATE statusPost\n"
                + "SET HidenPost = 1\n"
                + "WHERE Id = ? and statusPost=1;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idPost);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
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

    public void setStatusPost(String idPost) {
        String query = "UPDATE statusPost\n"
                + "SET statusPost = 1\n"
                + "WHERE Id = ?;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idPost);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
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

    public List<Post> searchPost(String title) {
        List<Post> list = new ArrayList<>();
        String query = "SELECT * FROM post  where title  like ? order by id desc";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + title + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public List<Post> getAllPostByIdCompanyfive(String IdCompany, int page) {
        List<Post> list = new ArrayList<>();

        String query = "SELECT\n"
                + "    Post.[Id],\n"
                + "    Post.[title],\n"
                + "    Post.[description],\n"
                + "    Company.[NameCompany] AS companyName,\n"
                + "    Post.[salary],\n"
                + "    Post.[timePosted],\n"
                + "    Post.[start],\n"
                + "    Post.[end],\n"
                + "    Post.[major],\n"
                + "    Post.[jobTypes],\n"
                + "    Post.[location],\n"
                + "    Post.[image]\n"
                + "FROM [Post] AS Post\n"
                + "LEFT JOIN [Company] AS Company ON Post.IdCompany = Company.IDCompany\n"
                + "WHERE Post.Id NOT IN (SELECT id FROM [dbo].[Draft])\n"
                + "    AND Post.IdCompany = ?\n"
                + "ORDER BY Post.Id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            ps.setInt(2, (page - 1) * 5);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public List<Post> getAllPostByIdCompany(String IdCompany, int page) {
        List<Post> list = new ArrayList<>();

        String query = "SELECT\n"
                + "    Post.[Id],\n"
                + "    Post.[title],\n"
                + "    Post.[description],\n"
                + "    Company.[NameCompany] AS companyName,\n"
                + "    Post.[salary],\n"
                + "    Post.[timePosted],\n"
                + "    Post.[start],\n"
                + "    Post.[end],\n"
                + "    Post.[major],\n"
                + "    Post.[jobTypes],\n"
                + "    Post.[location],\n"
                + "    Post.[image]\n"
                + "FROM [Post] AS Post\n"
                + "LEFT JOIN [Company] AS Company ON Post.IdCompany = Company.IDCompany\n"
                + "WHERE Post.Id NOT IN (SELECT id FROM [dbo].[Draft])\n"
                + "    AND Post.IdCompany = ?\n"
                + "ORDER BY Post.Id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
            ps.setInt(2, (page - 1) * 10);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
        }

        return list;

    }
     public List<Post> getAllPostByIdCompanyFinding(String IdCompany, int page, String txt) {
        List<Post> list = new ArrayList<>();

       String query = "SELECT\n"
                + "    Post.[Id],\n"
                + "    Post.[title],\n"
                + "    Post.[description],\n"
                + "    Company.[NameCompany] AS companyName,\n"
                + "    Post.[salary],\n"
                + "    Post.[timePosted],\n"
                + "    Post.[start],\n"
                + "    Post.[end],\n"
                + "    Post.[major],\n"
                + "    Post.[jobTypes],\n"
                + "    Post.[location],\n"
                + "    Post.[image]\n"
                + "FROM [Post] AS Post\n"
                + "LEFT JOIN [Company] AS Company ON Post.IdCompany = Company.IDCompany\n"
                + "WHERE Post.Id NOT IN (SELECT id FROM [dbo].[Draft])\n"
                + "    AND Post.IdCompany = ? AND Post.title LIKE ?\n"
                + "ORDER BY Post.Id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, IdCompany);
             ps.setString(2, "%"+txt+"%");
            ps.setInt(3, (page - 1) * 10);
           
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }
         public int getTotalPostNoDraftFind(String idCompany,String txt) {
       String query = "SELECT COUNT(*)\n"
                + "FROM Post\n"
                + "WHERE IdCompany = ?\n"
                + "AND Id NOT IN (SELECT Id FROM Draft)\n"
                + "AND title LIKE ?;";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            ps.setString(2, "%"+txt+"%");
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalPostNoDraft(String idCompany) {
        String query = "SELECT COUNT(*)\n"
                + "FROM Post\n"
                + "WHERE IdCompany = ?\n"
                + "AND Id NOT IN (SELECT Id FROM Draft);";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalPostNoDraft() {
        String query = "SELECT COUNT(*)\n"
                + "FROM [Post]\n"
                + "WHERE Id NOT IN (SELECT id FROM [Draft]);";
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

    public List<Post> pagingPostNoDraftMini(int index, String id) {
        List<Post> list = new ArrayList<>();
        String query = "  	SELECT \n"
                + "    Post.[Id],\n"
                + "    Post.[title],\n"
                + "    Post.[description],\n"
                + "    Company.[NameCompany] AS companyName,\n"
                + "    Post.[salary],\n"
                + "    Post.[timePosted],\n"
                + "    Post.[start],\n"
                + "    Post.[end],\n"
                + "    Post.[major],\n"
                + "    Post.[jobTypes],\n"
                + "    Post.[location],\n"
                + "    Post.[image]\n"
                + "FROM \n"
                + "    [Post] AS Post\n"
                + "LEFT JOIN \n"
                + "    [Company] AS Company ON Post.IdCompany = Company.IDCompany\n"
                + "WHERE \n"
                + "    Post.Id NOT IN (SELECT id FROM [Draft])\n"
                + "    AND Post.Id <> ?\n"
                + "ORDER BY \n"
                + "    Post.Id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";

        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setInt(2, (index - 1) * 10);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(
                        rs.getString(1), // IdPost
                        rs.getString(2), // Title
                        rs.getString(3), // Description
                        rs.getString(4), // IdCompany
                        rs.getString(5), // Salary
                        rs.getString(6), // TimePosted
                        rs.getDate(7), // Start
                        rs.getDate(8), // End
                        rs.getString(9), // Major
                        rs.getString(10),// Job Types
                        rs.getString(11), // Location
                        rs.getString(12)
                ));
            }

        } catch (Exception e) {
        }

        return list;
    }

    public int getTotalPostOfCompanyNoDraft(String idCompany) {
        String query = "SELECT COUNT(*)\n"
                + "FROM [Post]\n"
                + "WHERE IdCompany = ?\n"
                + "AND Id NOT IN (SELECT id FROM [Draft]);";
        try {
            conn = DBConnection.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, idCompany);
            rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }
    
}
