package com.codecool.queststore.dao.categories;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao extends PostgreSqlJDBC implements Dao<Category> {

    public CategoryDao(String url, String user, String password) {
        super(url, user, password);
    }

    public CategoryDao() {
        super();
    }

    @Override
    public List<Category> get(String condition) {
        List<Category> categories = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(String.format("SELECT * FROM categories WHERE %s;",condition));
            categories = createCategories(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    private List<Category> createCategories(ResultSet resultSet) throws SQLException {
        List<Category> categories = new ArrayList<>();
        Category category;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            category = new Category().setId(id).setName(name);
            categories.add(category);
        }
        return categories;
    }

    @Override
    public boolean insert(Category category) {
        try {
            String insertTemplate = "INSERT INTO categories (name) VALUES (?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, category.getName());
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
    public boolean update(Category category) {
        try {
            String updateTemplate = "UPDATE categories SET name=? WHERE id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setString(1, category.getName());
            preparedStatement.setInt(2, category.getId());
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
    public boolean delete(Category category) {
        try {
            String deleteTemplate = "DELETE FROM categories WHERE id=? AND name='?';";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, category.getId());
            preparedStatement.setString(2, category.getName());
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
