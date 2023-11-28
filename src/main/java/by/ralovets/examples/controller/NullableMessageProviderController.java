package by.ralovets.examples.controller;

import by.ralovets.examples.exception.BadRequestException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Locale;

@WebServlet(name = "NullableMessageProviderController", urlPatterns = "/unknown-error-provider")
public class NullableMessageProviderController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        Locale locale = Locale.of("en");
        resp.setLocale(locale);

        throw new BadRequestException(null);
    }
}
