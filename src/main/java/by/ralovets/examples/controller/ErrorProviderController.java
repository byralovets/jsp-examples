package by.ralovets.examples.controller;

import by.ralovets.examples.exception.BadRequestException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ErrorProviderController", urlPatterns = "/error-provider")
public class ErrorProviderController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        throw new BadRequestException("Пользователь ввёл некорректные данные формы");
    }
}
