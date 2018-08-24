package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {

    private Connection connection = null;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public User findByUsername(String username) {
        try {
            ResultSet rs = createFindQueryRS(username);
            if (!rs.next()) {
                System.out.println("its null");
                return null;
            } else {
                return new User (
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user.", e);
        }
    }

    @Override
    public Long insert(User user) {
        try {
            String query = createInsertQuery();
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new user.", e);
        }
    }

    private String createInsertQuery() {
        return "INSERT IGNORE INTO users(username, email, password) VALUES (?, ?, ?)";
    }

    private ResultSet createFindQueryRS(String username) {
        try {
            String searchQuery = "SELECT * FROM users WHERE username = ? LIMIT 1";
            PreparedStatement ps = connection.prepareStatement(searchQuery);
            ps.setString(1, username);
            return ps.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException("createFindQuery failed!", e);
        }
    }
}
