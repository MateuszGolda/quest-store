package com.codecool.queststore.dao.roles;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RoleDao extends PostgreSqlJDBC implements Dao<Role> {

    public RoleDao(String url, String user, String password) {
        super(url, user, password);
    }

    public RoleDao() {
        super();
    }

    @Override
    public List<Role> get(String condition) {
        List<Role> roles = new ArrayList<>();
        try {
            Statement statement = getConnection()
                    .createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM roles WHERE %s;", condition));
            roles = createRolesFromResultSet(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    private List<Role> createRolesFromResultSet(ResultSet resultSet) throws SQLException {
        List<Role> roles = new ArrayList<>();
        while (resultSet.next()) {
            roles.add(new Role(
                    resultSet.getInt("id"),
                    resultSet.getString("name")
            ));
        }
        return roles;
    }

    @Override
    public boolean insert(Role role) {
        try {
            String insertTemplate = "INSERT INTO roles (name) VALUES (?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, role.getName());
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
    public boolean update(Role role) {
        try {
            String updateTemplate = "UPDATE roles SET name=? WHERE id=?";
            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setString(1, role.getName());
            preparedStatement.setInt(2, role.getId());
            preparedStatement.setString(3,role.getName());
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
    public boolean delete(Role role) {
        try {
            String deleteTemplate = "DELETE FROM roles WHERE id=? AND name='?';";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, role.getId());
            preparedStatement.setString(2, role.getName());
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
