package by.ralovets.examples.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "JavaExceptionProviderController", urlPatterns = "/java-exception")
public class JavaExceptionProviderController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        throw new ServletException("Исключение jakarta.servlet.ServletException");
    }
}
