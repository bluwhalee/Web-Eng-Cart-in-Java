import java.sql.*;

public class orderDAO {
    Connection con = null;
    private static orderDAO oa = new orderDAO();


    private orderDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            con = DriverManager.getConnection(url, "root", "root");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static orderDAO getOD() {
        return oa;
    }

    public int addorder(String medicine, int quantity, String username) {
        int rs = 1;

        try {
            String query1 = "INSERT INTO orders(medicine, quantity, username) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, medicine);
            ps.setInt(2, quantity);
            ps.setString(3, username);
            rs = ps.executeUpdate();


            query1 = "Select * from med where name=?";
            ps = con.prepareStatement(query1);
            ps.setString(1, medicine);
            ResultSet rs1 = ps.executeQuery();
            int q = 1;
            if (rs1.next()) {
                q = rs1.getInt("quantity");
                q = q - quantity;
            }
            query1 = "UPDATE med SET quantity = ?  WHERE name = ? ";
            ps = con.prepareStatement(query1);
            ps.setInt(1, q);
            ps.setString(2, medicine);
            ps.executeUpdate();


        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }

}