package com.codecool.queststore.dao.classrooms;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClassroomDao extends PostgreSqlJDBC implements Dao<Classroom> {

    public ClassroomDao(String url, String user, String password) {
        super(url, user, password);
    }

    public ClassroomDao() {
        super();
    }

    @Override
    public List<Classroom> get(String condition) {
        List<Classroom> classrooms = new ArrayList<>();
        try {
            Statement statement = getConnection()
                    .createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM classrooms WHERE %s;", condition));
            classrooms = createClassroomsFromResultSet(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classrooms;
    }

    private List<Classroom> createClassroomsFromResultSet(ResultSet resultSet) throws SQLException {
        List<Classroom> classrooms = new ArrayList<>();
        while (resultSet.next()) {
            classrooms.add(new Classroom().setId(resultSet.getInt("id"))
                    .setName(resultSet.getString("name")));
        }
        return classrooms;
    }

    @Override
    public boolean insert(Classroom classroom) {
        try {
            String insertTemplate = "INSERT INTO classrooms (name) VALUES (?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, classroom.getName());
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
    public boolean update(Classroom classroom) {
        try {
            String updateTemplate = "UPDATE classrooms SET name=? WHERE id=?";
            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setString(1, classroom.getName());
            preparedStatement.setInt(2, classroom.getId());
            preparedStatement.setString(3,classroom.getName());
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
    public boolean delete(Classroom classroom) {
        try {
            String deleteTemplate = "DELETE FROM classrooms WHERE id=? AND name='?';";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, classroom.getId());
            preparedStatement.setString(2, classroom.getName());
            preparedStatement.close();
            closeConnection();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
