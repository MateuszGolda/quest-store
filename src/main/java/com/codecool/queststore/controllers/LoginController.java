package com.codecool.queststore.controllers;

import com.codecool.queststore.control.services.LoginService;
import com.codecool.queststore.control.services.models.UserRoleType;
import com.codecool.queststore.dao.user.User;
import com.codecool.queststore.helpers.CookieHelper;
import com.codecool.queststore.view.LoginView;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.net.HttpCookie;
import java.util.Map;
import java.util.Optional;

public class LoginController extends Controller implements HttpHandler {
    private final LoginService loginService;
    private final LoginView view;

    public LoginController() {
        loginService = new LoginService();
        view = new LoginView();
    }

    public LoginController(LoginService loginService, LoginView view) {
        this.loginService = loginService;
        this.view = view;
    }

    void handleGet(HttpExchange httpExchange) throws IOException {
        Optional<User> loggedUser = getUserFromCookie(httpExchange);
        if (context.equals("")) {
            view.redirect(httpExchange, "/login");
            return;
        }
        if (loggedUser.isPresent() && context.equals("login")) {
            view.redirect(httpExchange, "/" + getUsersRole(loggedUser.get()));
            return;
        }
        if (loggedUser.isEmpty() && context.equals("login")) {
            view.sendStaticPage(httpExchange, "static/html/signInRegister.html");
        }
    }

    private String getUsersRole(User user) {
        int id = user.getIdRole();
        return UserRoleType.getById(id).toString().toLowerCase();
    }

    public String accessGetUsersRole(User user){
        return getUsersRole(user);
    }

    private Optional<User> getUserFromCookie(HttpExchange httpExchange) {
        User user = null;
        Optional<HttpCookie> cookie = CookieHelper.getSessionIdCookie(httpExchange);
        String sessionId;
        if (cookie.isPresent()) {
            sessionId = cookie.get().getValue();
            sessionId = sessionId.replace("\"", "");
            user = loginService.getLoggedUserBySessionId(sessionId).orElse(null);
        }
        return Optional.ofNullable(user);
    }

    public  Optional<User> accessGetUserFromCookie(HttpExchange httpExchange){
        return getUserFromCookie(httpExchange);
    }

    void handlePost(HttpExchange httpExchange) throws IOException {
        Map<String, String> inputs = getInputs(httpExchange);
        String email = inputs.get("email");
        String password = inputs.get("password");

        var OptionalSessionIdAndUser = loginService.login(email, password);
        if (OptionalSessionIdAndUser.isPresent()) {
            var sessionId = OptionalSessionIdAndUser.get().getKey();
            var user = OptionalSessionIdAndUser.get().getValue();

            CookieHelper.createNewCookie(httpExchange, sessionId);
            view.redirect(httpExchange, "/" + getUsersRole(user));
        } else {
            view.sendStaticPage(httpExchange, "static/html/signInRegister.html");
        }
    }
}
