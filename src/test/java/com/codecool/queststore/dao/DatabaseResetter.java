package com.codecool.queststore.dao;

import org.h2.tools.RunScript;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseResetter {


    private static final String URL = "jdbc:h2:~/test_db";
    private static final String USER = "test";
    private static final String PASSWORD = "";

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public void resetDatabase() throws SQLException {
        clearDB();
        Connection connection = this.getConnection();
        try {
            RunScript.execute(connection, new FileReader("src/main/resources/sql/jdbc_test_db.sql"));
            connection.close();
        } catch (IOException e) {
            connection.close();
            e.printStackTrace();
        }
    }

    public void clearDB() throws SQLException {
        Connection connection = this.getConnection();
        Statement statement = connection.createStatement();
        String query = " DROP ALL OBJECTS;";
        statement.executeUpdate(query);
        connection.close();
    }
}