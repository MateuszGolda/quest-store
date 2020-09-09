package com.codecool.queststore.controllers;


import com.codecool.queststore.control.services.LoginService;
import com.codecool.queststore.control.services.UserService;
import com.codecool.queststore.control.services.models.UserRoleType;
import com.codecool.queststore.dao.user.User;
import com.codecool.queststore.view.AdminView;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class AdminController implements HttpHandler {

    private final LoginService loginService;
    private final AdminView adminView;
    private final UserService userService;

    public AdminController(){
        loginService = new LoginService();
        adminView = new AdminView();
        userService = new UserService();
    }

    public AdminController(LoginService loginService, AdminView adminView, UserService userService){
        this.loginService = loginService;
        this.adminView = adminView;
        this.userService = userService;
    }

    @Override
    public void handle(HttpExchange exchange) throws IOException {

        // path added /quest-store/admin                       GET  return admin start page
        // path added /quest-store/admin/form/new/classroom    GET  return form to provide new classroom's data
        // path added /quest-store/admin/form/new/mentor       GET  return form to provide new mentor's data
        // path added /quest-store/admin/form/current/mentor   GET  return form to edit mentor data
        // path added /quest-store/admin/template/mentors      GET  return template with all mentors
        // path added /quest-store/admin/new/classroom         POST receive classroom to add
        // path added /quest-store/admin/new/mentor            POST receive mentor to add
        // path added /quest-store/admin/current/mentor        POST receive mentor to update

        Optional<User> loggedUserOptional = validateSession(exchange);
        if (loggedUserOptional.isEmpty()) return;
        User loggedUser = loggedUserOptional.get();

        String method = exchange.getRequestMethod(); // "POST" or "GET"

        List<String> uriList = Arrays.asList(exchange.getRequestURI().getPath().split("/"));

        if (method.equals("GET")) {
            if (uriList.get(2).equals("admin") && uriList.size() == 3) {
                displayAdminMainPage(exchange, loggedUser);
                return;
            }
            switch (uriList.get(3)) {
                case "form":
                    displayForms(exchange, uriList);
                    return;
                case "template":
                    displayTemplates(exchange, uriList);
                    return;
            }

        }

        if (method.equals("POST")) {
            switch (uriList.get(3)) {
                case "new":
                    addNewObject(exchange, uriList);
                    return;
                case "current":
                    updateCurrentObject(exchange, uriList);
                    return;
            }

        }

        sendNotFoundResponse(exchange);
    }

    private void updateCurrentObject(HttpExchange exchange, List<String> uriList) {
        if (uriList.get(4).equals("mentor")) {
            updateCurrentMentor(exchange);
        }
    }

    private void addNewObject(HttpExchange exchange, List<String> uriList) {
        switch (uriList.get(4)) {
            case "classroom":
                addNewClassroom(exchange);
                return;
            case "mentor":
                addNewMentor(exchange);
        }
    }

    private void displayTemplates(HttpExchange exchange, List<String> uriList) throws IOException {
        if (uriList.get(4).equals("mentors")) {
            displayAllMentors(exchange);
        }
    }

    private void displayForms(HttpExchange exchange, List<String> uriList) throws IOException {
        if (uriList.get(4).equals("new")) {
            switch (uriList.get(5)) {
                case "classroom":
                    displayNewClassroomForm(exchange);
                    return;
                case "mentor":
                    displayNewMentorForm(exchange);
                    return;
            }
        }
        if (uriList.get(4).equals("current")) {
            if (uriList.get(5).equals("mentor")) {
                displayCurrentMentorFormToEdit(exchange);
            }
        }
    }

    private void displayAdminMainPage(HttpExchange exchange, User loggedUser) throws IOException {
        adminView.loadMainPageTemplateWithAdmin(exchange, loggedUser);
    }

    private Optional<User> validateSession(HttpExchange exchange) throws IOException {
        loginService.logoutNonActiveUsers();
        Optional<User> loggedUser = loginService.getLoggedUserBySessionId("");
        if (loggedUser.isEmpty()) {
            redirection(exchange, "/quest-store");
            return loggedUser;
        }
        loginService.extendLoginTime(loggedUser.get());
        UserRoleType userRoleType = UserRoleType.getById(loggedUser.get().getId());
        switch (userRoleType) {
            case STUDENT:
            case MENTOR:
                redirection(exchange, "/quest-store/" + userRoleType.toString().toLowerCase());
                return Optional.empty();
        }
        return loggedUser;
    }

    private void addNewClassroom(HttpExchange exchange) {
        String classroomName = ""; // todo get new classroom's classroomName from exchange
        userService.createClassroom(classroomName);
    }

    private void addNewMentor(HttpExchange exchange) {
        User newMentor = new User();
        // todo get and set new mentor's data from exchange
        userService.addMentor(newMentor);
    }

    private void updateCurrentMentor(HttpExchange exchange) {
        User updatedMentor = new User();
        // todo get and set mentor's data from exchange
        userService.editMentorProfile(updatedMentor);
    }

    private void displayNewClassroomForm(HttpExchange exchange) {
        adminView.loadNewClassroomForm(exchange);
    }

    private void displayNewMentorForm(HttpExchange exchange) {
        adminView.displayNewMentorForm(exchange);
    }

    private void displayCurrentMentorFormToEdit(HttpExchange exchange) throws IOException {
        int mentorId = 0; // todo get mentor id from exchange
        User mentorToDisplay = userService.getMentor(mentorId);
        adminView.loadTemplateWithEditMentor(exchange, mentorToDisplay);
    }

    private void displayAllMentors(HttpExchange exchange) throws IOException {
        adminView.loadTemplateWithAllMentors(exchange, userService.getAllMentors());
    }

    private void redirection(HttpExchange httpExchange, String path) throws IOException {
        httpExchange.getResponseHeaders().set("Location", path);
        httpExchange.sendResponseHeaders(302, 0);
    }

    private void sendNotFoundResponse(HttpExchange exchange) throws IOException {
        String response = "Source not found";
        exchange.sendResponseHeaders(404, response.length());
        OutputStream outputStream = exchange.getResponseBody();
        outputStream.write(response.getBytes());
        outputStream.close();
    }

}
