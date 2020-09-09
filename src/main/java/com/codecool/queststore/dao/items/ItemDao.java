package com.codecool.queststore.dao.items;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ItemDao extends PostgreSqlJDBC implements Dao<Item> {

    public ItemDao(String url, String user, String password) {
        super(url, user, password);
    }

    public ItemDao() {
        super();
    }

    @Override
    public List<Item> get(String condition) {
        List<Item> items = new ArrayList<>();
        try {
            Statement statement = getConnection()
                    .createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM items WHERE %s;", condition));
            items = createItemsFromResultSet(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    private List<Item> createItemsFromResultSet(ResultSet resultSet) throws SQLException {
        List<Item> items = new ArrayList<>();
        while(resultSet.next()) {
            items.add(new Item().setId(resultSet.getInt("id"))
                                .setName(resultSet.getString("name"))
                                .setDescription(resultSet.getString("description"))
                                .setCost(resultSet.getInt("cost"))
                                .setCategoryId(resultSet.getInt("category_id")));
        }
        return items;
    }

    @Override
    public boolean insert(Item item) {
        try {
            String insertTemplate = "INSERT INTO items (name, description, cost, category_id) " +
                    "VALUES (?, ?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, item.getName());
            preparedStatement.setString(2, item.getDescription());
            preparedStatement.setInt(3, item.getCost());
            preparedStatement.setInt(4, item.getCategoryId());
            preparedStatement.execute();
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Item item) {
        try {
            String updateTemplate = "UPDATE items " +
                    "SET name=?, description=?, cost=?, category_id=? " +
                    "WHERE id=?;";

            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setString(1,item.getName());
            preparedStatement.setString(2, item.getDescription());
            preparedStatement.setInt(3, item.getCost());
            preparedStatement.setInt(4, item.getCategoryId());
            preparedStatement.setInt(5, item.getId());

            preparedStatement.executeUpdate();
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Item item) {
        try {
            String deleteTemplate = "DELETE FROM items " +
                    "WHERE id=? AND name=? AND description=? AND cost=? AND category_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, item.getId());
            preparedStatement.setString(2, item.getName());
            preparedStatement.setString(3, item.getDescription());
            preparedStatement.setInt(4, item.getCost());
            preparedStatement.setInt(5, item.getCategoryId());
            preparedStatement.execute();
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
