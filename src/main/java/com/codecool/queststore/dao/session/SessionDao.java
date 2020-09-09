package com.codecool.queststore.dao.session;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionDao extends PostgreSqlJDBC implements Dao<Session> {
    public SessionDao(String url, String user, String password) {
        super(url, user, password);
    }

    public SessionDao() {
    }

    @Override
    public List<Session> get(String condition) {
        List<Session> sessions = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(
                    String.format("SELECT * FROM sessions WHERE %s;", condition));
            fillListFrom(resultSet, sessions);
            statement.close();
            resultSet.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    private void fillListFrom(ResultSet resultSet, List<Session> sessions) throws SQLException {
        while(resultSet.next()) {
            sessions.add(new Session(resultSet.getString("session_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getTimestamp("login_timestamp"),
                    resultSet.getTimestamp("logout_timestamp"),
                    resultSet.getBoolean("is_active")));
        }
    }

    @Override
    public boolean insert(Session session) {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            long fiveMinutesMillis = 300000L;
            String insertTemplate = "INSERT INTO sessions (session_id, user_id, " +
                    "login_timestamp, logout_timestamp, is_active) " +
                    "VALUES (?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = getConnection().prepareStatement(insertTemplate);
            preparedStatement.setString(1, session.getSessionId());
            preparedStatement.setInt(2, session.getUserId());
            preparedStatement.setTimestamp(3, new Timestamp(currentTimeMillis));
            preparedStatement.setTimestamp(4, new Timestamp(currentTimeMillis + fiveMinutesMillis));
            preparedStatement.setBoolean(5, true);
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
    public boolean update(Session session) {
        try {
            String updateTemplate = "UPDATE sessions " +
                    "SET login_timestamp=?, logout_timestamp=?, is_active=? " +
                    "WHERE session_id=? AND user_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(updateTemplate);
            preparedStatement.setTimestamp(1, session.getLoginTimestamp());
            preparedStatement.setTimestamp(2, session.getLogoutTimestamp());
            preparedStatement.setBoolean(3, session.isActive());
            preparedStatement.setString(4, session.getSessionId());
            preparedStatement.setInt(5, session.getUserId());
            preparedStatement.execute();
            preparedStatement.close();
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Session session) {
        try {
            String deleteTemplate = "UPDATE sessions " +
                    "SET is_active='false' " +
                    "WHERE session_id=?;";
            PreparedStatement preparedStatement = getConnection().prepareStatement(deleteTemplate);
            preparedStatement.setString(1, session.getSessionId());
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
