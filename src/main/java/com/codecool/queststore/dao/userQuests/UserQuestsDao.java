package com.codecool.queststore.dao.userQuests;

import com.codecool.queststore.dao.Dao;
import com.codecool.queststore.dao.PostgreSqlJDBC;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserQuestsDao extends PostgreSqlJDBC implements Dao<UserQuests> {

    public UserQuestsDao(String url, String user, String password) {
        super(url, user, password);
    }

    public UserQuestsDao() {
        super();
    }

    @Override
    public List<UserQuests> get(String condition) {
        String query = String.format("SELECT * FROM user_quests WHERE %s;", condition);
        List<UserQuests> userQuests = new ArrayList<>();
        try (PreparedStatement stmt = getConnection().prepareStatement(query)
        ) {
            ResultSet results = stmt.executeQuery();
            fillList(results, userQuests);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userQuests;
    }

    private void fillList(ResultSet results, List<UserQuests> userQuests) throws SQLException {
        while (results.next()) {
            UserQuests userQuest = createUserQuests(results);
            userQuests.add(userQuest);
        }
    }

    private UserQuests createUserQuests(ResultSet results) throws SQLException {
        UserQuests userQuests = new UserQuests();
        userQuests.setId(results.getInt("id"))
                .setQuestId(results.getInt("quest_id"))
                .setUserId(results.getInt("user_id"))
                .setDoneDate(results.getDate("done_date"))
                .setAccepted(results.getBoolean("accepted"));
        return userQuests;
    }

    @Override
    public boolean insert(UserQuests userQuests) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "INSERT INTO user_quests (quest_id, user_id, done_date, accepted)" +
                            " VALUES (?, ?, ?, ?);");
            stmt.setInt(1, userQuests.getQuestId());
            stmt.setInt(2, userQuests.getUserId());
            stmt.setDate(3, userQuests.getDoneDate());
            stmt.setBoolean(4, userQuests.isAccepted());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean update(UserQuests userQuests) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "UPDATE user_quests SET quest_id = ?, user_id = ?, done_date = ?, accepted = ? WHERE id = ?;");
            stmt.setInt(1, userQuests.getQuestId());
            stmt.setInt(2, userQuests.getUserId());
            stmt.setDate(3, userQuests.getDoneDate());
            stmt.setBoolean(4, userQuests.isAccepted());
            stmt.setInt(5, userQuests.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(UserQuests userQuest) {
        try {
            PreparedStatement stmt = getConnection().prepareStatement(
                    "DELETE FROM user_quests WHERE id = ?;");
            stmt.setInt(1, userQuest.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }
}
