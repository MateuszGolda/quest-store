package com.codecool.queststore.dao.balance;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BalanceDao extends PostgreSqlJDBC implements Dao<Balance> {

    public BalanceDao(String url, String user, String password) {
        super(url, user, password);
    }

    public BalanceDao() {
        super();
    }

    @Override
    public List<Balance> get(String condition) {
        List<Balance> balances = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM balance WHERE %s;", condition));
            balances = createBalancesFromResultSet(resultSet);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balances;
    }

    private List<Balance> createBalancesFromResultSet(ResultSet resultSet) throws SQLException {
        List<Balance> balanceList = new ArrayList<>();
        Balance balance;
        while (resultSet.next()) {
            int userId = resultSet.getInt("user_id");
            int amount = resultSet.getInt("amount");
            int totalEarned = resultSet.getInt("total_earned");
            balance = new Balance().setUserId(userId).setAmount(amount).setTotalEarned(totalEarned);
            balanceList.add(balance);
        }
        return balanceList;
    }

    @Override
    public boolean insert(Balance balance) {
        try {
            String insertTemplate = "INSERT INTO balance (user_id, amount, total_earned) " +
                    "VALUES (?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setInt(1, balance.getUserId());
            preparedStatement.setInt(2, balance.getAmount());
            preparedStatement.setInt(3, balance.getTotalEarned());
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
    public boolean update(Balance balance) {
        try {
            String updateTemplate = "UPDATE balance " +
                    "SET amount=?, total_earned=? " +
                    "WHERE user_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setInt(1, balance.getAmount());
            preparedStatement.setInt(2, balance.getTotalEarned());
            preparedStatement.setInt(3, balance.getUserId());

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
    public boolean delete(Balance balance) {
        try {
            String deleteTemplate = "DELETE FROM balance WHERE user_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setInt(1, balance.getUserId());
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
