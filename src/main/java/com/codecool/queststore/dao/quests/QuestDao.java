package com.codecool.queststore.dao.quests;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class QuestDao extends PostgreSqlJDBC implements Dao<Quest> {
    public QuestDao(String url, String user, String password) {
        super(url, user, password);
    }

    public QuestDao() {
        super();
    }

    @Override
    public List<Quest> get(String condition) {
        List<Quest> quests = new ArrayList<>();
        try {
            Statement statement = getConnection()
                    .createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM quests WHERE %s;", condition));
            quests = createQuestsFromResultSet(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quests;
    }

    private List<Quest> createQuestsFromResultSet(ResultSet resultSet) throws SQLException {
        List<Quest> quests = new ArrayList<>();
        while(resultSet.next()) {
            quests.add(new Quest().setId(resultSet.getInt("id"))
                                  .setName(resultSet.getString("name"))
                                  .setDescription(resultSet.getString("description"))
                                  .setCost(resultSet.getInt("money"))
                                  .setCategoryId(resultSet.getInt("category_id")));
        }
        return quests;
    }

    @Override
    public boolean insert(Quest quest) {
        try {
            String insertTemplate = "INSERT INTO quests (name, description, cost, category_id) " +
                    "VALUES (?, ?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, quest.getName());
            preparedStatement.setString(2, quest.getDescription());
            preparedStatement.setInt(3, quest.getCost());
            preparedStatement.setInt(4, quest.getCategoryId());
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
    public boolean update(Quest quest) {
        try {
            String updateTemplate = "UPDATE quests " +
                    "SET name=?, description=?, cost=?, category_id=? " +
                    "WHERE id=?;";

            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setString(1, quest.getName());
            preparedStatement.setString(2, quest.getDescription());
            preparedStatement.setInt(3, quest.getCost());
            preparedStatement.setInt(4, quest.getCategoryId());
            preparedStatement.setInt(5, quest.getId());

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
    public boolean delete(Quest quest) {
        try {
            String deleteTemplate = "DELETE FROM quests " +
                    "WHERE id=? AND name=? AND description=? AND cost=? AND category_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, quest.getId());
            preparedStatement.setString(2, quest.getName());
            preparedStatement.setString(3, quest.getDescription());
            preparedStatement.setInt(4, quest.getCost());
            preparedStatement.setInt(5, quest.getCategoryId());
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
