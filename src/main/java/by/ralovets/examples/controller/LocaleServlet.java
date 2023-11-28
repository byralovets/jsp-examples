package by.ralovets.examples.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "LocaleServlet", urlPatterns = "/locale")
public class LocaleServlet extends HttpServlet {

    public static final String LOCALE_PARAM = "value";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String localeParam = req.getParameter(LOCALE_PARAM);

        if (localeParam == null || localeParam.isBlank()) {
            resp.setLocale(Locale.getDefault());
            resp.getWriter().println("Default locale was set up");
            return;
        }

        Locale locale = Locale.of(localeParam);
        resp.setLocale(locale);

        HttpSession session = req.getSession(true);
        session.setAttribute("locale", localeParam);

        resp.getWriter().println("locale " + localeParam + " was set up");
    }
}
