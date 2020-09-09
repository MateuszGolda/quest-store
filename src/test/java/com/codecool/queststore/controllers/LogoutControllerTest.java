package com.codecool.queststore.controllers;

import com.codecool.queststore.control.services.SessionService;
import com.codecool.queststore.dao.user.User;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.times;

@ExtendWith(MockitoExtension.class)
class LogoutControllerTest {

    @Mock
    static SessionService sessionService;

    @Mock
    static HttpExchange httpExchange;

    @InjectMocks
    static LogoutController logoutController;

    static Headers headers;
    static User user;

    @BeforeEach
    void setUp() {
        headers = new Headers();
    }

    @Test
    void should_RedirectToLoginPage_when_NoEndpointProvided() throws IOException {
        when(httpExchange.getRequestMethod()).thenReturn("GET");
        when(httpExchange.getRequestHeaders()).thenReturn(headers);
        when(httpExchange.getResponseHeaders()).thenReturn(headers);

        logoutController.handle(httpExchange);
        assertAll(
                () -> verify(httpExchange, times(1)).getRequestMethod(),
                () -> verify(httpExchange, times(1)).sendResponseHeaders(302, 0)
//                () -> verify(outputStream, times(1)).write(any()),
//                () -> verify(outputStream, times(1)).close()
        );

    }
}