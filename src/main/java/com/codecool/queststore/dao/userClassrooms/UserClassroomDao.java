package com.codecool.queststore.dao.userClassrooms;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserClassroomDao extends PostgreSqlJDBC implements Dao<UserClassroom> {

    public UserClassroomDao(String url, String user, String password) {
        super(url, user, password);
    }

    public UserClassroomDao() {
        super();
    }

    @Override
    public List<UserClassroom> get(String condition) {
        List<UserClassroom> userClassrooms = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(String.format("SELECT * FROM user_classrooms WHERE %s;",condition));
            userClassrooms = createUserClassrooms(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userClassrooms;
    }

    private List<UserClassroom> createUserClassrooms(ResultSet resultSet) throws SQLException {
        List<UserClassroom> userClassroomList = new ArrayList<>();
        UserClassroom userClassroom;
        while (resultSet.next()) {
            int userId = resultSet.getInt("user_id");
            int classroomId = resultSet.getInt("classroom_id");
            userClassroom = new UserClassroom().setUserId(userId).setClassroomId(classroomId);
            userClassroomList.add(userClassroom);
        }
        return userClassroomList;
    }

    @Override
    public boolean insert(UserClassroom userClassroom) {
        try {
            String insertTemplate = "INSERT INTO user_classrooms (user_id, classroom_id) VALUES (?,?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setInt(1, userClassroom.getUserId());
            preparedStatement.setInt(2, userClassroom.getClassroomId());
            ResultSet resultSet = preparedStatement.executeQuery();
            preparedStatement.close();
            resultSet.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(UserClassroom userClassroom) {
        try {
            String updateTemplate = "UPDATE user_classrooms SET classroom_id=? WHERE user_id=?;";
            PreparedStatement preparedStatement = getConnection()
                    .prepareStatement(updateTemplate);
            preparedStatement.setInt(1, userClassroom.getClassroomId());
            preparedStatement.setInt(2, userClassroom.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();
            preparedStatement.close();
            resultSet.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(UserClassroom userClassroom) {
        try {
            String deleteTemplate = "DELETE FROM user_classrooms WHERE user_id=? AND classroom_id=?;";
            PreparedStatement preparedStatement = getConnection()
                    .prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, userClassroom.getUserId());
            preparedStatement.setInt(2, userClassroom.getClassroomId());
            ResultSet resultSet = preparedStatement.executeQuery();
            preparedStatement.close();
            resultSet.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
