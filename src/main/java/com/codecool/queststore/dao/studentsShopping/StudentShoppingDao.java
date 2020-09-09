package com.codecool.queststore.dao.studentsShopping;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentShoppingDao extends PostgreSqlJDBC implements Dao<StudentShopping> {

    public StudentShoppingDao(String url, String user, String password) {
        super(url, user, password);
    }

    public StudentShoppingDao() {
        super();
    }

    @Override
    public List<StudentShopping> get(String condition) {
        List<StudentShopping> studentsShopping = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(String.format("SELECT * FROM students_shopping WHERE %s;", condition));
            studentsShopping = createStudentsShopping(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentsShopping;
    }

    private List<StudentShopping> createStudentsShopping(ResultSet resultSet) throws SQLException {
        List<StudentShopping> studentShoppingList = new ArrayList<>();
        StudentShopping studentShopping;
        while (resultSet.next()) {
            int userId = resultSet.getInt("user_id");
            int shoppinId = resultSet.getInt("shopping_id");
            Date confirmedDate = resultSet.getDate("confirmed_date");
            boolean isConfirmed = resultSet.getBoolean("confirmed");
            studentShopping = new StudentShopping(userId,shoppinId,confirmedDate, isConfirmed);
            studentShoppingList.add(studentShopping);
        }
        return studentShoppingList;
    }

    @Override
    public boolean insert(StudentShopping studentShopping) {
        try {
            String insertTemplate = "INSERT INTO students_shopping (user_id, shopping_id, confirmed_date, confirmed) " +
                    "VALUES (?, ?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setInt(1, studentShopping.getUserId());
            preparedStatement.setInt(2, studentShopping.getShoppingId());
            preparedStatement.setDate(3, studentShopping.getConfirmedDate());
            preparedStatement.setBoolean(4, studentShopping.isConfirmed());
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
    public boolean update(StudentShopping studentShopping) {
        try {
            String updateTemplate = "UPDATE students_shopping " +
                    "SET user_id=?, shopping_id=?, confirmed_date=?, confirmed=? " +
                    "WHERE user_id=?;";

            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setInt(1, studentShopping.getUserId());
            preparedStatement.setInt(2, studentShopping.getShoppingId());
            preparedStatement.setDate(3, studentShopping.getConfirmedDate());
            preparedStatement.setBoolean(4, studentShopping.isConfirmed());
            preparedStatement.setInt(5,studentShopping.getUserId());

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
    public boolean delete(StudentShopping studentShopping) {
        try {
            String deleteTemplate = "DELETE FROM students_shopping " +
                    "WHERE user_id=? AND shopping_id=? AND confirmed_date=? AND confirmed=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, studentShopping.getUserId());
            preparedStatement.setInt(2, studentShopping.getShoppingId());
            preparedStatement.setDate(3, studentShopping.getConfirmedDate());
            preparedStatement.setBoolean(4, studentShopping.isConfirmed());
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
