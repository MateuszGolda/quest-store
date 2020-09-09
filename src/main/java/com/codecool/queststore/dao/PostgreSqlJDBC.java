package com.codecool.queststore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgreSqlJDBC {
    private static Connection connection = null;
    private final String url;
    private final String user;
    private final String password;


    public PostgreSqlJDBC(){
        url = "jdbc:postgresql://ec2-54-75-244-161.eu-west-1.compute.amazonaws.com:5432/da9vidtssmmkj9?sslmode=require";
        user = "psvvypnkwffifs";
        password = "5a21cf41def123115cdeaaa367e70f31907b2b0b73a1f643b212e2e8bf097327";
    }

    public PostgreSqlJDBC(String url, String user, String password){
        this.url = url;
        this.user = user;
        this.password = password;
    }


    public Connection getConnection() {
        try {
            connection = DriverManager.getConnection(url, user, password); // set user and password
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            throw new RuntimeException("Couldn't open database");
        }
        System.out.println("Opened database successfully");

        return connection;
    }

    public void closeConnection() throws SQLException {
        connection.close();
        connection = null;
    }
}
