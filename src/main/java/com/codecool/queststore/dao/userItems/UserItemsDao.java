package com.codecool.queststore.dao.userItems;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserItemsDao extends PostgreSqlJDBC implements Dao<UserItems> {

    public UserItemsDao(String url, String user, String password) {
        super(url, user, password);
    }

    public UserItemsDao() {
        super();
    }

    @Override
    public List<UserItems> get(String condition) {
        String query = String.format("SELECT * FROM user_items WHERE %s;", condition);
        List<UserItems> userItems = new ArrayList<>();
        try (PreparedStatement stmt = getConnection().prepareStatement(query)
        ) {
            ResultSet results = stmt.executeQuery();
            fillList(results, userItems);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userItems;
    }

    private void fillList(ResultSet results, List<UserItems> userItems) throws SQLException {
        while (results.next()) {
            UserItems userItem = createUserItems(results);
            userItems.add(userItem);
        }
    }

    private UserItems createUserItems(ResultSet results) throws SQLException {
        UserItems userItems = new UserItems();
        userItems.setId(results.getInt("id"))
                .setItemId(results.getInt("item_id"))
                .setUserId(results.getInt("user_id"))
                .setBoughtDate(results.getDate("bought_date"))
                .setUsed(results.getBoolean("is_used"));
        return userItems;
    }

    @Override
    public boolean insert(UserItems userItems) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "INSERT INTO user_items (item_id, user_id, bought_date, is_used)" +
                            " VALUES (?, ?, ?, ?);");
            stmt.setInt(1, userItems.getItemId());
            stmt.setInt(2, userItems.getUserId());
            stmt.setDate(3, userItems.getBoughtDate());
            stmt.setBoolean(4, userItems.isUsed());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean update(UserItems userItems) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "UPDATE user_items SET item_id = ?, user_id = ?, bought_date = ?, is_used = ? WHERE id = ?;");
            stmt.setInt(1, userItems.getItemId());
            stmt.setInt(2, userItems.getUserId());
            stmt.setDate(3, userItems.getBoughtDate());
            stmt.setBoolean(4, userItems.isUsed());
            stmt.setInt(5, userItems.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(UserItems userItem) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "DELETE FROM user_items WHERE id = ?;");
            stmt.setInt(1, userItem.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }
}
