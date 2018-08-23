import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {

    private Connection conn;

    public MySQLAdsDao (Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            conn = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Ad> all() {
        try {
            Statement stmt = conn.createStatement();
            String searchAllQuery = "SELECT * FROM ads";
            ResultSet rs = stmt.executeQuery(searchAllQuery);
            return buildAds(rs);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("all method did not work");
        }
    }

    public List<Ad> buildAds (ResultSet rs) {
        List<Ad> adsOut = new ArrayList<>();
        try {
            while (rs.next()) {
                adsOut.add(
                    new Ad(
                            rs.getLong("id"),
                            rs.getLong("user_id"),
                            rs.getString("title"),
                            rs.getString("description")
                    )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adsOut;
    }

    @Override
    public Long insert(Ad ad) {
        try {
            Statement statement = conn.createStatement();
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (%d, '%s', '%s')";
            String query = String.format(insertQuery, ad.getUserId(), ad.getTitle(), ad.getDescription());
            statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("insert method failed");
        }
    }
}
