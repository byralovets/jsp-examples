package by.ralovets.examples.controller;

import by.ralovets.examples.exception.UnauthorizedException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Locale;

@WebServlet(name = "UnauthorizedProviderController", urlPatterns = "/unauthorized-provider")
public class UnauthorizedProviderController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        Locale locale = Locale.of("ru");
        resp.setLocale(locale);

        throw new UnauthorizedException("У вас нет прав доступа к этой странице");
    }
}
