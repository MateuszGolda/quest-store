package com.codecool.queststore.dao.user;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends PostgreSqlJDBC implements Dao<User> {

    public UserDao() {
        super();
    }

    public UserDao(String url, String user, String password) {
        super(url, user, password);
    }

    @Override
    public List<User> get(String condition) {
        String query = String.format("SELECT * FROM users WHERE %s;", condition);
        List<User> users = new ArrayList<>();
        try (PreparedStatement stmt = getConnection().prepareStatement(query)
        ) {
            ResultSet results = stmt.executeQuery();
            fillList(results, users);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    private void fillList(ResultSet results, List<User> users) throws SQLException {
        while (results.next()) {
            User user = createUser(results);
            users.add(user);
        }
    }

    private User createUser(ResultSet results) throws SQLException {
        User user = new User();
        user.setId(results.getInt("id"))
                .setName(results.getString("name"))
                .setSurname(results.getString("surname"))
                .setEmail(results.getString("email"))
                .setActive(results.getBoolean("is_active"))
                .setPassword(results.getString("password"))
                .setIdRole(results.getInt("id_role"));
        return user;
    }

    @Override
    public boolean insert(User user) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "INSERT INTO users (name, surname, password, email, id_role, is_active)" +
                            " VALUES (?, ?, ?, ?, ?, ?);");
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getEmail());
            stmt.setInt(5, user.getIdRole());
            stmt.setBoolean(6, user.isActive());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean update(User user) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "UPDATE users SET name = ?, surname = ?, password = ?, email = ?, id_role = ?, is_active = ? WHERE id = ?;");
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getEmail());
            stmt.setInt(5, user.getIdRole());
            stmt.setBoolean(6, user.isActive());
            stmt.setInt(7, user.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(User user) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "DELETE FROM users WHERE id = ?;");
            stmt.setInt(1, user.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }
}
