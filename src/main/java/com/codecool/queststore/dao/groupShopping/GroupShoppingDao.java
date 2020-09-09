package com.codecool.queststore.dao.groupShopping;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GroupShoppingDao extends PostgreSqlJDBC implements Dao<GroupShopping> {

    public GroupShoppingDao(String url, String user, String password) {
        super(url, user, password);
    }

    public GroupShoppingDao() {
        super();
    }

    @Override
    public List<GroupShopping> get(String condition) {
        List<GroupShopping> groupShopping = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(String.format("SELECT * FROM group_shopping WHERE %s;", condition));
            groupShopping = createGroupShopping(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return groupShopping;
    }

    private List<GroupShopping> createGroupShopping(ResultSet resultSet) throws SQLException {
        List<GroupShopping> groupShoppingList = new ArrayList<>();
        GroupShopping groupShopping;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            int itemId = resultSet.getInt("item_id");
            boolean confirmed = resultSet.getBoolean("confirmed");
            Date startedDate = resultSet.getDate("started_date");
            boolean isPaid = resultSet.getBoolean("is_paid");
            Date paidDate = resultSet.getDate("paid_date");
            boolean isUsed = resultSet.getBoolean("is_used");
            groupShopping = new GroupShopping(id, itemId, confirmed, startedDate, isPaid, paidDate, isUsed);
            groupShoppingList.add(groupShopping);
        }
        return groupShoppingList;
    }

    @Override
    public boolean insert(GroupShopping groupShopping) {
        try {
            String insertTemplate = "INSERT INTO group_shopping (item_id, confirmed, started_date, is_paid, paid_date, is_used) " +
                    "VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setInt(1, groupShopping.getItemId());
            preparedStatement.setBoolean(2, groupShopping.isConfirmed());
            preparedStatement.setDate(3, groupShopping.getStartedDate());
            preparedStatement.setBoolean(4, groupShopping.isPaid());
            preparedStatement.setDate(5, groupShopping.getPaidDate());
            preparedStatement.setBoolean(6, groupShopping.isUsed());
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
    public boolean update(GroupShopping groupShopping) {
        try {
            String updateTemplate = "UPDATE group_shopping SET item_id=? AND confirmed=? " +
                    "AND started_date=? AND is_paid=? AND paid_date=? AND is_used=? WHERE id=?;";
            PreparedStatement preparedStatement = getConnection()
                    .prepareStatement(updateTemplate);
            preparedStatement.setInt(1, groupShopping.getItemId());
            preparedStatement.setBoolean(2, groupShopping.isConfirmed());
            preparedStatement.setDate(3, groupShopping.getStartedDate());
            preparedStatement.setBoolean(4, groupShopping.isPaid());
            preparedStatement.setDate(5, groupShopping.getPaidDate());
            preparedStatement.setBoolean(6, groupShopping.isUsed());
            preparedStatement.setInt(7, groupShopping.getId());
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
    public boolean delete(GroupShopping groupShopping) {
        try {
            String deleteTemplate = "DELETE FROM group_shopping WHERE id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, groupShopping.getId());
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
