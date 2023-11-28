package by.ralovets.examples.exception;

import jakarta.servlet.http.HttpServletResponse;

public class UnauthorizedException extends GenericHttpException {

    private static final int code = HttpServletResponse.SC_UNAUTHORIZED;

    public UnauthorizedException(String message) {
        super(message, code);
    }
}
