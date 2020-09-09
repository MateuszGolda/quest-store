package com.codecool.queststore.controllers;

import com.codecool.queststore.control.services.LoginService;
import com.codecool.queststore.control.services.UserService;
import com.codecool.queststore.dao.session.SessionDao;
import com.codecool.queststore.dao.user.User;
import com.codecool.queststore.view.AdminView;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.junit.Ignore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.IOException;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AdminControllerTest {

    @Mock
    static LoginService loginService;

    @Mock
    static AdminView adminView;

    @Mock
    static UserService userService;

    @Mock
    static HttpExchange httpExchange;

    @InjectMocks
    static AdminController adminController;

    static Headers headers;
    static User user;

    @BeforeEach
    void setUp() {
        headers = new Headers();
        adminController = new AdminController(loginService, adminView, userService);
//        loginService = new LoginService();
    }

    @Test
    @Ignore
    void should_DisplayAdminPage_when_LoggedAsAdmin() throws IOException {
        when(httpExchange.getRequestMethod()).thenReturn("GET");
        when(httpExchange.getRequestHeaders()).thenReturn(headers);
        when(httpExchange.getResponseHeaders()).thenReturn(headers);
        Optional<User> admin = Optional.of(new User().setName("Creepy").setId(35).setIdRole(3));
        when(loginService.getLoggedUserBySessionId("")).thenReturn(admin);
        doNothing().when(loginService).extendLoginTime(admin.get());

        adminController.handle(httpExchange);

        assertAll(
                () -> verify(httpExchange, times(1)).getRequestMethod(),
                () -> verify(httpExchange, times(1)).getRequestURI()
        );
    }
}